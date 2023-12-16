##### Core


_pumpCompanion-frame() {
	_messageNormal '_pumpCompanion-frame'
	
	if [[ $(head -c 288 "$HOME"/input.bin | tr -dc 'a-z0-9') == "f0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03ae" ]]
	then
		_messagePlain_bad 'bad: anomaly: input framed'
		_messageFAIL
		return 1
	fi
	
	if [[ -e "$HOME"/framed.bin ]] && [[ $(head -c 288 "$HOME"/framed.bin | tr -dc 'a-z0-9') != "f0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03ae" ]]
	then
		_messagePlain_good 'bad: already INCORRECTLY framed'
		_messageFAIL
		return 1
	fi
	
	if [[ -e "$HOME"/framed.bin ]] && [[ $(tail -c 288 "$HOME"/framed.bin | tr -dc 'a-z0-9') != "2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a" ]]
	then
		_messagePlain_good 'bad: already INCORRECTLY framed'
		_messageFAIL
		return 1
	fi
	
	
	if [[ -e "$HOME"/framed.bin ]] && [[ $(head -c 288 "$HOME"/framed.bin | tr -dc 'a-z0-9') == "f0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03ae" ]] && [[ $(tail -c 288 "$HOME"/framed.bin | tr -dc 'a-z0-9') == "2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a" ]]
	then
		_messagePlain_good 'good: already framed'
		return 0
	fi
	
	
	
	
	#'_pumpCompanion-frame 0.3183098862 3.1415926535897932384626433832795028841971693993751058209749445923078164 06286208998628034825342117067' | md5sum
	#f0d81c2b72c2def16da7e2c9860c03ae
	echo "f0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03aef0d81c2b72c2def16da7e2c9860c03ae" > "$HOME"/framed.bin
	
	cat "$HOME"/framed.bin >> "$HOME"/input.bin "$HOME"/framed.bin
	
	#'echo '_pumpCompanion-frame END 0.3183098862 3.1415926535897932384626433832795028841971693993751058209749445923078164 06286208998628034825342117067' | md5sum'
	#2025bae2a82c9792a5c3090075a3902a
	echo "2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a2025bae2a82c9792a5c3090075a3902a" >> "$HOME"/framed.bin
	
	
	
	
	
	
	
	
	
	
	_messagePlain_bad 'bad: fail'
	_messageFAIL
	return 1
}

_pumpCompanion-deframe() {
	echo y
}








_refresh_anchors() {
	cp -a "$scriptAbsoluteLocation" ./_anchor ./_pumpCompanion-frame
	cp -a "$scriptAbsoluteLocation" ./_anchor ./_pumpCompanion-deframe
	
	cp -a "$scriptAbsoluteLocation" ./_anchor.bat ./_pumpCompanion-frame.bat
	cp -a "$scriptAbsoluteLocation" ./_anchor.bat ./_pumpCompanion-deframe.bat
}
