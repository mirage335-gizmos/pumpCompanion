##### Core


_pumpCompanion-frame-minimal() {
	if [[ $(head -c 289 "$HOME"/Downloads/_in.rrf | tr -dc 'a-z0-9') == "f0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03ae" ]]
	then
		_messagePlain_bad 'bad: anomaly: input framed'
		_messageError 'FAIL: seems BAD'
		_messageFAIL
		return 1
	fi
	
	
	if [[ -e "$HOME"/Downloads/_framed.rrf ]] && [[ $(head -c 289 "$HOME"/Downloads/_framed.rrf | tr -dc 'a-z0-9') == "f0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03ae" ]] && [[ $(tail -c 290 "$HOME"/Downloads/_framed.rrf | tr -dc 'a-z0-9') == "2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a" ]]
	then
		_messagePlain_good 'good: already framed'
		return 0
	fi
	
	
	
	echo >> "$HOME"/Downloads/_framed.rrf
	
	#'_pumpCompanion-frame 0.3183098862 3.1415926535897932384626433832795028841971693993751058209749445923078164 06286208998628034825342117067' | md5sum
	#f0d81c2b72c2def16da7e2c9860c03ae
	echo "f0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03ae" >> "$HOME"/Downloads/_framed.rrf
	
	echo >> "$HOME"/Downloads/_framed.rrf
	
	#xz -z -e9 -C crc64 --threads=1
	#lz4 -z --fast=1 - - | cat
	cat "$HOME"/Downloads/_in.rrf | lz4 -z --fast=1 - - | base64 -w 156 >> "$HOME"/Downloads/_framed.rrf
	
	echo >> "$HOME"/Downloads/_framed.rrf
	
	#'echo '_pumpCompanion-frame END 0.3183098862 3.1415926535897932384626433832795028841971693993751058209749445923078164 06286208998628034825342117067' | md5sum'
	#2025bae2a82c9792a5c3090075a3902a
	echo "2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a" >> "$HOME"/Downloads/_framed.rrf
	
	echo >> "$HOME"/Downloads/_framed.rrf
	
	
	
	
	
	
	
	
	
	if [[ ! -e "$HOME"/Downloads/_framed.rrf ]]
	then
		_messagePlain_bad 'bad: fail'
		_messageFAIL
		return 1
	fi
	return 0
}

_pumpCompanion-deframe() {
	_messageNormal '_pumpCompanion-deframe'
	
	#if [[ -e "$HOME"/Downloads/_framed.rrf ]] && ! grep "2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a" "$HOME"/Downloads/_framed.rrf > /dev/null 2>&1
	#then
		#_messagePlain_bad 'bad: fail: incomplete: _framed.rrf'
		#_messageFAIL
		#return 1
	#fi
	
	#|| [[ $(head -c 289 "$HOME"/Downloads/_framed.rrf | tr -dc 'a-z0-9') != "f0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03ae" ]] || [[ $(tail -c 290 "$HOME"/Downloads/_framed.rrf | tr -dc 'a-z0-9') != "2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a" ]]
	if [[ ! -e "$HOME"/Downloads/_framed.rrf ]]
	then
		_messagePlain_bad 'bad: fail: missing or incorrect: _framed.rrf'
		_messageFAIL
		return 1
	fi
	
	#cat "$HOME"/Downloads/_framed.rrf | grep -v "f0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03ae" | grep -v "2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a" | base64 -d > "$HOME"/Downloads/_out.rrf
	
	# ATTRIBUTION: ChatGPT4 2023-12-15 .
	#xz -d
	if ! head -c $(($(grep -aobm 1 '2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a' "$HOME"/Downloads/_framed.rrf | cut -d: -f1) + 0 - 1)) "$HOME"/Downloads/_framed.rrf | tail -c +$(($(grep -aobm 1 'f0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03ae' "$HOME"/Downloads/_framed.rrf | cut -d: -f1) + 288 + 3)) | base64 -d | lz4 -d -c > "$HOME"/Downloads/_out.rrf
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
	
	if [[ -e "$HOME"/Downloads/_framed.rrf ]] && [[ $(head -c 289 "$HOME"/Downloads/_framed.rrf | tr -dc 'a-z0-9') != "f0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03ae" ]]
	then
		_messagePlain_bad 'bad: already INCORRECTLY framed: head'
		_messageError 'FAIL: seems BAD'
		_messageFAIL
		return 1
	fi
	
	if [[ -e "$HOME"/Downloads/_framed.rrf ]] && [[ $(tail -c 290 "$HOME"/Downloads/_framed.rrf | tr -dc 'a-z0-9') != "2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a" ]]
	then
		_messagePlain_bad 'bad: already INCORRECTLY framed: tail'
		_messageError 'FAIL: seems BAD'
		_messageFAIL
		return 1
	fi
	
	_pumpCompanion-frame-minimal "$@"
	
	if [[ ! -e "$HOME"/Downloads/_framed.rrf ]] || [[ $(head -c 289 "$HOME"/Downloads/_framed.rrf | tr -dc 'a-z0-9') != "f0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03ae" ]] || [[ $(tail -c 290 "$HOME"/Downloads/_framed.rrf | tr -dc 'a-z0-9') != "2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a" ]]
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
	
	rm -f "$HOME"/Downloads/_framed.rrf
	sudo -n rm -f "$HOME"/Downloads/_framed.rrf
	
	# Eliminates dependency on radio protocol to adjust AGC , sync clock, etc. DC Balanced , large amplitude, large bandwidth.
	#0w
	#0011 0000 0111 0111
	(while true ; do echo '307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077' ; done) | xxd -p -r | head -c 2100 > "$HOME"/Downloads/_framed.rrf
	
	_pumpCompanion-frame-minimal "$@"
	
	(while true ; do echo '307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077' ; done) | xxd -p -r | head -c 300 >> "$HOME"/Downloads/_framed.rrf
	
	_messagePlain_nominal 'done: _pumpCompanion-frame'
	#_messageNormal '_pumpCompanion-frame: done'
	sleep 15
	return 0
}

