#!/usr/bin/env python3
# -*- coding: utf-8 -*-

#
# SPDX-License-Identifier: GPL-3.0
#
# GNU Radio Python Flow Graph
# Title: Pumpcompanion Experiment
# GNU Radio version: 3.10.5.1

from packaging.version import Version as StrictVersion

if __name__ == '__main__':
    import ctypes
    import sys
    if sys.platform.startswith('linux'):
        try:
            x11 = ctypes.cdll.LoadLibrary('libX11.so')
            x11.XInitThreads()
        except:
            print("Warning: failed to XInitThreads()")

from gnuradio import blocks
import pmt
from gnuradio import digital
from gnuradio import fec
from gnuradio import gr
from gnuradio.filter import firdes
from gnuradio.fft import window
import sys
import signal
from PyQt5 import Qt
from argparse import ArgumentParser
from gnuradio.eng_arg import eng_float, intx
from gnuradio import eng_notation



from gnuradio import qtgui

class pumpCompanion_experiment(gr.top_block, Qt.QWidget):

    def __init__(self):
        gr.top_block.__init__(self, "Pumpcompanion Experiment", catch_exceptions=True)
        Qt.QWidget.__init__(self)
        self.setWindowTitle("Pumpcompanion Experiment")
        qtgui.util.check_set_qss()
        try:
            self.setWindowIcon(Qt.QIcon.fromTheme('gnuradio-grc'))
        except:
            pass
        self.top_scroll_layout = Qt.QVBoxLayout()
        self.setLayout(self.top_scroll_layout)
        self.top_scroll = Qt.QScrollArea()
        self.top_scroll.setFrameStyle(Qt.QFrame.NoFrame)
        self.top_scroll_layout.addWidget(self.top_scroll)
        self.top_scroll.setWidgetResizable(True)
        self.top_widget = Qt.QWidget()
        self.top_scroll.setWidget(self.top_widget)
        self.top_layout = Qt.QVBoxLayout(self.top_widget)
        self.top_grid_layout = Qt.QGridLayout()
        self.top_layout.addLayout(self.top_grid_layout)

        self.settings = Qt.QSettings("GNU Radio", "pumpCompanion_experiment")

        try:
            if StrictVersion(Qt.qVersion()) < StrictVersion("5.0.0"):
                self.restoreGeometry(self.settings.value("geometry").toByteArray())
            else:
                self.restoreGeometry(self.settings.value("geometry"))
        except:
            pass

        ##################################################
        # Variables
        ##################################################
        self.H = H = fec.ldpc_H_matrix('/usr/share/gnuradio/fec/ldpc/n_0100_k_0023_gap_10.alist', 10)
        self.samp_rate = samp_rate = 44100
        self.ldpc_enc_H = ldpc_enc_H = fec.ldpc_par_mtrx_encoder_make_H(H)
        self.ldpc_dec_H = ldpc_dec_H = fec.ldpc_bit_flip_decoder.make(H.get_base_sptr(),5)

        ##################################################
        # Blocks
        ##################################################

        self.fec_puncture_xx_0_0 = fec.puncture_bb(16, 0xFEFF, 0)
        self.fec_extended_encoder_1 = fec.extended_encoder(encoder_obj_list=ldpc_enc_H, threading='ordinary', puncpat='11')
        self.fec_extended_decoder_0 = fec.extended_decoder(decoder_obj_list=ldpc_dec_H, threading='ordinary', ann=None, puncpat='11', integration_period=10000)
        self.fec_depuncture_bb_0_0 = fec.depuncture_bb(16, 0xFEFF, 0, 127)
        self.digital_map_bb_0_0_0 = digital.map_bb([-1, 1])
        self.blocks_unpack_k_bits_bb_0_0 = blocks.unpack_k_bits_bb(8)
        self.blocks_pack_k_bits_bb_0_0 = blocks.pack_k_bits_bb(8)
        self.blocks_file_source_0_0 = blocks.file_source(gr.sizeof_char*1, '/home/user/Downloads/_framed.rrf', False, 0, 0)
        self.blocks_file_source_0_0.set_begin_tag(pmt.PMT_NIL)
        self.blocks_file_sink_0_0 = blocks.file_sink(gr.sizeof_char*1, '/home/user/Downloads/_diag.rrf', False)
        self.blocks_file_sink_0_0.set_unbuffered(False)
        self.blocks_char_to_float_0_2 = blocks.char_to_float(1, 1)


        ##################################################
        # Connections
        ##################################################
        self.connect((self.blocks_char_to_float_0_2, 0), (self.fec_extended_decoder_0, 0))
        self.connect((self.blocks_file_source_0_0, 0), (self.blocks_unpack_k_bits_bb_0_0, 0))
        self.connect((self.blocks_pack_k_bits_bb_0_0, 0), (self.blocks_file_sink_0_0, 0))
        self.connect((self.blocks_unpack_k_bits_bb_0_0, 0), (self.fec_extended_encoder_1, 0))
        self.connect((self.digital_map_bb_0_0_0, 0), (self.blocks_char_to_float_0_2, 0))
        self.connect((self.fec_depuncture_bb_0_0, 0), (self.digital_map_bb_0_0_0, 0))
        self.connect((self.fec_extended_decoder_0, 0), (self.blocks_pack_k_bits_bb_0_0, 0))
        self.connect((self.fec_extended_encoder_1, 0), (self.fec_puncture_xx_0_0, 0))
        self.connect((self.fec_puncture_xx_0_0, 0), (self.fec_depuncture_bb_0_0, 0))


    def closeEvent(self, event):
        self.settings = Qt.QSettings("GNU Radio", "pumpCompanion_experiment")
        self.settings.setValue("geometry", self.saveGeometry())
        self.stop()
        self.wait()

        event.accept()

    def get_H(self):
        return self.H

    def set_H(self, H):
        self.H = H

    def get_samp_rate(self):
        return self.samp_rate

    def set_samp_rate(self, samp_rate):
        self.samp_rate = samp_rate

    def get_ldpc_enc_H(self):
        return self.ldpc_enc_H

    def set_ldpc_enc_H(self, ldpc_enc_H):
        self.ldpc_enc_H = ldpc_enc_H

    def get_ldpc_dec_H(self):
        return self.ldpc_dec_H

    def set_ldpc_dec_H(self, ldpc_dec_H):
        self.ldpc_dec_H = ldpc_dec_H




def main(top_block_cls=pumpCompanion_experiment, options=None):

    if StrictVersion("4.5.0") <= StrictVersion(Qt.qVersion()) < StrictVersion("5.0.0"):
        style = gr.prefs().get_string('qtgui', 'style', 'raster')
        Qt.QApplication.setGraphicsSystem(style)
    qapp = Qt.QApplication(sys.argv)

    tb = top_block_cls()

    tb.start()

    tb.show()

    def sig_handler(sig=None, frame=None):
        tb.stop()
        tb.wait()

        Qt.QApplication.quit()

    signal.signal(signal.SIGINT, sig_handler)
    signal.signal(signal.SIGTERM, sig_handler)

    timer = Qt.QTimer()
    timer.start(500)
    timer.timeout.connect(lambda: None)

    qapp.exec_()

if __name__ == '__main__':
    main()
