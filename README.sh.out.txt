
Copyright (C) 2023,2024- mirage335
See the end of the file for license conditions.
See license.txt for pumpCompanion license conditions.


Safe (malware preventative) file transfer modem software app for MSWindows (including ARM64) and Linux through Software Defined Radio or audio hardware. Thoroughly proven schematics for TRRS/TRS adapters to RJ45 Cat6A telephone, and similar, included.

By transferring data in a discontinuous (ie. analog) format, none of the computer hardware interfaces will present either keyboard traffic that could transfer and install malware, nor any firmware reprogramming that could cause other devices to do this, nor any malformed network packets to buffer overflow.

As such, this is a necessary Commercial-Off-The-Shelf workaround for the long history of malware abusing the insane proliferation of computer interfaces with completely inappropriate functionality (eg. reprogrammable SATA firmware wear leveling, BadUSB flash drive reprogramming, SD Card slot SDIO serial/keyboard/etc functionality, parallel port functionality, etc).




This system has been tested with real world audio hardware and does function as designed at decent throughput under challenging conditions.

Audio output should be just below the point of distortion (ie. 99% volume). Audio input volume MUST be kept lower, analog signal should appear at one quarter full input amplitude. Attenuation of more than 3dB to TRRS microphone ports is apparently unnecessary. Coupling impedance and DC load at TRRS microphone connection should be ~1.6kOhm. Higher DC impedance at TRRS microphone port will result in substantial amplifier current noise and EMI sensitivity. TRRS headphones connection DC load should be <<40kOhm. Heavy capacitive coupling >>250uF is apparently acceptable to bypass any DC impedance to improve signal strength, though any amplifier output without ~300Ohm resistive coupling will impose a near short circuit to other outputs on the same line. Capacitor polarity should always place the negative side of the capacitor towards the line (ie. towards the load on the line to ground).

Auditing is a nice bonus for the audio interface - a mere continious analog recording may be kept without possibility of tampering by the malware.

Optical Data Diodes may be formed by widely available ADC/SPDIF and DAC/SPDIF fiber optic adapters.


 '_image' 'render.png'




_ Usage _

__  __

Please use the &#39;*.lnk&#39; shotrcut files under MSWindows, or the &#39;*.desktop&#39; shortcut files under Linux/KDE/Plasma .

pC-frame
pC-deframe
pC-modem

Frame/deframe shortcuts will convert &#39;Downloads/_in.rrf&#39; and &#39;Downloads/_out.rrf&#39; to/from &#39;Downloads/_framed.rrf&#39;, which includes added compression, gain control preamble, error correction information.

Modem will open transmit and receive GNURadio companion flowgraphs, which may be run to transfer the &#39;Downloads/_framed.rrf&#39; file across audio. Variable blocks at the top-left of the flowgraph may be enabled to change speed if necessary.



__ Alternatives __

