
Some reduction in error rates apparently occurred with convolutional codes applied outside header bit/shift synchronization.

Trellis Encoder and Viterbi Combo have been able to function through constraints of bit unpacking/unpacking, Map, CharToFloat, etc. Trellis Metrics and Viterbi blocks should also function as expected as shown by '/usr/share/gnuradio/examples/trellis' .

Files used for 'FSM Args' from '/usr/share/gnuradio/examples/trellis/fsm_files/' show design specifically for such constellation modulations as 8PSK, apparently with both symbol specific mappings and output states.


# Weakness of GNURadio

Numerical range of 0-1 , 0-127 , 0-255 .

currentValue = previousValue + ( multiplier * ( newValue - previousValue ) )

Multiply by constant (attenuate or amplify) .


Multiply by sine wave (local oscillator frequency mix/shift) .

Detect sequence of symbols -> amplifier -> local oscillator voltage controlled frequency.

symbolNumericalValue = newSymbolValue / Symbols Envelope
 (envelope is from EITHER low pass filtered diode OR equivalent IIR low pass then sample/hold software)

symbolNumericalValue -> map -> bits/bytes/multipleBytes

( Gray Coding of the symbols causes symbols with similar analog values to change only a single bit )
( Trellis modulation can correct when symbols with analog values have erroneously overlapped )


This is basically how all digital radio works, as well as analog radio. It is not complicated, never has been. Whereas someone might talk up decades of engineering going into radios, all of that supposed engineering was really in using as few transistors as badly as possible, rather from an era when a few transistors or proper $0.50 TL071, TL082 was prohibitively expensive. Single vacuum tube regenerative receivers have absolutely no place in the  modern world.

These basic steps are much more easily described by either just a very few electrical components, or by a very few lines of code, or by pencil and paper. The entire process of digital radio can be performed quickly and accurately on paper .

GNURadio and MatLab have done nothing to simplify or ease radio design in any way. Unfortunately, the many 'blocks' of GNURadio are very, very poorly documented, to the point that merely figuring out whether a block emits 0b10000000 , 0b00000001 , or 0b11111111 or 0b1111 , as well as how to adapt and convert to another format such as 0xFF, has all become yet another case of unnecessary software complexity driven trial-and-error move-anything-but-fast-and-only-break-things development paradim.


The history of mathematicians embodied by GNURadio and MatLab, as well as the proprietary issues of distributing, adminstrating, and safely updating, anything using MatLab, does nothing for the next generation or practical real world uses. Rather such legacy is doubtful as even a trivial benefit to established institutions that have exhausted their practical benefits. In the end, arcane undocumented ill behaved mathematical descriptions of simple arithmetic transformations has become merely a grave impediment to progress by at least an order of magnitude or two. Far from a pure science, modern mathematics has more than mostly exceeded points of dimnishing returns to become an indulgent pasttime burdensome to the real world of which it has detached any value from.






# Further

Trellis/Viterbi could be specifically configured for QAM 64 , QAM 256 , and higher density QAM constellations beyond that.

This, however, is getting past the point at which embedding, with the flowgraph, custom python code, would be more pragmatic. Feedback amplifier (ie. multiply) driven tuning of the entire receiver from symbol or code reception could improve robustness beyond what the 'Constellation Receiver' configuration parameters offer.

Diagnostic output showing binary states may be possible with existing GNURadio blocks, and would provide better confirmation of what some blocks are actually producing.




# Alternative - Single SideBand Pulse Amplitude Modulation (SSB PAM) or SSB PSK

GNURadio usually uses 'complex' analog signals centered at 0Hz . Sharply filtering the positive half of this, may effectively result in an SSB transmission.

Symbol rate may double from 4sps to 2sps at full 48kHz sampling rate , while constellation density may or may not remain high.

Under typical or desirable configurations of ADCs and any typical filtering between ADCs , in practice, this may or may NOT actually achieve usefully higher spectral efficiency than QAM .

Differential encoding of amplitude shifts may be enough to show that clock sync between DAC/ADC is not necessary. A simple self-contained program should be able to show whether a shift from full amplitude to zero amplitude back to full amplitude, out of sync, will either average to mid-range noise, or whether the amplitude shifts will still be apparent (as expected).



# Alternative - Better Interpolation

Rational Resampler block was found to cause inexplicable clearing up of distorted signals, but insufficient for optimal digital radio performance. A more trustworthy and performant interpolation solution would allow more independence from hardware sampling rates.

QAM at 2sps , or more useful SSB , might be convenient benefits of better interpolation .



# Alternative - More Sophisticated Constellations

Versatility may be improved with a more comprehensive differential constellation definition covering frequency/FSK tones/durations, phase/PSK tones/durations, and amplitude shifts (ie. PAM).

Constellation diagrams for diagnostic use could be constructed to automatically display a list of detected signals at various frequencies, FFT parameters, etc, defaulting to an overlapping view.

Adaptive constellations using this more versatile definition may be useful when the analog channel can be characterized (eg. with typical sharp audio low pass filtering at ~400Hz to ~18kHz), or in bidirectional communications protocols.

Frequency offset and clock phase offset locking may be improved with periodic chirps recognizable by digital correlation and then output as an analog error offset signal for use by by analog feedback amplifiers (ie. multiply) for receiver tuning.







# Reference

https://en.wikipedia.org/wiki/Spectral_efficiency
	'QAM is a form of double sideband passband transmission, the spectral efficiency cannot exceed N = 4 (bit/s)/Hz'
	'pulse-amplitude modulation with 128 signal levels' 'spectral efficiency cannot exceed 2N = 14 (bit/s)/Hz over the full baseband channel (0 to 4 kHz)' 'higher spectral efficiency is achieved if we consider the smaller passband bandwidth'
