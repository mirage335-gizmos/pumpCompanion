##### Core


_pumpCompanion-frame-minimal() {
	if [[ $(head -c 289 "$pumpCompanion_inFile" | tr -dc 'a-z0-9') == "f0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03ae" ]]
	then
		_messagePlain_bad 'bad: anomaly: input framed'
		_messageError 'FAIL: seems BAD'
		_messageFAIL
		return 1
	fi
	
	
	if [[ -e "$pumpCompanion_framedFile" ]] && [[ $(head -c 289 "$pumpCompanion_framedFile" | tr -dc 'a-z0-9') == "f0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03ae" ]] && [[ $(tail -c 290 "$pumpCompanion_framedFile" | tr -dc 'a-z0-9') == "2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a" ]]
	then
		_messagePlain_good 'good: already framed'
		return 0
	fi
	
	
	
	echo >> "$pumpCompanion_framedFile"
	
	#'_pumpCompanion-frame 0.3183098862 3.1415926535897932384626433832795028841971693993751058209749445923078164 06286208998628034825342117067' | md5sum
	#f0d81c2b72c2def16da7e2c9860c03ae
	echo "f0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03ae" >> "$pumpCompanion_framedFile"
	
	echo >> "$pumpCompanion_framedFile"
	
	#xz -z -e9 -C crc64 --threads=1
	#lz4 -z --fast=1 - - | cat
	cat "$pumpCompanion_inFile" | lz4 -z --fast=1 - - | base64 -w 156 >> "$pumpCompanion_framedFile"
	
	echo >> "$pumpCompanion_framedFile"
	
	#'echo '_pumpCompanion-frame END 0.3183098862 3.1415926535897932384626433832795028841971693993751058209749445923078164 06286208998628034825342117067' | md5sum'
	#2025bae2a82c9792a5c3090075a3902a
	echo "2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a" >> "$pumpCompanion_framedFile"
	
	echo >> "$pumpCompanion_framedFile"
	
	
	
	
	
	
	
	
	
	if [[ ! -e "$pumpCompanion_framedFile" ]]
	then
		_messagePlain_bad 'bad: fail'
		_messageFAIL
		return 1
	fi
	return 0
}

_pumpCompanion-deframe() {
	_messageNormal '_pumpCompanion-deframe'
	
	#if [[ -e "$pumpCompanion_framedFile" ]] && ! grep "2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a" "$pumpCompanion_framedFile" > /dev/null 2>&1
	#then
		#_messagePlain_bad 'bad: fail: incomplete: _framed.rrf'
		#_messageFAIL
		#return 1
	#fi
	
	#|| [[ $(head -c 289 "$pumpCompanion_framedFile" | tr -dc 'a-z0-9') != "f0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03ae" ]] || [[ $(tail -c 290 "$pumpCompanion_framedFile" | tr -dc 'a-z0-9') != "2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a" ]]
	if [[ ! -e "$pumpCompanion_framedFile" ]]
	then
		_messagePlain_bad 'bad: fail: missing or incorrect: _framed.rrf'
		_messageFAIL
		return 1
	fi
	
	#cat "$pumpCompanion_framedFile" | grep -v "f0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03ae" | grep -v "2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a" | base64 -d > "$pumpCompanion_outFile"
	
	# ATTRIBUTION: ChatGPT4 2023-12-15 .
	#xz -d
	if ! head -c $(($(grep -aobm 1 '2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a' "$pumpCompanion_framedFile" | cut -d: -f1) + 0 - 1)) "$pumpCompanion_framedFile" | tail -c +$(($(grep -aobm 1 'f0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03ae' "$pumpCompanion_framedFile" | cut -d: -f1) + 288 + 3)) | base64 -d | lz4 -d -c > "$pumpCompanion_outFile"
	then
		_messagePlain_bad 'bad: fail: incomplete: _framed.rrf'
		#_messageFAIL
		_messageError 'FAIL'
		sleep 2
		return 1
	fi
	
	
	_messagePlain_nominal 'done: _pumpCompanion-deframe'
	sleep 15
	return 0
}

