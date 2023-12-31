#!/usr/bin/env python3
# -*- coding: utf-8 -*-

#
# SPDX-License-Identifier: GPL-3.0
#
# GNU Radio Python Flow Graph
# Title: Pumpcompanion Audio Tx
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
from gnuradio.filter import firdes
import sip
from gnuradio import analog
from gnuradio import blocks
import pmt
from gnuradio import digital
from gnuradio import filter
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

class pumpCompanion_audio_tx(gr.top_block, Qt.QWidget):

    def __init__(self):
        gr.top_block.__init__(self, "Pumpcompanion Audio Tx", catch_exceptions=True)
        Qt.QWidget.__init__(self)
        self.setWindowTitle("Pumpcompanion Audio Tx")
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

        self.settings = Qt.QSettings("GNU Radio", "pumpCompanion_audio_tx")

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
        self.constel = constel = digital.qam_constellation(constellation_points=256, differential=True, mod_code='none').base()
        self.modulus = modulus = pow(2,constel.bits_per_symbol())
        self.access_key = access_key = '11100001010110101110100010010011'
        self.sps = sps = 2
        self.samp_rate = samp_rate = 44100
        self.packet_size = packet_size = 140
        self.nfilts = nfilts = int(32*(modulus/16))
        self.interpolation = interpolation = 2
        self.hdr_format = hdr_format = digital.header_format_default(access_key, 0)
        self.arity = arity = modulus

        ##################################################
        # Blocks
        ##################################################

        self.rational_resampler_xxx_0_0 = filter.rational_resampler_ccc(
                interpolation=1,
                decimation=interpolation,
                taps=[],
                fractional_bw=0)
        self.rational_resampler_xxx_0 = filter.rational_resampler_ccc(
                interpolation=interpolation,
                decimation=1,
                taps=[],
                fractional_bw=0)
        self.qtgui_sink_x_0 = qtgui.sink_c(
            1024, #fftsize
            window.WIN_BLACKMAN_hARRIS, #wintype
            0, #fc
            samp_rate, #bw
            "", #name
            True, #plotfreq
            True, #plotwaterfall
            True, #plottime
            False, #plotconst
            None # parent
        )
        self.qtgui_sink_x_0.set_update_time(1.0/10)
        self._qtgui_sink_x_0_win = sip.wrapinstance(self.qtgui_sink_x_0.qwidget(), Qt.QWidget)

        self.qtgui_sink_x_0.enable_rf_freq(False)

        self.top_layout.addWidget(self._qtgui_sink_x_0_win)
        self.qtgui_const_sink_x_0 = qtgui.const_sink_c(
            4096, #size
            "", #name
            1, #number of inputs
            None # parent
        )
        self.qtgui_const_sink_x_0.set_update_time(0.10)
        self.qtgui_const_sink_x_0.set_y_axis((-2), 2)
        self.qtgui_const_sink_x_0.set_x_axis((-2), 2)
        self.qtgui_const_sink_x_0.set_trigger_mode(qtgui.TRIG_MODE_FREE, qtgui.TRIG_SLOPE_POS, 0.0, 0, "")
        self.qtgui_const_sink_x_0.enable_autoscale(False)
        self.qtgui_const_sink_x_0.enable_grid(False)
        self.qtgui_const_sink_x_0.enable_axis_labels(True)


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
                self.qtgui_const_sink_x_0.set_line_label(i, "Data {0}".format(i))
            else:
                self.qtgui_const_sink_x_0.set_line_label(i, labels[i])
            self.qtgui_const_sink_x_0.set_line_width(i, widths[i])
            self.qtgui_const_sink_x_0.set_line_color(i, colors[i])
            self.qtgui_const_sink_x_0.set_line_style(i, styles[i])
            self.qtgui_const_sink_x_0.set_line_marker(i, markers[i])
            self.qtgui_const_sink_x_0.set_line_alpha(i, alphas[i])

        self._qtgui_const_sink_x_0_win = sip.wrapinstance(self.qtgui_const_sink_x_0.qwidget(), Qt.QWidget)
        self.top_layout.addWidget(self._qtgui_const_sink_x_0_win)
        self.digital_protocol_formatter_bb_0 = digital.protocol_formatter_bb(hdr_format, "packet_len")
        self.digital_pfb_clock_sync_xxx_0_0 = digital.pfb_clock_sync_ccf(sps, (6.28/100.0), firdes.root_raised_cosine(nfilts, nfilts, 1.0/float(sps), 0.35, 11*sps*nfilts), nfilts, ((nfilts/2)*1), 1.5, 1)
        self.digital_map_bb_0 = digital.map_bb(constel.pre_diff_code())
        self.digital_fll_band_edge_cc_0 = digital.fll_band_edge_cc(sps, 0.35, 44, (6.28/100.0))
        self.digital_diff_decoder_bb_0_0 = digital.diff_decoder_bb(modulus, digital.DIFF_DIFFERENTIAL)
        self.digital_costas_loop_cc_0 = digital.costas_loop_cc((6.28/100.0), arity, False)
        self.digital_correlate_access_code_xx_ts_0 = digital.correlate_access_code_bb_ts( '11100001010110101110100010010011',
          0, 'packet_len')
        self.digital_constellation_receiver_cb_0 = digital.constellation_receiver_cb(constel, (6.28/100.0), 0.001, 2000)
        self.digital_constellation_modulator_0_0 = digital.generic_mod(
            constellation=constel,
            differential=True,
            samples_per_symbol=sps,
            pre_diff_code=True,
            excess_bw=0.35,
            verbose=False,
            log=False,
            truncate=False)
        self.blocks_unpack_k_bits_bb_0_0 = blocks.unpack_k_bits_bb(constel.bits_per_symbol())
        self.blocks_throttle_0 = blocks.throttle(gr.sizeof_gr_complex*1, samp_rate,True)
        self.blocks_tagged_stream_mux_0 = blocks.tagged_stream_mux(gr.sizeof_char*1, 'packet_len', 0)
        self.blocks_tag_gate_0_0_0_1_0 = blocks.tag_gate(gr.sizeof_gr_complex * 1, False)
        self.blocks_tag_gate_0_0_0_1_0.set_single_key("")
        self.blocks_tag_gate_0_0_0_1 = blocks.tag_gate(gr.sizeof_gr_complex * 1, False)
        self.blocks_tag_gate_0_0_0_1.set_single_key("")
        self.blocks_tag_gate_0_0_0_0_0 = blocks.tag_gate(gr.sizeof_char * 1, False)
        self.blocks_tag_gate_0_0_0_0_0.set_single_key("")
        self.blocks_tag_gate_0_0_0_0 = blocks.tag_gate(gr.sizeof_char * 1, False)
        self.blocks_tag_gate_0_0_0_0.set_single_key("")
        self.blocks_tag_gate_0_0_0 = blocks.tag_gate(gr.sizeof_char * 1, False)
        self.blocks_tag_gate_0_0_0.set_single_key("")
        self.blocks_tag_gate_0 = blocks.tag_gate(gr.sizeof_char * 1, False)
        self.blocks_tag_gate_0.set_single_key("")
        self.blocks_stream_to_tagged_stream_0 = blocks.stream_to_tagged_stream(gr.sizeof_char, 1, packet_size, "packet_len")
        self.blocks_repack_bits_bb_1_0 = blocks.repack_bits_bb(1, 8, "packet_len", False, gr.GR_MSB_FIRST)
        self.blocks_repack_bits_bb_1 = blocks.repack_bits_bb(8, 1, "", False, gr.GR_MSB_FIRST)
        self.blocks_pack_k_bits_bb_0 = blocks.pack_k_bits_bb(8)
        self.blocks_null_sink_1_1 = blocks.null_sink(gr.sizeof_float*1)
        self.blocks_null_sink_1_0 = blocks.null_sink(gr.sizeof_float*1)
        self.blocks_null_sink_1 = blocks.null_sink(gr.sizeof_float*1)
        self.blocks_null_sink_0 = blocks.null_sink(gr.sizeof_char*1)
        self.blocks_file_source_0_0_0 = blocks.file_source(gr.sizeof_char*1, '/home/user/Downloads/_framed.rrf', False, 0, 0)
        self.blocks_file_source_0_0_0.set_begin_tag(pmt.PMT_NIL)
        self.blocks_file_sink_0_0_0 = blocks.file_sink(gr.sizeof_char*1, '/home/user/Downloads/_diag.rrf', False)
        self.blocks_file_sink_0_0_0.set_unbuffered(False)
        self.analog_agc_xx_0 = analog.agc_cc((1e-4), 1.0, 1.0)
        self.analog_agc_xx_0.set_max_gain(65536)


        ##################################################
        # Connections
        ##################################################
        self.connect((self.analog_agc_xx_0, 0), (self.digital_fll_band_edge_cc_0, 0))
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
        self.connect((self.blocks_tag_gate_0_0_0_1, 0), (self.blocks_tag_gate_0_0_0_1_0, 0))
        self.connect((self.blocks_tag_gate_0_0_0_1, 0), (self.qtgui_sink_x_0, 0))
        self.connect((self.blocks_tag_gate_0_0_0_1_0, 0), (self.rational_resampler_xxx_0_0, 0))
        self.connect((self.blocks_tagged_stream_mux_0, 0), (self.blocks_tag_gate_0_0_0_0, 0))
        self.connect((self.blocks_throttle_0, 0), (self.blocks_tag_gate_0_0_0_1, 0))
        self.connect((self.blocks_unpack_k_bits_bb_0_0, 0), (self.blocks_pack_k_bits_bb_0, 0))
        self.connect((self.digital_constellation_modulator_0_0, 0), (self.rational_resampler_xxx_0, 0))
        self.connect((self.digital_constellation_receiver_cb_0, 0), (self.blocks_null_sink_0, 0))
        self.connect((self.digital_constellation_receiver_cb_0, 1), (self.blocks_null_sink_1, 0))
        self.connect((self.digital_constellation_receiver_cb_0, 2), (self.blocks_null_sink_1_0, 0))
        self.connect((self.digital_constellation_receiver_cb_0, 3), (self.blocks_null_sink_1_1, 0))
        self.connect((self.digital_constellation_receiver_cb_0, 0), (self.digital_diff_decoder_bb_0_0, 0))
        self.connect((self.digital_constellation_receiver_cb_0, 4), (self.qtgui_const_sink_x_0, 0))
        self.connect((self.digital_correlate_access_code_xx_ts_0, 0), (self.blocks_repack_bits_bb_1_0, 0))
        self.connect((self.digital_costas_loop_cc_0, 0), (self.digital_pfb_clock_sync_xxx_0_0, 0))
        self.connect((self.digital_diff_decoder_bb_0_0, 0), (self.digital_map_bb_0, 0))
        self.connect((self.digital_fll_band_edge_cc_0, 0), (self.digital_costas_loop_cc_0, 0))
        self.connect((self.digital_map_bb_0, 0), (self.blocks_unpack_k_bits_bb_0_0, 0))
        self.connect((self.digital_pfb_clock_sync_xxx_0_0, 0), (self.digital_constellation_receiver_cb_0, 0))
        self.connect((self.digital_protocol_formatter_bb_0, 0), (self.blocks_tagged_stream_mux_0, 0))
        self.connect((self.rational_resampler_xxx_0, 0), (self.blocks_throttle_0, 0))
        self.connect((self.rational_resampler_xxx_0_0, 0), (self.analog_agc_xx_0, 0))


    def closeEvent(self, event):
        self.settings = Qt.QSettings("GNU Radio", "pumpCompanion_audio_tx")
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
        self.digital_pfb_clock_sync_xxx_0_0.update_taps(firdes.root_raised_cosine(self.nfilts, self.nfilts, 1.0/float(self.sps), 0.35, 11*self.sps*self.nfilts))

    def get_samp_rate(self):
        return self.samp_rate

    def set_samp_rate(self, samp_rate):
        self.samp_rate = samp_rate
        self.blocks_throttle_0.set_sample_rate(self.samp_rate)
        self.qtgui_sink_x_0.set_frequency_range(0, self.samp_rate)

    def get_packet_size(self):
        return self.packet_size

    def set_packet_size(self, packet_size):
        self.packet_size = packet_size
        self.blocks_stream_to_tagged_stream_0.set_packet_len(self.packet_size)
        self.blocks_stream_to_tagged_stream_0.set_packet_len_pmt(self.packet_size)

    def get_nfilts(self):
        return self.nfilts

    def set_nfilts(self, nfilts):
        self.nfilts = nfilts
        self.digital_pfb_clock_sync_xxx_0_0.update_taps(firdes.root_raised_cosine(self.nfilts, self.nfilts, 1.0/float(self.sps), 0.35, 11*self.sps*self.nfilts))

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




def main(top_block_cls=pumpCompanion_audio_tx, options=None):

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