[0;37;100m[0;34m ./ubiquitous_bash.sh _gnuradioCompanion [0m[0m
[0;37;100m[0;34m ./ubiquitous_bash.sh _pumpCompanion-frame [0m[0m
[0;37;100m[0;34m ./ubiquitous_bash.sh _pumpCompanion-deframe [0m[0m



Some computer systems may require audio jack retasking.
[0;37;100m[0;34m hdajackretask [0m[0m






 '_page'PageBreak -H-H-H-H- PageBreak -H-H-H-H- PageBreak -H-H-H-H- PageBreak -H-H-H-H- PageBreak


_ Windows11 on ARM64 Compatibility _


Some ARM64 tablets capable of high-performance x86/x64 emulation have been comparable to the most recent x64 native hardware, compatible with desktop software, and are much more usable for filesystem workflows than smartphone/tablets. Recommended.


__ Microsoft Surface Pro 2-in-1 Laptop/Tablet (2024), Windows 11 Copilot+ PC, 13inch Touchscreen OLED Display, Snapdragon X Elite (12 Core), 16GB RAM, 256GB Storage __


TRRS/USB-C microphone input has non-configurable &#39;enhancement&#39; applied, causing strong intersymbol-interference which lowers the useful bitrate to 16kb/s (useful throughput with overhead of 13.913kb/s). Users should consider seriously whether they really need to specifically transfer files >5MB in to this device from untrusted computers - usually such a tablet would be internet facing, so the opposite direction of transfer, which is unimpeded, would be far more common. If this specific case is a concern, then an external USB sound card may be beneficial.





_ Tablets _


Other recommended tablets.


__ Surface Go 2, m3-8100Y CPU 8GB RAM (fanless) __


Both MSWindows and ubdist/Linux are usable without apparent issues. Limited track record.





_ External Sound Cards _

__ USB Sound Card __

Combination of USB isolator and USB sound card has been reasonably effective without introducing much noise to a shared audio bus.

*) https://www.amazon.com/gp/product/B00F4SCCR2/
*) https://www.amazon.com/gp/product/B07RV6VBNR/


__ Fiber Optic SPDIF ADC/DAC __


Unfortunately, existing Fiber Optic SPDIF ADC/DAC USB devices, while promising in principle, have apparently had unnecessarily poor bit depth and frequency response. Usable throughput is still good, but much less than high-quality 24bit sound cards. Eventually, a custom circuit board may be designed with good quality components and firmware.





 '_page'PageBreak -H-H-H-H- PageBreak -H-H-H-H- PageBreak -H-H-H-H- PageBreak -H-H-H-H- PageBreak


_ Standards _


input.rrf
framed.rrf
output.rrf

Any automation of the preprocessing/postprocessing step by &#39;gr-pipe&#39; may use a separate &#39;flowgraph&#39; pointing to &#39;framed.rrf&#39; . Similarly, shell/batch files may perform this step.





 '_page'PageBreak -H-H-H-H- PageBreak -H-H-H-H- PageBreak -H-H-H-H- PageBreak -H-H-H-H- PageBreak


_ Design _

 





 '_page'PageBreak -H-H-H-H- PageBreak -H-H-H-H- PageBreak -H-H-H-H- PageBreak -H-H-H-H- PageBreak


_ Conclusions _


*) Framing arbitrary size files with stock GNURadio is not possible, due to &#39;Stream to Tagged Stream&#39;, at least with the stock version, blocking output until a multiple of the specified length for tagging.

*) Cygwin installation of GNURadio may be possible. Possibly also gr-pipe .






 '_page'PageBreak -H-H-H-H- PageBreak -H-H-H-H- PageBreak -H-H-H-H- PageBreak -H-H-H-H- PageBreak


_ Safety _

 





 '_page'PageBreak -H-H-H-H- PageBreak -H-H-H-H- PageBreak -H-H-H-H- PageBreak -H-H-H-H- PageBreak


_ Reference _

https://lists.gnu.org/archive/html/discuss-gnuradio/2017-07/msg00249.html

https://wiki.gnuradio.org/index.php/Correlation_Estimator#:~:text=Correlation%20Estimator%20The%20Correlation%20Estimator%20block%20correlates%20the,to%20get%20a%20time%20and%20phase%20offset%20estimate.

https://dsp.stackexchange.com/questions/68306/16-qam-gnu-radio








https://wiki.gnuradio.org/index.php?title=QPSK_Mod_and_Demod
	&#39;might have an ambiguity of 90 degrees in the constellation. Luckily, we avoided this problem by transmitting differential symbols.&#39;

https://discuss-gnuradio.gnu.narkive.com/KrFwQ9Fz/why-no-phase-ambiguity-in-digital-bert
	&#39;scrambler/descrambler pair is insensitive to the phase ambiguity&#39;

https://www.gnuradio.org/grcon/grcon17/presentations/building_a_moderately_complex_mode_with_spare_parts/Dan-CaJacob-Building-a-Moderately-Complex-Modem-with-Spare-Parts.pdf
	&#39;Correlation estimator and 2nd Costas Loop clean up the ambiguity&#39;

https://github.com/greatscottgadgets/hackrf/issues/1159
	MAJOR - SEVERE - &#39;Possible solution: at TX startup, have the M4 not run baseband_streaming_enable until the first two 16KB transfers have arrived from the host, meaning that the M0 has a full buffer ready to transmit.&#39;

https://www.reddit.com/r/RTLSDR/comments/o7owrl/hackrf_frequency_drift/
https://imgur.com/a/ggsuPTm



https://stackoverflow.com/questions/54946638/punctured-convolutional-codes-in-gnu-radio
	&#39;Gnu Radio Puncture pattern&#39; &#39;Puncture size&#39; &#39;Delay values&#39;




https://aaronscher.com/GNU_Radio_Companion_Collection/Audio_modem.html





https://wiki.gnuradio.org/index.php?title=CygwinInstallMain



https://wiki.gnuradio.org/index.php/Packet_Communications
	MAJOR - &#39;Functionally it replaces a &#39;File Source&#39; block and a &#39;Stream to Tagged Stream&#39; block. The advantage of this block is that when the input file size is not an exact multiple of the selected packet length, the remainder at the end of the file is not lost in the &#39;Stream to Tagged Stream&#39; buffer. This precludes the need for a pre-processor such as the text padding program above.&#39;




https://raw.githubusercontent.com/gnuradio/gnuradio/master/gr-digital/examples/ofdm/ofdm_loopback.grc




https://wiki.gnuradio.org/index.php/Packet_Communications
 MAJOR - &#39;Header Format Object&#39; .
 MAJOR - &#39;Using Header Format Default and Correlate Access Code&#39; .



https://wiki.gnuradio.org/images/f/fd/Pkt_7_base_fg.png
 &#39;Protocol Formatter&#39; &#39;Format Obj&#39;
 &#39;Header/Payload Demux&#39;

https://wiki.gnuradio.org/images/8/89/Pkt_7_base.grc
 Format Obj.: hdr_format

https://github.com/gnuradio/gnuradio/blob/master/gr-digital/examples/ofdm/tx_ofdm.grc
 Format Obj.: header_formatter.base()





https://www.gnuradio.org/doc/doxygen/classgr_1_1digital_1_1packet__header__default.html
 &#39;packet_header_default&#39;












https://www.youtube.com/watch?v=RnAgqGR-D-8
https://www.youtube.com/watch?v=VR0mej2o-SM
	Windows... HackRF...










 '_page'PageBreak -H-H-H-H- PageBreak -H-H-H-H- PageBreak -H-H-H-H- PageBreak -H-H-H-H- PageBreak


_ Copyright _


This file is part of pumpCompanion.

pumpCompanion is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

pumpCompanion is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with pumpCompanion.  If not, see &lt;http://www.gnu.org/licenses/&gt;.