_pumpCompanion-frame-bare() {
	_messageNormal '_pumpCompanion-frame'
	
	if [[ -e "$pumpCompanion_framedFile" ]] && [[ $(head -c 289 "$pumpCompanion_framedFile" | tr -dc 'a-z0-9') != "f0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03ae" ]]
	then
		_messagePlain_bad 'bad: already INCORRECTLY framed: head'
		_messageError 'FAIL: seems BAD'
		_messageFAIL
		return 1
	fi
	
	if [[ -e "$pumpCompanion_framedFile" ]] && [[ $(tail -c 290 "$pumpCompanion_framedFile" | tr -dc 'a-z0-9') != "2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a" ]]
	then
		_messagePlain_bad 'bad: already INCORRECTLY framed: tail'
		_messageError 'FAIL: seems BAD'
		_messageFAIL
		return 1
	fi
	
	_pumpCompanion-frame-minimal "$@"
	
	if [[ ! -e "$pumpCompanion_framedFile" ]] || [[ $(head -c 289 "$pumpCompanion_framedFile" | tr -dc 'a-z0-9') != "f0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03ae" ]] || [[ $(tail -c 290 "$pumpCompanion_framedFile" | tr -dc 'a-z0-9') != "2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a" ]]
	then
		_messagePlain_bad 'bad: fail'
		_messageFAIL
		return 1
	fi
	
	
	_messagePlain_good 'good: success'
	_messagePlain_nominal 'done: _pumpCompanion-frame'
	#_messageNormal '_pumpCompanion-frame: done'
	sleep 15
	return 0
}

_pumpCompanion-frame-kilo() {
	_messageNormal '_pumpCompanion-frame'
	
	rm -f "$pumpCompanion_framedFile"
	sudo -n rm -f "$pumpCompanion_framedFile"
	
	# Eliminates dependency on radio protocol to adjust AGC , sync clock, etc. DC Balanced , large amplitude, large bandwidth.
	#0w
	#0011 0000 0111 0111
	(while true ; do echo -n '0w0w0w0w0w0w0w0w0w0w0w0w0w0w0w0wthe quick brown fox jumps over the lazy dog THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG 0123456789 37a0w3wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww70w0w0w0w0w0w0w0w0w0w0w0w0w0w0w0w' ; done) | head -c 2100 > "$pumpCompanion_framedFile"
	
	_pumpCompanion-frame-minimal "$@"
	
	(while true ; do echo -n '0w0w0w0w0w0w0w0w0w0w0w0w0w0w0w0wthe quick brown fox jumps over the lazy dog THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG 0123456789 37a0w3wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww70w0w0w0w0w0w0w0w0w0w0w0w0w0w0w0w' ; done) | head -c 380 >> "$pumpCompanion_framedFile"
	
	_messagePlain_nominal 'done: _pumpCompanion-frame'
	#_messageNormal '_pumpCompanion-frame: done'
	sleep 15
	return 0
}

_pumpCompanion-frame-mega() {
	_messageNormal '_pumpCompanion-frame'
	
	rm -f "$pumpCompanion_framedFile"
	sudo -n rm -f "$pumpCompanion_framedFile"
	
	# Eliminates dependency on radio protocol to adjust AGC , sync clock, etc. DC Balanced , large amplitude, large bandwidth.
	#0w
	#0011 0000 0111 0111
	#0w0w0w0w0w0w0w0w0w0w0w0w0w0w0w0wthe quick brown fox jumps over the lazy dog 0123456789 37a0w3wwwwwwwwww70w0w0w0w0w0w0w0w0w0w0w0w0w0w0w0w
	# ( ((8*10^6)*log2(1+(100/1))) bits * 12 / 4 to megabytes
	# 12 seconds at one quarter of 8MHz channel
	(while true ; do echo -n '0w0w0w0w0w0w0w0w0w0w0w0w0w0w0w0wthe quick brown fox jumps over the lazy dog THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG 0123456789 37a0w3wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww70w0w0w0w0w0w0w0w0w0w0w0w0w0w0w0w' ; done) | head -c 20000100 > "$pumpCompanion_framedFile"
	
	
	_pumpCompanion-frame-minimal "$@"
	
	(while true ; do echo -n '0w0w0w0w0w0w0w0w0w0w0w0w0w0w0w0wthe quick brown fox jumps over the lazy dog THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG 0123456789 37a0w3wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww70w0w0w0w0w0w0w0w0w0w0w0w0w0w0w0w' ; done) | head -c 66100 >> "$pumpCompanion_framedFile"
	
	_messagePlain_nominal 'done: _pumpCompanion-frame'
	#_messageNormal '_pumpCompanion-frame: done'
	sleep 15
	return 0
}

