##### Core


_pumpCompanion-frame() {
	_messageNormal '_pumpCompanion-frame'
	
	if [[ $(head -c 288 "$HOME"/Downloads/_in.bin | tr -dc 'a-z0-9') == "f0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03ae" ]]
	then
		_messagePlain_bad 'bad: anomaly: input framed'
		_messageError 'FAIL: seems VERY BAD'
		_messageFAIL
		return 1
	fi
	
	if [[ -e "$HOME"/Downloads/_framed.bin ]] && [[ $(head -c 288 "$HOME"/Downloads/_framed.bin | tr -dc 'a-z0-9') != "f0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03ae" ]]
	then
		_messagePlain_bad 'bad: already INCORRECTLY framed: head'
		_messageError 'FAIL: seems VERY BAD'
		_messageFAIL
		return 1
	fi
	
	if [[ -e "$HOME"/Downloads/_framed.bin ]] && [[ $(tail -c 289 "$HOME"/Downloads/_framed.bin | tr -dc 'a-z0-9') != "2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a" ]]
	then
		_messagePlain_bad 'bad: already INCORRECTLY framed: tail'
		_messageError 'FAIL: seems VERY BAD'
		_messageFAIL
		return 1
	fi
	
	
	if [[ -e "$HOME"/Downloads/_framed.bin ]] && [[ $(head -c 288 "$HOME"/Downloads/_framed.bin | tr -dc 'a-z0-9') == "f0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03ae" ]] && [[ $(tail -c 289 "$HOME"/Downloads/_framed.bin | tr -dc 'a-z0-9') == "2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a" ]]
	then
		_messagePlain_good 'good: already framed'
		return 0
	fi
	
	
	
	
	#'_pumpCompanion-frame 0.3183098862 3.1415926535897932384626433832795028841971693993751058209749445923078164 06286208998628034825342117067' | md5sum
	#f0d81c2b72c2def16da7e2c9860c03ae
	echo "f0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03ae" > "$HOME"/Downloads/_framed.bin
	
	echo >> "$HOME"/Downloads/_framed.bin
	
	cat "$HOME"/Downloads/_in.bin | xz -z -e9 -C crc64 --threads=1 | base64 -w 156 >> "$HOME"/Downloads/_framed.bin
	
	echo >> "$HOME"/Downloads/_framed.bin
	
	#'echo '_pumpCompanion-frame END 0.3183098862 3.1415926535897932384626433832795028841971693993751058209749445923078164 06286208998628034825342117067' | md5sum'
	#2025bae2a82c9792a5c3090075a3902a
	echo "2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a" >> "$HOME"/Downloads/_framed.bin
	
	
	
	
	
	
	
	
	
	if [[ ! -e "$HOME"/Downloads/_framed.bin ]] || [[ $(head -c 288 "$HOME"/Downloads/_framed.bin | tr -dc 'a-z0-9') != "f0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03ae" ]] || [[ $(tail -c 289 "$HOME"/Downloads/_framed.bin | tr -dc 'a-z0-9') != "2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a" ]]
	then
		_messagePlain_bad 'bad: fail'
		_messageFAIL
		return 1
	fi
	
	
	_messagePlain_good 'good: success'
	_messagePlain_nominal 'done: _pumpCompanion-frame'
	#_messageNormal '_pumpCompanion-frame: done'
	return 0
}

_pumpCompanion-deframe() {
	_messageNormal '_pumpCompanion-deframe'
	
	#|| [[ $(head -c 288 "$HOME"/Downloads/_framed.bin | tr -dc 'a-z0-9') != "f0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03ae" ]] || [[ $(tail -c 289 "$HOME"/Downloads/_framed.bin | tr -dc 'a-z0-9') != "2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a" ]]
	if [[ ! -e "$HOME"/Downloads/_framed.bin ]]
	then
		_messagePlain_bad 'bad: fail: missing or incorrect: _framed.bin'
		_messageFAIL
		return 1
	fi
	
	#cat "$HOME"/Downloads/_framed.bin | grep -v "f0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03ae" | grep -v "2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a" | base64 -d > "$HOME"/Downloads/_out.bin
	
	# ATTRIBUTION: ChatGPT4 2023-12-15 .
	head -c $(($(grep -aobm 1 '2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a' "$HOME"/Downloads/_framed.bin | cut -d: -f1) + 0 - 1)) "$HOME"/Downloads/_framed.bin | tail -c +$(($(grep -aobm 1 'f0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03ae' "$HOME"/Downloads/_framed.bin | cut -d: -f1) + 288 + 3)) | base64 -d | xz -d > "$HOME"/Downloads/_out.bin
	
	
	
	
	
	_messagePlain_nominal 'done: _pumpCompanion-deframe'
}








_refresh_anchors() {
	cp -a "$scriptAbsoluteFolder"/_anchor ./_pumpCompanion-frame
	cp -a "$scriptAbsoluteFolder"/_anchor ./_pumpCompanion-deframe
	
	cp -a "$scriptAbsoluteFolder"/_anchor.bat ./_pumpCompanion-frame.bat
	cp -a "$scriptAbsoluteFolder"/_anchor.bat ./_pumpCompanion-deframe.bat
}
