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

from PyQt5 import Qt
from gnuradio import qtgui
import sip
from gnuradio import blocks
import pmt
from gnuradio import channels
from gnuradio.filter import firdes
from gnuradio import digital
from gnuradio import gr
from gnuradio.fft import window
import sys
import signal
from argparse import ArgumentParser
from gnuradio.eng_arg import eng_float, intx
from gnuradio import eng_notation
import cmath
import math



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
        self.constel = constel = digital.constellation_calcdist([(-15-15j),(-13-15j),(-11-15j),(-9-15j),(-7-15j),(-5-15j),(-3-15j),(-1-15j),(1-15j),(3-15j),(5-15j),(7-15j),(9-15j),(11-15j),(13-15j),(15-15j),(-15-13j),(-13-13j),(-11-13j),(-9-13j),(-7-13j),(-5-13j),(-3-13j),(-1-13j),(1-13j),(3-13j),(5-13j),(7-13j),(9-13j),(11-13j),(13-13j),(15-13j),(-15-11j),(-13-11j),(-11-11j),(-9-11j),(-7-11j),(-5-11j),(-3-11j),(-1-11j),(1-11j),(3-11j),(5-11j),(7-11j),(9-11j),(11-11j),(13-11j),(15-11j),(-15-9j),(-13-9j),(-11-9j),(-9-9j),(-7-9j),(-5-9j),(-3-9j),(-1-9j),(1-9j),(3-9j),(5-9j),(7-9j),(9-9j),(11-9j),(13-9j),(15-9j),(-15-7j),(-13-7j),(-11-7j),(-9-7j),(-7-7j),(-5-7j),(-3-7j),(-1-7j),(1-7j),(3-7j),(5-7j),(7-7j),(9-7j),(11-7j),(13-7j),(15-7j),(-15-5j),(-13-5j),(-11-5j),(-9-5j),(-7-5j),(-5-5j),(-3-5j),(-1-5j),(1-5j),(3-5j),(5-5j),(7-5j),(9-5j),(11-5j),(13-5j),(15-5j),(-15-3j),(-13-3j),(-11-3j),(-9-3j),(-7-3j),(-5-3j),(-3-3j),(-1-3j),(1-3j),(3-3j),(5-3j),(7-3j),(9-3j),(11-3j),(13-3j),(15-3j),(-15-1j),(-13-1j),(-11-1j),(-9-1j),(-7-1j),(-5-1j),(-3-1j),(-1-1j),(1-1j),(3-1j),(5-1j),(7-1j),(9-1j),(11-1j),(13-1j),(15-1j),(-15+1j),(-13+1j),(-11+1j),(-9+1j),(-7+1j),(-5+1j),(-3+1j),(-1+1j),(1+1j),(3+1j),(5+1j),(7+1j),(9+1j),(11+1j),(13+1j),(15+1j),(-15+3j),(-13+3j),(-11+3j),(-9+3j),(-7+3j),(-5+3j),(-3+3j),(-1+3j),(1+3j),(3+3j),(5+3j),(7+3j),(9+3j),(11+3j),(13+3j),(15+3j),(-15+5j),(-13+5j),(-11+5j),(-9+5j),(-7+5j),(-5+5j),(-3+5j),(-1+5j),(1+5j),(3+5j),(5+5j),(7+5j),(9+5j),(11+5j),(13+5j),(15+5j),(-15+7j),(-13+7j),(-11+7j),(-9+7j),(-7+7j),(-5+7j),(-3+7j),(-1+7j),(1+7j),(3+7j),(5+7j),(7+7j),(9+7j),(11+7j),(13+7j),(15+7j),(-15+9j),(-13+9j),(-11+9j),(-9+9j),(-7+9j),(-5+9j),(-3+9j),(-1+9j),(1+9j),(3+9j),(5+9j),(7+9j),(9+9j),(11+9j),(13+9j),(15+9j),(-15+11j),(-13+11j),(-11+11j),(-9+11j),(-7+11j),(-5+11j),(-3+11j),(-1+11j),(1+11j),(3+11j),(5+11j),(7+11j),(9+11j),(11+11j),(13+11j),(15+11j),(-15+13j),(-13+13j),(-11+13j),(-9+13j),(-7+13j),(-5+13j),(-3+13j),(-1+13j),(1+13j),(3+13j),(5+13j),(7+13j),(9+13j),(11+13j),(13+13j),(15+13j),(-15+15j),(-13+15j),(-11+15j),(-9+15j),(-7+15j),(-5+15j),(-3+15j),(-1+15j),(1+15j),(3+15j),(5+15j),(7+15j),(9+15j),(11+15j),(13+15j),(15+15j)], [0, 4, 12, 8, 1, 5, 13, 9, 3, 7, 15, 11, 2, 6, 14, 10, 16, 20, 28, 24, 17, 21, 29, 25, 19, 23, 31, 27, 18, 22, 30, 26, 32, 36, 44, 40, 33, 37, 45, 41, 35, 39, 47, 43, 34, 38, 46, 42, 48, 52, 60, 56, 49, 53, 61, 57, 51, 55, 63, 59, 50, 54, 62, 58, 64, 68, 76, 72, 65, 69, 77, 73, 67, 71, 79, 75, 66, 70, 78, 74, 80, 84, 92, 88, 81, 85, 93, 89, 83, 87, 95, 91, 82, 86, 94, 90, 96, 100, 108, 104, 97, 101, 109, 105, 99, 103, 111, 107, 98, 102, 110, 106, 112, 116, 124, 120, 113, 117, 125, 121, 115, 119, 127, 123, 114, 118, 126, 122, 128, 132, 140, 136, 129, 133, 141, 137, 131, 135, 143, 139, 130, 134, 142, 138, 144, 148, 156, 152, 145, 149, 157, 153, 147, 151, 159, 155, 146, 150, 158, 154, 160, 164, 172, 168, 161, 165, 173, 169, 163, 167, 175, 171, 162, 166, 174, 170, 176, 180, 188, 184, 177, 181, 189, 185, 179, 183, 191, 187, 178, 182, 190, 186, 192, 196, 204, 200, 193, 197, 205, 201, 195, 199, 207, 203, 194, 198, 206, 202, 208, 212, 220, 216, 209, 213, 221, 217, 211, 215, 223, 219, 210, 214, 222, 218, 224, 228, 236, 232, 225, 229, 237, 233, 227, 231, 239, 235, 226, 230, 238, 234, 240, 244, 252, 248, 241, 245, 253, 249, 243, 247, 255, 251, 242, 246, 254, 250],
        4, 1, digital.constellation.AMPLITUDE_NORMALIZATION).base()
        self.modulus = modulus = pow(2,constel.bits_per_symbol())
        self.access_key = access_key = '11100001010110101110100010010011'
        self.sps = sps = 2
        self.samp_rate = samp_rate = 200000
        self.nfilts = nfilts = int(32*(modulus/16))
        self.interpolation = interpolation = 1
        self.hdr_format = hdr_format = digital.header_format_default(access_key, 0)
        self.arity = arity = modulus

        ##################################################
        # Blocks
        ##################################################

        self.qtgui_const_sink_x_0_0 = qtgui.const_sink_c(
            4096, #size
            "", #name
            1, #number of inputs
            None # parent
        )
        self.qtgui_const_sink_x_0_0.set_update_time(0.10)
        self.qtgui_const_sink_x_0_0.set_y_axis((-2), 2)
        self.qtgui_const_sink_x_0_0.set_x_axis((-2), 2)
        self.qtgui_const_sink_x_0_0.set_trigger_mode(qtgui.TRIG_MODE_FREE, qtgui.TRIG_SLOPE_POS, 0.0, 0, "")
        self.qtgui_const_sink_x_0_0.enable_autoscale(False)
        self.qtgui_const_sink_x_0_0.enable_grid(False)
        self.qtgui_const_sink_x_0_0.enable_axis_labels(True)


        labels = ['', '', '', '', '',
            '', '', '', '', '']
        widths = [1, 1, 1, 1, 1,
            1, 1, 1, 1, 1]
        colors = ["blue", "red", "red", "red", "red",
            "red", "red", "red", "red", "red"]
        styles = [0, 0, 0, 0, 0,
            0, 0, 0, 0, 0]
        markers = [0, 0, 0, 0, 0,
            0, 0, 0, 0, 0]
        alphas = [1.0, 1.0, 1.0, 1.0, 1.0,
            1.0, 1.0, 1.0, 1.0, 1.0]

        for i in range(1):
            if len(labels[i]) == 0:
                self.qtgui_const_sink_x_0_0.set_line_label(i, "Data {0}".format(i))
            else:
                self.qtgui_const_sink_x_0_0.set_line_label(i, labels[i])
            self.qtgui_const_sink_x_0_0.set_line_width(i, widths[i])
            self.qtgui_const_sink_x_0_0.set_line_color(i, colors[i])
            self.qtgui_const_sink_x_0_0.set_line_style(i, styles[i])
            self.qtgui_const_sink_x_0_0.set_line_marker(i, markers[i])
            self.qtgui_const_sink_x_0_0.set_line_alpha(i, alphas[i])

        self._qtgui_const_sink_x_0_0_win = sip.wrapinstance(self.qtgui_const_sink_x_0_0.qwidget(), Qt.QWidget)
        self.top_layout.addWidget(self._qtgui_const_sink_x_0_0_win)
        self.digital_protocol_formatter_bb_0 = digital.protocol_formatter_bb(hdr_format, "packet_len")
        self.digital_pfb_clock_sync_xxx_0 = digital.pfb_clock_sync_ccf(sps, (6.28/100.0), firdes.root_raised_cosine(nfilts, nfilts, 1.0/float(sps), 0.35, 11*sps*nfilts), nfilts, (nfilts/2), 1.5, 1)
        self.digital_map_bb_0 = digital.map_bb(constel.pre_diff_code())
        self.digital_diff_decoder_bb_0_0 = digital.diff_decoder_bb(modulus, digital.DIFF_DIFFERENTIAL)
        self.digital_correlate_access_code_xx_ts_0 = digital.correlate_access_code_bb_ts( '11100001010110101110100010010011',
          0, 'packet_len')
        self.digital_constellation_modulator_0_0 = digital.generic_mod(
            constellation=constel,
            differential=True,
            samples_per_symbol=sps,
            pre_diff_code=True,
            excess_bw=0.35,
            verbose=False,
            log=False,
            truncate=False)
        self.digital_constellation_decoder_cb_0_0 = digital.constellation_decoder_cb(constel)
        self.blocks_unpack_k_bits_bb_0_0 = blocks.unpack_k_bits_bb(constel.bits_per_symbol())
        self.blocks_throttle_0 = blocks.throttle(gr.sizeof_gr_complex*1, samp_rate,True)
        self.blocks_tagged_stream_mux_0 = blocks.tagged_stream_mux(gr.sizeof_char*1, 'packet_len', 0)
        self.blocks_tag_gate_0_0_0_0_0 = blocks.tag_gate(gr.sizeof_char * 1, False)
        self.blocks_tag_gate_0_0_0_0_0.set_single_key("")
        self.blocks_tag_gate_0_0_0_0 = blocks.tag_gate(gr.sizeof_char * 1, False)
        self.blocks_tag_gate_0_0_0_0.set_single_key("")
        self.blocks_tag_gate_0_0_0 = blocks.tag_gate(gr.sizeof_char * 1, False)
        self.blocks_tag_gate_0_0_0.set_single_key("")
        self.blocks_tag_gate_0 = blocks.tag_gate(gr.sizeof_char * 1, False)
        self.blocks_tag_gate_0.set_single_key("")
        self.blocks_stream_to_tagged_stream_0 = blocks.stream_to_tagged_stream(gr.sizeof_char, 1, 140, "packet_len")
        self.blocks_repack_bits_bb_1_0 = blocks.repack_bits_bb(1, 8, "packet_len", False, gr.GR_MSB_FIRST)
        self.blocks_repack_bits_bb_1 = blocks.repack_bits_bb(8, 1, "", False, gr.GR_MSB_FIRST)
        self.blocks_pack_k_bits_bb_0 = blocks.pack_k_bits_bb(8)
        self.blocks_file_source_0_0_0 = blocks.file_source(gr.sizeof_char*1, '/home/user/Downloads/_framed.rrf', False, 0, 0)
        self.blocks_file_source_0_0_0.set_begin_tag(pmt.PMT_NIL)
        self.blocks_file_sink_0_0_0 = blocks.file_sink(gr.sizeof_char*1, '/home/user/Downloads/_diag.rrf', False)
        self.blocks_file_sink_0_0_0.set_unbuffered(False)


        ##################################################
        # Connections
        ##################################################
        self.connect((self.blocks_file_source_0_0_0, 0), (self.blocks_stream_to_tagged_stream_0, 0))
        self.connect((self.blocks_pack_k_bits_bb_0, 0), (self.blocks_tag_gate_0, 0))
        self.connect((self.blocks_repack_bits_bb_1, 0), (self.digital_correlate_access_code_xx_ts_0, 0))
        self.connect((self.blocks_repack_bits_bb_1_0, 0), (self.blocks_file_sink_0_0_0, 0))
        self.connect((self.blocks_stream_to_tagged_stream_0, 0), (self.blocks_tagged_stream_mux_0, 1))
        self.connect((self.blocks_stream_to_tagged_stream_0, 0), (self.digital_protocol_formatter_bb_0, 0))
        self.connect((self.blocks_tag_gate_0, 0), (self.blocks_tag_gate_0_0_0_0_0, 0))
        self.connect((self.blocks_tag_gate_0_0_0, 0), (self.digital_constellation_modulator_0_0, 0))
        self.connect((self.blocks_tag_gate_0_0_0_0, 0), (self.blocks_tag_gate_0_0_0, 0))
        self.connect((self.blocks_tag_gate_0_0_0_0_0, 0), (self.blocks_repack_bits_bb_1, 0))
        self.connect((self.blocks_tagged_stream_mux_0, 0), (self.blocks_tag_gate_0_0_0_0, 0))
        self.connect((self.blocks_throttle_0, 0), (self.digital_pfb_clock_sync_xxx_0, 0))
        self.connect((self.blocks_unpack_k_bits_bb_0_0, 0), (self.blocks_pack_k_bits_bb_0, 0))
        self.connect((self.digital_constellation_decoder_cb_0_0, 0), (self.digital_diff_decoder_bb_0_0, 0))
        self.connect((self.digital_constellation_modulator_0_0, 0), (self.blocks_throttle_0, 0))
        self.connect((self.digital_correlate_access_code_xx_ts_0, 0), (self.blocks_repack_bits_bb_1_0, 0))
        self.connect((self.digital_diff_decoder_bb_0_0, 0), (self.digital_map_bb_0, 0))
        self.connect((self.digital_map_bb_0, 0), (self.blocks_unpack_k_bits_bb_0_0, 0))
        self.connect((self.digital_pfb_clock_sync_xxx_0, 0), (self.digital_constellation_decoder_cb_0_0, 0))
        self.connect((self.digital_pfb_clock_sync_xxx_0, 0), (self.qtgui_const_sink_x_0_0, 0))
        self.connect((self.digital_protocol_formatter_bb_0, 0), (self.blocks_tagged_stream_mux_0, 0))


    def closeEvent(self, event):
        self.settings = Qt.QSettings("GNU Radio", "pumpCompanion_experiment")
        self.settings.setValue("geometry", self.saveGeometry())
        self.stop()
        self.wait()

        event.accept()

    def get_constel(self):
        return self.constel

    def set_constel(self, constel):
        self.constel = constel

    def get_modulus(self):
        return self.modulus

    def set_modulus(self, modulus):
        self.modulus = modulus
        self.set_arity(self.modulus)
        self.set_nfilts(int(32*(self.modulus/16)))

    def get_access_key(self):
        return self.access_key

    def set_access_key(self, access_key):
        self.access_key = access_key
        self.set_hdr_format(digital.header_format_default(self.access_key, 0))

    def get_sps(self):
        return self.sps

    def set_sps(self, sps):
        self.sps = sps
        self.digital_pfb_clock_sync_xxx_0.update_taps(firdes.root_raised_cosine(self.nfilts, self.nfilts, 1.0/float(self.sps), 0.35, 11*self.sps*self.nfilts))

    def get_samp_rate(self):
        return self.samp_rate

    def set_samp_rate(self, samp_rate):
        self.samp_rate = samp_rate
        self.blocks_throttle_0.set_sample_rate(self.samp_rate)

    def get_nfilts(self):
        return self.nfilts

    def set_nfilts(self, nfilts):
        self.nfilts = nfilts
        self.digital_pfb_clock_sync_xxx_0.update_taps(firdes.root_raised_cosine(self.nfilts, self.nfilts, 1.0/float(self.sps), 0.35, 11*self.sps*self.nfilts))

    def get_interpolation(self):
        return self.interpolation

    def set_interpolation(self, interpolation):
        self.interpolation = interpolation

    def get_hdr_format(self):
        return self.hdr_format

    def set_hdr_format(self, hdr_format):
        self.hdr_format = hdr_format

    def get_arity(self):
        return self.arity

    def set_arity(self, arity):
        self.arity = arity




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
