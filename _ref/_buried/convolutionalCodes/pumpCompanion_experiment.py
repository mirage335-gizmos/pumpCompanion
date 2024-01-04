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
from gnuradio import gr
from gnuradio.filter import firdes
from gnuradio.fft import window
import sys
import signal
from PyQt5 import Qt
from argparse import ArgumentParser
from gnuradio.eng_arg import eng_float, intx
from gnuradio import eng_notation
from gnuradio import trellis
from gnuradio import trellis, digital
import os



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
        # Blocks
        ##################################################

        self.trellis_viterbi_combined_xx_0 = trellis.viterbi_combined_fb(trellis.fsm("/usr/share/gnuradio/examples/trellis/fsm_files/awgn1o2_4.fsm"), 512, 0, (-1), 2, [1, 0, 0, 1, 0, -1, -1, 0], digital.TRELLIS_EUCLIDEAN)
        self.trellis_encoder_xx_0 =  trellis.encoder_bb(trellis.fsm("/usr/share/gnuradio/examples/trellis/fsm_files/awgn1o2_4.fsm"), 0, 0) if False else trellis.encoder_bb(trellis.fsm("/usr/share/gnuradio/examples/trellis/fsm_files/awgn1o2_4.fsm"), 0)
        self.digital_chunks_to_symbols_xx_0 = digital.chunks_to_symbols_bf([1, 0, 0, 1, 0, -1, -1, 0], 2)
        self.blocks_unpacked_to_packed_xx_0_0 = blocks.unpacked_to_packed_bb(2, gr.GR_MSB_FIRST)
        self.blocks_unpacked_to_packed_xx_0 = blocks.unpacked_to_packed_bb(8, gr.GR_LSB_FIRST)
        self.blocks_unpack_k_bits_bb_0_0_0_1 = blocks.unpack_k_bits_bb(8)
        self.blocks_packed_to_unpacked_xx_0_0 = blocks.packed_to_unpacked_bb(2, gr.GR_MSB_FIRST)
        self.blocks_packed_to_unpacked_xx_0 = blocks.packed_to_unpacked_bb(8, gr.GR_LSB_FIRST)
        self.blocks_pack_k_bits_bb_0_0_0_0 = blocks.pack_k_bits_bb(8)
        self.blocks_float_to_char_0 = blocks.float_to_char(1, 1)
        self.blocks_file_source_0_0_0 = blocks.file_source(gr.sizeof_char*1, os.path.join(os.environ['HOME'], 'Downloads', '_framed.rrf') if os.name == 'posix' else  os.path.join(os.environ['USERPROFILE'], 'Downloads', '_framed.rrf'), False, 0, 0)
        self.blocks_file_source_0_0_0.set_begin_tag(pmt.PMT_NIL)
        self.blocks_file_sink_0_0_0 = blocks.file_sink(gr.sizeof_char*1, os.path.join(os.environ['HOME'], 'Downloads', '_diag.rrf') if os.name == 'posix' else  os.path.join(os.environ['USERPROFILE'], 'Downloads', '_diag.rrf'), False)
        self.blocks_file_sink_0_0_0.set_unbuffered(False)
        self.blocks_char_to_float_0_2_0_0 = blocks.char_to_float(1, 1)


        ##################################################
        # Connections
        ##################################################
        self.connect((self.blocks_char_to_float_0_2_0_0, 0), (self.trellis_viterbi_combined_xx_0, 0))
        self.connect((self.blocks_file_source_0_0_0, 0), (self.blocks_unpack_k_bits_bb_0_0_0_1, 0))
        self.connect((self.blocks_float_to_char_0, 0), (self.blocks_unpacked_to_packed_xx_0, 0))
        self.connect((self.blocks_pack_k_bits_bb_0_0_0_0, 0), (self.blocks_file_sink_0_0_0, 0))
        self.connect((self.blocks_packed_to_unpacked_xx_0, 0), (self.blocks_char_to_float_0_2_0_0, 0))
        self.connect((self.blocks_packed_to_unpacked_xx_0_0, 0), (self.digital_chunks_to_symbols_xx_0, 0))
        self.connect((self.blocks_unpack_k_bits_bb_0_0_0_1, 0), (self.trellis_encoder_xx_0, 0))
        self.connect((self.blocks_unpacked_to_packed_xx_0, 0), (self.blocks_packed_to_unpacked_xx_0, 0))
        self.connect((self.blocks_unpacked_to_packed_xx_0_0, 0), (self.blocks_packed_to_unpacked_xx_0_0, 0))
        self.connect((self.digital_chunks_to_symbols_xx_0, 0), (self.blocks_float_to_char_0, 0))
        self.connect((self.trellis_encoder_xx_0, 0), (self.blocks_unpacked_to_packed_xx_0_0, 0))
        self.connect((self.trellis_viterbi_combined_xx_0, 0), (self.blocks_pack_k_bits_bb_0_0_0_0, 0))


    def closeEvent(self, event):
        self.settings = Qt.QSettings("GNU Radio", "pumpCompanion_experiment")
        self.settings.setValue("geometry", self.saveGeometry())
        self.stop()
        self.wait()

        event.accept()




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