_pumpCompanion-frame-mega() {
	_messageNormal '_pumpCompanion-frame'
	
	rm -f "$HOME"/Downloads/_framed.rrf
	sudo -n rm -f "$HOME"/Downloads/_framed.rrf
	
	# Eliminates dependency on radio protocol to adjust AGC , sync clock, etc. DC Balanced , large amplitude, large bandwidth.
	#0w
	#0011 0000 0111 0111
	# ( ((8*10^6)*log2(1+(100/1))) bits * 12 / 4 to megabytes
	# 12 seconds at one quarter of 8MHz channel
	(while true ; do echo '307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077' ; done) | xxd -p -r | head -c 20000100 > "$HOME"/Downloads/_framed.rrf
	
	
	_pumpCompanion-frame-minimal "$@"
	
	(while true ; do echo '307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077' ; done) | xxd -p -r | head -c 66100 >> "$HOME"/Downloads/_framed.rrf
	
	_messagePlain_nominal 'done: _pumpCompanion-frame'
	#_messageNormal '_pumpCompanion-frame: done'
	sleep 15
	return 0
}

_pumpCompanion-frame-giga() {
	_messageNormal '_pumpCompanion-frame'
	
	rm -f "$HOME"/Downloads/_framed.rrf
	sudo -n rm -f "$HOME"/Downloads/_framed.rrf
	
	# Eliminates dependency on radio protocol to adjust AGC , sync clock, etc. DC Balanced , large amplitude, large bandwidth.
	#0w
	#0011 0000 0111 0111
	# (( ((150*10^6)*log2(1+(100/1))) bits ) * 12 / 4 to megabytes
	# 12 seconds at one quarter of 150MHz channel
	(while true ; do echo '307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077' ; done) | xxd -p -r | head -c 360000100 > "$HOME"/Downloads/_framed.rrf
	
	
	_pumpCompanion-frame-minimal "$@"
	
	(while true ; do echo '307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077307730773077' ; done) | xxd -p -r | head -c 66100 >> "$HOME"/Downloads/_framed.rrf
	
	_messagePlain_nominal 'done: _pumpCompanion-frame'
	#_messageNormal '_pumpCompanion-frame: done'
	sleep 15
	return 0
}

_pumpCompanion-frame() {
	_pumpCompanion-frame-kilo "$@"
}




_refresh_anchors() {
	cp -a "$scriptAbsoluteFolder"/_anchor ./_pumpCompanion-frame
	cp -a "$scriptAbsoluteFolder"/_anchor ./_pumpCompanion-deframe
	
	cp -a "$scriptAbsoluteFolder"/_anchor.bat ./_pumpCompanion-frame.bat
	cp -a "$scriptAbsoluteFolder"/_anchor.bat ./_pumpCompanion-deframe.bat
	
	
	cp -a "$scriptAbsoluteFolder"/_anchor ./_pumpCompanion-frame-mega
	cp -a "$scriptAbsoluteFolder"/_anchor ./_pumpCompanion-frame-mega.bat
}

