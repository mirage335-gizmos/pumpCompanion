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
from gnuradio.filter import firdes
import sip
from gnuradio import analog
from gnuradio import audio
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
        # Variables
        ##################################################
        self.constel = constel = digital.qam_constellation(constellation_points=256, differential=True, mod_code='gray').base()
        self.samp_rate = samp_rate = 44100
        self.modulus = modulus = pow(2,constel.bits_per_symbol())
        self.excess_bw = excess_bw = 0.275
        self.access_key = access_key = '11111111111111111111000000000011'
        self.sps = sps = 3
        self.shift_factor = shift_factor = ((325/samp_rate)*4)+(0.5)+(excess_bw*0.5)
        self.packet_size = packet_size = 140
        self.nfilts = nfilts = int(32*(modulus/16))
        self.interpolation = interpolation = 1
        self.hdr_format = hdr_format = digital.header_format_default(access_key, 0)
        self.arity = arity = modulus

        ##################################################
        # Blocks
        ##################################################

        self.qtgui_tab_widget_0 = Qt.QTabWidget()
        self.qtgui_tab_widget_0_widget_0 = Qt.QWidget()
        self.qtgui_tab_widget_0_layout_0 = Qt.QBoxLayout(Qt.QBoxLayout.TopToBottom, self.qtgui_tab_widget_0_widget_0)
        self.qtgui_tab_widget_0_grid_layout_0 = Qt.QGridLayout()
        self.qtgui_tab_widget_0_layout_0.addLayout(self.qtgui_tab_widget_0_grid_layout_0)
        self.qtgui_tab_widget_0.addTab(self.qtgui_tab_widget_0_widget_0, 'Modem')
        self.qtgui_tab_widget_0_widget_1 = Qt.QWidget()
        self.qtgui_tab_widget_0_layout_1 = Qt.QBoxLayout(Qt.QBoxLayout.TopToBottom, self.qtgui_tab_widget_0_widget_1)
        self.qtgui_tab_widget_0_grid_layout_1 = Qt.QGridLayout()
        self.qtgui_tab_widget_0_layout_1.addLayout(self.qtgui_tab_widget_0_grid_layout_1)
        self.qtgui_tab_widget_0.addTab(self.qtgui_tab_widget_0_widget_1, 'Analog')
        self.qtgui_tab_widget_0_widget_2 = Qt.QWidget()
        self.qtgui_tab_widget_0_layout_2 = Qt.QBoxLayout(Qt.QBoxLayout.TopToBottom, self.qtgui_tab_widget_0_widget_2)
        self.qtgui_tab_widget_0_grid_layout_2 = Qt.QGridLayout()
        self.qtgui_tab_widget_0_layout_2.addLayout(self.qtgui_tab_widget_0_grid_layout_2)
        self.qtgui_tab_widget_0.addTab(self.qtgui_tab_widget_0_widget_2, 'Clock')
        self.qtgui_tab_widget_0_widget_3 = Qt.QWidget()
        self.qtgui_tab_widget_0_layout_3 = Qt.QBoxLayout(Qt.QBoxLayout.TopToBottom, self.qtgui_tab_widget_0_widget_3)
        self.qtgui_tab_widget_0_grid_layout_3 = Qt.QGridLayout()
        self.qtgui_tab_widget_0_layout_3.addLayout(self.qtgui_tab_widget_0_grid_layout_3)
        self.qtgui_tab_widget_0.addTab(self.qtgui_tab_widget_0_widget_3, 'File')
        self.qtgui_tab_widget_0_widget_4 = Qt.QWidget()
        self.qtgui_tab_widget_0_layout_4 = Qt.QBoxLayout(Qt.QBoxLayout.TopToBottom, self.qtgui_tab_widget_0_widget_4)
        self.qtgui_tab_widget_0_grid_layout_4 = Qt.QGridLayout()
        self.qtgui_tab_widget_0_layout_4.addLayout(self.qtgui_tab_widget_0_grid_layout_4)
        self.qtgui_tab_widget_0.addTab(self.qtgui_tab_widget_0_widget_4, 'TX')
        self.top_layout.addWidget(self.qtgui_tab_widget_0)
        self.qtgui_sink_x_1 = qtgui.sink_c(
            1024, #fftsize
            window.WIN_BLACKMAN_hARRIS, #wintype
            0, #fc
            samp_rate, #bw
            "", #name
            True, #plotfreq
            True, #plotwaterfall
            True, #plottime
            True, #plotconst
            None # parent
        )
        self.qtgui_sink_x_1.set_update_time(1.0/10)
        self._qtgui_sink_x_1_win = sip.wrapinstance(self.qtgui_sink_x_1.qwidget(), Qt.QWidget)

        self.qtgui_sink_x_1.enable_rf_freq(False)

        self.qtgui_tab_widget_0_layout_3.addWidget(self._qtgui_sink_x_1_win)
        self.qtgui_sink_x_0_1 = qtgui.sink_c(
            1024, #fftsize
            window.WIN_BLACKMAN_hARRIS, #wintype
            0, #fc
            samp_rate, #bw
            "", #name
            True, #plotfreq
            True, #plotwaterfall
            True, #plottime
            True, #plotconst
            None # parent
        )
        self.qtgui_sink_x_0_1.set_update_time(1.0/10)
        self._qtgui_sink_x_0_1_win = sip.wrapinstance(self.qtgui_sink_x_0_1.qwidget(), Qt.QWidget)

        self.qtgui_sink_x_0_1.enable_rf_freq(False)

        self.qtgui_tab_widget_0_layout_1.addWidget(self._qtgui_sink_x_0_1_win)
        self.qtgui_sink_x_0_0 = qtgui.sink_c(
            1024, #fftsize
            window.WIN_BLACKMAN_hARRIS, #wintype
            0, #fc
            samp_rate, #bw
            "", #name
            True, #plotfreq
            True, #plotwaterfall
            True, #plottime
            True, #plotconst
            None # parent
        )
        self.qtgui_sink_x_0_0.set_update_time(1.0/10)
        self._qtgui_sink_x_0_0_win = sip.wrapinstance(self.qtgui_sink_x_0_0.qwidget(), Qt.QWidget)

        self.qtgui_sink_x_0_0.enable_rf_freq(False)

        self.qtgui_tab_widget_0_layout_2.addWidget(self._qtgui_sink_x_0_0_win)
        self.qtgui_sink_x_0 = qtgui.sink_c(
            1024, #fftsize
            window.WIN_BLACKMAN_hARRIS, #wintype
            0, #fc
            samp_rate, #bw
            "", #name
            True, #plotfreq
            True, #plotwaterfall
            True, #plottime
            True, #plotconst
            None # parent
        )
        self.qtgui_sink_x_0.set_update_time(1.0/10)
        self._qtgui_sink_x_0_win = sip.wrapinstance(self.qtgui_sink_x_0.qwidget(), Qt.QWidget)

        self.qtgui_sink_x_0.enable_rf_freq(False)

        self.qtgui_tab_widget_0_layout_4.addWidget(self._qtgui_sink_x_0_win)
        self.qtgui_const_sink_x_0_0 = qtgui.const_sink_c(
            8192, #size
            "", #name
            1, #number of inputs
            None # parent
        )
        self.qtgui_const_sink_x_0_0.set_update_time(0.10)
        self.qtgui_const_sink_x_0_0.set_y_axis((-1.25), 1.25)
        self.qtgui_const_sink_x_0_0.set_x_axis((-1.25), 1.25)
        self.qtgui_const_sink_x_0_0.set_trigger_mode(qtgui.TRIG_MODE_FREE, qtgui.TRIG_SLOPE_POS, 0.0, 0, "")
        self.qtgui_const_sink_x_0_0.enable_autoscale(False)
        self.qtgui_const_sink_x_0_0.enable_grid(True)
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
        self.qtgui_tab_widget_0_layout_0.addWidget(self._qtgui_const_sink_x_0_0_win)
        self.freq_xlating_fft_filter_ccc_0_0 = filter.freq_xlating_fft_filter_ccc(1, firdes.complex_band_pass(1, samp_rate, -samp_rate/(2*(1.0*(4/4))), samp_rate/(2*(1.0*(4/4))), samp_rate/4), ((1)*((samp_rate*shift_factor)*(1/sps)*(1/interpolation))), samp_rate)
        self.freq_xlating_fft_filter_ccc_0_0.set_nthreads(1)
        self.freq_xlating_fft_filter_ccc_0_0.declare_sample_delay(0)
        self.freq_xlating_fft_filter_ccc_0 = filter.freq_xlating_fft_filter_ccc(1, firdes.complex_band_pass(1, samp_rate, -samp_rate/(2*(1.0*(4/4))), samp_rate/(2*(1.0*(4/4))), samp_rate/4), ((-1)*((samp_rate*shift_factor)*(1/sps)*(1/interpolation))), samp_rate)
        self.freq_xlating_fft_filter_ccc_0.set_nthreads(1)
        self.freq_xlating_fft_filter_ccc_0.declare_sample_delay(0)
        self.digital_protocol_formatter_bb_0 = digital.protocol_formatter_bb(hdr_format, "packet_len")
        self.digital_pfb_clock_sync_xxx_0_0 = digital.pfb_clock_sync_ccf(sps, (((math.sqrt(modulus)*3.14)/100)), firdes.root_raised_cosine(nfilts, nfilts, 1.0/float(sps), 0.35, int(11*sps*nfilts)), nfilts, ((((nfilts/2)*1)*1)+0), (((1/modulus)*16)), 1)
        self.digital_map_bb_0 = digital.map_bb(constel.pre_diff_code())
        self.digital_diff_decoder_bb_0_0 = digital.diff_decoder_bb(modulus, digital.DIFF_DIFFERENTIAL)
        self.digital_correlate_access_code_xx_ts_0 = digital.correlate_access_code_bb_ts(access_key,
          0, 'packet_len')
        self.digital_constellation_receiver_cb_0 = digital.constellation_receiver_cb(constel, ((2*3.14)/100), ((1/modulus)*(0.02/math.sqrt(modulus))), (int((samp_rate*(200/1000000))+5+((samp_rate*shift_factor)*(200/1000000)))))
        self.digital_constellation_modulator_0_0 = digital.generic_mod(
            constellation=constel,
            differential=True,
            samples_per_symbol=sps,
            pre_diff_code=True,
            excess_bw=excess_bw,
            verbose=False,
            log=False,
            truncate=False)
        self.blocks_unpack_k_bits_bb_0_0 = blocks.unpack_k_bits_bb(constel.bits_per_symbol())
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
        self.blocks_multiply_const_vxx_0_0_0 = blocks.multiply_const_ff(0.05)
        self.blocks_multiply_const_vxx_0 = blocks.multiply_const_ff(0.35)
        self.blocks_float_to_complex_1 = blocks.float_to_complex(1)
        self.blocks_float_to_complex_0 = blocks.float_to_complex(1)
        self.blocks_file_source_0_0_0 = blocks.file_source(gr.sizeof_char*1, os.path.join(os.environ['HOME'], 'Downloads', '_framed.rrf') if os.name == 'posix' else  os.path.join(os.environ['USERPROFILE'], 'Downloads', '_framed.rrf'), False, 0, 0)
        self.blocks_file_source_0_0_0.set_begin_tag(pmt.PMT_NIL)
        self.blocks_file_sink_0_0_0 = blocks.file_sink(gr.sizeof_char*1, os.path.join(os.environ['HOME'], 'Downloads', '_diag.rrf') if os.name == 'posix' else  os.path.join(os.environ['USERPROFILE'], 'Downloads', '_diag.rrf'), False)
        self.blocks_file_sink_0_0_0.set_unbuffered(False)
        self.blocks_complex_to_float_0 = blocks.complex_to_float(1)
        self.blocks_char_to_float_0 = blocks.char_to_float(1, 1)
        self.audio_sink_0 = audio.sink(samp_rate, '', True)
        self.analog_agc_xx_0 = analog.agc_cc(((((1/(modulus))/sps/interpolation+(((samp_rate/48000)*0.0005))/sps/interpolation))*12), 1.25, 1.05)
        self.analog_agc_xx_0.set_max_gain(65536)


        ##################################################
        # Connections
        ##################################################
        self.connect((self.analog_agc_xx_0, 0), (self.digital_pfb_clock_sync_xxx_0_0, 0))
        self.connect((self.blocks_char_to_float_0, 0), (self.blocks_float_to_complex_1, 0))
        self.connect((self.blocks_complex_to_float_0, 0), (self.blocks_multiply_const_vxx_0, 0))
        self.connect((self.blocks_complex_to_float_0, 0), (self.blocks_multiply_const_vxx_0_0_0, 0))
        self.connect((self.blocks_file_source_0_0_0, 0), (self.blocks_stream_to_tagged_stream_0, 0))
        self.connect((self.blocks_float_to_complex_0, 0), (self.freq_xlating_fft_filter_ccc_0_0, 0))
        self.connect((self.blocks_float_to_complex_0, 0), (self.qtgui_sink_x_0_1, 0))
        self.connect((self.blocks_float_to_complex_1, 0), (self.qtgui_sink_x_1, 0))
        self.connect((self.blocks_multiply_const_vxx_0, 0), (self.audio_sink_0, 0))
        self.connect((self.blocks_multiply_const_vxx_0_0_0, 0), (self.blocks_float_to_complex_0, 0))
        self.connect((self.blocks_pack_k_bits_bb_0, 0), (self.blocks_tag_gate_0, 0))
        self.connect((self.blocks_repack_bits_bb_1, 0), (self.digital_correlate_access_code_xx_ts_0, 0))
        self.connect((self.blocks_repack_bits_bb_1_0, 0), (self.blocks_char_to_float_0, 0))
        self.connect((self.blocks_repack_bits_bb_1_0, 0), (self.blocks_file_sink_0_0_0, 0))
        self.connect((self.blocks_stream_to_tagged_stream_0, 0), (self.blocks_tagged_stream_mux_0, 1))
        self.connect((self.blocks_stream_to_tagged_stream_0, 0), (self.digital_protocol_formatter_bb_0, 0))
        self.connect((self.blocks_tag_gate_0, 0), (self.blocks_tag_gate_0_0_0_0_0, 0))
        self.connect((self.blocks_tag_gate_0_0_0, 0), (self.digital_constellation_modulator_0_0, 0))
        self.connect((self.blocks_tag_gate_0_0_0_0, 0), (self.blocks_tag_gate_0_0_0, 0))
        self.connect((self.blocks_tag_gate_0_0_0_0_0, 0), (self.blocks_repack_bits_bb_1, 0))
        self.connect((self.blocks_tag_gate_0_0_0_1, 0), (self.freq_xlating_fft_filter_ccc_0, 0))
        self.connect((self.blocks_tag_gate_0_0_0_1_0, 0), (self.analog_agc_xx_0, 0))
        self.connect((self.blocks_tagged_stream_mux_0, 0), (self.blocks_tag_gate_0_0_0_0, 0))
        self.connect((self.blocks_unpack_k_bits_bb_0_0, 0), (self.blocks_pack_k_bits_bb_0, 0))
        self.connect((self.digital_constellation_modulator_0_0, 0), (self.blocks_tag_gate_0_0_0_1, 0))
        self.connect((self.digital_constellation_receiver_cb_0, 0), (self.blocks_null_sink_0, 0))
        self.connect((self.digital_constellation_receiver_cb_0, 1), (self.blocks_null_sink_1, 0))
        self.connect((self.digital_constellation_receiver_cb_0, 2), (self.blocks_null_sink_1_0, 0))
        self.connect((self.digital_constellation_receiver_cb_0, 3), (self.blocks_null_sink_1_1, 0))
        self.connect((self.digital_constellation_receiver_cb_0, 0), (self.digital_diff_decoder_bb_0_0, 0))
        self.connect((self.digital_constellation_receiver_cb_0, 4), (self.qtgui_const_sink_x_0_0, 0))
        self.connect((self.digital_correlate_access_code_xx_ts_0, 0), (self.blocks_repack_bits_bb_1_0, 0))
        self.connect((self.digital_diff_decoder_bb_0_0, 0), (self.digital_map_bb_0, 0))
        self.connect((self.digital_map_bb_0, 0), (self.blocks_unpack_k_bits_bb_0_0, 0))
        self.connect((self.digital_pfb_clock_sync_xxx_0_0, 0), (self.digital_constellation_receiver_cb_0, 0))
        self.connect((self.digital_pfb_clock_sync_xxx_0_0, 0), (self.qtgui_sink_x_0_0, 0))
        self.connect((self.digital_protocol_formatter_bb_0, 0), (self.blocks_tagged_stream_mux_0, 0))
        self.connect((self.freq_xlating_fft_filter_ccc_0, 0), (self.blocks_complex_to_float_0, 0))
        self.connect((self.freq_xlating_fft_filter_ccc_0, 0), (self.qtgui_sink_x_0, 0))
        self.connect((self.freq_xlating_fft_filter_ccc_0_0, 0), (self.blocks_tag_gate_0_0_0_1_0, 0))


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

    def get_samp_rate(self):
        return self.samp_rate

    def set_samp_rate(self, samp_rate):
        self.samp_rate = samp_rate
        self.set_shift_factor(((325/self.samp_rate)*4)+(0.5)+(self.excess_bw*0.5))
        self.analog_agc_xx_0.set_rate(((((1/(self.modulus))/self.sps/self.interpolation+(((self.samp_rate/48000)*0.0005))/self.sps/self.interpolation))*12))
        self.blocks_throttle_0.set_sample_rate(self.samp_rate)
        self.freq_xlating_fft_filter_ccc_0.set_taps(firdes.complex_band_pass(1, self.samp_rate, -self.samp_rate/(2*(1.0*(4/4))), self.samp_rate/(2*(1.0*(4/4))), self.samp_rate/4))
        self.freq_xlating_fft_filter_ccc_0.set_center_freq(((-1)*((self.samp_rate*self.shift_factor)*(1/self.sps)*(1/self.interpolation))))
        self.freq_xlating_fft_filter_ccc_0_0.set_taps(firdes.complex_band_pass(1, self.samp_rate, -self.samp_rate/(2*(1.0*(4/4))), self.samp_rate/(2*(1.0*(4/4))), self.samp_rate/4))
        self.freq_xlating_fft_filter_ccc_0_0.set_center_freq(((1)*((self.samp_rate*self.shift_factor)*(1/self.sps)*(1/self.interpolation))))
        self.qtgui_sink_x_0.set_frequency_range(0, self.samp_rate)
        self.qtgui_sink_x_0_0.set_frequency_range(0, self.samp_rate)
        self.qtgui_sink_x_0_1.set_frequency_range(0, self.samp_rate)
        self.qtgui_sink_x_1.set_frequency_range(0, self.samp_rate)

    def get_modulus(self):
        return self.modulus

    def set_modulus(self, modulus):
        self.modulus = modulus
        self.set_arity(self.modulus)
        self.set_nfilts(int(32*(self.modulus/16)))
        self.analog_agc_xx_0.set_rate(((((1/(self.modulus))/self.sps/self.interpolation+(((self.samp_rate/48000)*0.0005))/self.sps/self.interpolation))*12))
        self.digital_pfb_clock_sync_xxx_0_0.set_loop_bandwidth((((math.sqrt(self.modulus)*3.14)/100)))

    def get_excess_bw(self):
        return self.excess_bw

    def set_excess_bw(self, excess_bw):
        self.excess_bw = excess_bw
        self.set_shift_factor(((325/self.samp_rate)*4)+(0.5)+(self.excess_bw*0.5))

    def get_access_key(self):
        return self.access_key

    def set_access_key(self, access_key):
        self.access_key = access_key
        self.set_hdr_format(digital.header_format_default(self.access_key, 0))

    def get_sps(self):
        return self.sps

    def set_sps(self, sps):
        self.sps = sps
        self.analog_agc_xx_0.set_rate(((((1/(self.modulus))/self.sps/self.interpolation+(((self.samp_rate/48000)*0.0005))/self.sps/self.interpolation))*12))
        self.digital_pfb_clock_sync_xxx_0_0.update_taps(firdes.root_raised_cosine(self.nfilts, self.nfilts, 1.0/float(self.sps), 0.35, int(11*self.sps*self.nfilts)))
        self.freq_xlating_fft_filter_ccc_0.set_center_freq(((-1)*((self.samp_rate*self.shift_factor)*(1/self.sps)*(1/self.interpolation))))
        self.freq_xlating_fft_filter_ccc_0_0.set_center_freq(((1)*((self.samp_rate*self.shift_factor)*(1/self.sps)*(1/self.interpolation))))

    def get_shift_factor(self):
        return self.shift_factor

    def set_shift_factor(self, shift_factor):
        self.shift_factor = shift_factor
        self.freq_xlating_fft_filter_ccc_0.set_center_freq(((-1)*((self.samp_rate*self.shift_factor)*(1/self.sps)*(1/self.interpolation))))
        self.freq_xlating_fft_filter_ccc_0_0.set_center_freq(((1)*((self.samp_rate*self.shift_factor)*(1/self.sps)*(1/self.interpolation))))

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
        self.digital_pfb_clock_sync_xxx_0_0.update_taps(firdes.root_raised_cosine(self.nfilts, self.nfilts, 1.0/float(self.sps), 0.35, int(11*self.sps*self.nfilts)))

    def get_interpolation(self):
        return self.interpolation

    def set_interpolation(self, interpolation):
        self.interpolation = interpolation
        self.analog_agc_xx_0.set_rate(((((1/(self.modulus))/self.sps/self.interpolation+(((self.samp_rate/48000)*0.0005))/self.sps/self.interpolation))*12))
        self.freq_xlating_fft_filter_ccc_0.set_center_freq(((-1)*((self.samp_rate*self.shift_factor)*(1/self.sps)*(1/self.interpolation))))
        self.freq_xlating_fft_filter_ccc_0_0.set_center_freq(((1)*((self.samp_rate*self.shift_factor)*(1/self.sps)*(1/self.interpolation))))

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