_pumpCompanion-frame-giga() {
	_messageNormal '_pumpCompanion-frame'
	
	rm -f "$pumpCompanion_framedFile"
	sudo -n rm -f "$pumpCompanion_framedFile"
	
	# Eliminates dependency on radio protocol to adjust AGC , sync clock, etc. DC Balanced , large amplitude, large bandwidth.
	#0w
	#0011 0000 0111 0111
	# (( ((150*10^6)*log2(1+(100/1))) bits ) * 12 / 4 to megabytes
	# 12 seconds at one quarter of 150MHz channel
	(while true ; do echo -n '0w0w0w0w0w0w0w0w0w0w0w0w0w0w0w0wthe quick brown fox jumps over the lazy dog THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG 0123456789 37a0w3wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww70w0w0w0w0w0w0w0w0w0w0w0w0w0w0w0w' ; done) | head -c 360000100 > "$pumpCompanion_framedFile"
	
	
	_pumpCompanion-frame-minimal "$@"
	
	(while true ; do echo -n '0w0w0w0w0w0w0w0w0w0w0w0w0w0w0w0wthe quick brown fox jumps over the lazy dog THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG 0123456789 37a0w3wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww70w0w0w0w0w0w0w0w0w0w0w0w0w0w0w0w' ; done) | head -c 66100 >> "$pumpCompanion_framedFile"
	
	_messagePlain_nominal 'done: _pumpCompanion-frame'
	#_messageNormal '_pumpCompanion-frame: done'
	sleep 15
	return 0
}

_pumpCompanion-frame() {
	_pumpCompanion-frame-kilo "$@"
}















_gnuradioCompanion() {
	# Beware for direct electrical connections most noise will be jitter from DAC/ADC hardware, quantization error, etc.
	# Forward Error Correction of any kind may not be useful, especially if not Burst Error Correction .
	# Any FEC used should be punctured down to minimal overhead to get the exponential benefit of any correction at all without wasting bandwidth.
	
	# Complexity must be kept to a minimum.
	
	#/usr/share/gnuradio/examples/digital/demod/constellation_soft_decoder.grc
	#/usr/share/gnuradio/examples/fec/fecapi_decoders.grc
	#/usr/share/gnuradio/examples/fec/fecapi_ldpc_decoders.grc
	gnuradio-companion "$scriptAbsoluteFolder"/pumpCompanion-experiment.grc "$scriptAbsoluteFolder"/_ref/scrap.grc "$scriptAbsoluteFolder"/_ref/scratch.grc "$scriptAbsoluteFolder"/_ref/fsk/pumpCompanion_experiment_fsk.grc /usr/share/gnuradio/examples/digital/demod/constellation_soft_decoder.grc /usr/share/gnuradio/examples/fec/fecapi_decoders.grc /usr/share/gnuradio/examples/fec/fecapi_ldpc_decoders.grc &
	
	disown -h $!
	disown -a -h -r
	disown -a -r
}

_refresh_anchors() {
	#cp -a "$scriptAbsoluteFolder"/_anchor ./_pumpCompanion-frame
	#cp -a "$scriptAbsoluteFolder"/_anchor ./_pumpCompanion-deframe
	
	cp -a "$scriptAbsoluteFolder"/_anchor.bat ./_pumpCompanion-frame.bat
	cp -a "$scriptAbsoluteFolder"/_anchor.bat ./_pumpCompanion-deframe.bat
	
	
	#cp -a "$scriptAbsoluteFolder"/_anchor ./_pumpCompanion-frame-mega
	cp -a "$scriptAbsoluteFolder"/_anchor ./_pumpCompanion-frame-mega.bat
	
	cp -a "$scriptAbsoluteFolder"/_anchor ./_gnuradioCompanion
	#cp -a "$scriptAbsoluteFolder"/_anchor.bat ./_gnuradioCompanion.bat
}

