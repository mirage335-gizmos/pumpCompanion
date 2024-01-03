##### Core


_pumpCompanion-data-encode() {
	#xz -z -e9 -C crc64 --threads=1
	#lz4 -z --fast=1 - - | cat
	#tr 'A-Za-z' 'N-ZA-Mn-za-m'
	# rot13 prevents lz4 from emitting plain header/footer, while otherwise preserving compressibility and character set limitations
	#base64 -w 156
	#cat /dev/urandom | base64 | tr -dc 'a-zA-Z0-9+/' 2> /dev/null | head -c 384 | cat - "$pumpCompanion_inFile"
	
	#base64 -w 156
	cat "$pumpCompanion_inFile" | xz -z -e9 -C crc64 --threads=1 >> "$pumpCompanion_encodedFile"
}


_pumpCompanion-frame-minimal() {
	if [[ $(head -c 11 "$pumpCompanion_inFile" | tr -dc 'a-zA-Z0-9+/') == "8NgcK3LC3g" ]]
	then
		_messagePlain_bad 'bad: anomaly: input framed'
		_messageError 'FAIL: seems BAD'
		_messageFAIL
		return 1
	fi
	
	
	if [[ -e "$pumpCompanion_framedFile" ]] && [[ $(head -c 11 "$pumpCompanion_framedFile" | tr -dc 'a-zA-Z0-9+/') == "8NgcK3LC3g" ]] && [[ $(tail -c 13 "$pumpCompanion_framedFile" | tr -dc 'a-zA-Z0-9+/') == "ICW64qgsl5I" ]]
	then
		_messagePlain_good 'good: already framed'
		return 0
	fi
	
	
	
	echo >> "$pumpCompanion_framedFile"
	
	#echo '_pumpCompanion-frame 0.3183098862 3.1415926535897932384626433832795028841971693993751058209749445923078164 06286208998628034825342117067' | md5sum
	#f0d81c2b72c2def16da7e2c9860c03ae
	#echo -n 'f0d81c2b72c2def16da7e2c9860c03ae' | head -c 14 | xxd -p -r | base64 | tr -d '='
	echo "8NgcK3LC3g" >> "$pumpCompanion_framedFile"
	
	echo >> "$pumpCompanion_framedFile"
	cat "$pumpCompanion_encodedFile" >> "$pumpCompanion_framedFile"
	rm -f "$pumpCompanion_encodedFile"
	
	echo >> "$pumpCompanion_framedFile"
	
	#echo '_pumpCompanion-frame END 0.3183098862 3.1415926535897932384626433832795028841971693993751058209749445923078164 06286208998628034825342117067' | md5sum
	#2025bae2a82c9792a5c3090075a3902a
	#echo -n '2025bae2a82c9792a5c3090075a3902a' | head -c 16 | xxd -p -r | base64 | tr -d '='
	echo "ICW64qgsl5I" >> "$pumpCompanion_framedFile"
	
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
	
	local currentExitStatus_deframeEncoded
	currentExitStatus_deframeEncoded="0"
	
	local currentExitStatus_deframeRepaired
	currentExitStatus_deframeRepaired="0"
	
	#if [[ -e "$pumpCompanion_framedFile" ]] && ! grep "ICW64qgsl5I" "$pumpCompanion_framedFile" > /dev/null 2>&1
	#then
		#_messagePlain_bad 'bad: fail: incomplete: _framed.rrf'
		#_messageFAIL
		#return 1
	#fi
	
	#|| [[ $(head -c 11 "$pumpCompanion_framedFile" | tr -dc 'a-zA-Z0-9+/') != "8NgcK3LC3g" ]] || [[ $(tail -c 13 "$pumpCompanion_framedFile" | tr -dc 'a-zA-Z0-9+/') != "ICW64qgsl5I" ]]
	if [[ ! -e "$pumpCompanion_framedFile" ]]
	then
		_messagePlain_bad 'bad: fail: missing or incorrect: _framed.rrf'
		_messageFAIL
		return 1
	fi
	
	#cat "$pumpCompanion_framedFile" | grep -v "8NgcK3LC3g" | grep -v "ICW64qgsl5I" | base64 -d > "$pumpCompanion_outFile"
	
	
	
	# ATTRIBUTION: ChatGPT4 2023-12-15 .
	#xz -d
	#lz4 -d -c
	#tr 'A-Za-z' 'N-ZA-Mn-za-m'
	# rot13 prevents lz4 from emitting plain header/footer, while otherwise preserving compressibility and character set limitations
	#base64 -d
	#tail -c +385
	head -c $(($(grep -aobm 1 'ICW64qgsl5I' "$pumpCompanion_framedFile" | cut -d: -f1) + 0 - 1)) "$pumpCompanion_framedFile" | tail -c +$(($(grep -aobm 1 '8NgcK3LC3g' "$pumpCompanion_framedFile" | cut -d: -f1) + 10 + 3)) > "$pumpCompanion_encodedFile"
	currentExitStatus_deframeEncoded="$?"
	
	
	# ###
	#if false
	#then
	#base64 -d
	rm -f "$pumpCompanion_encodedFile".parity.r3.par2
	! head -c $(($(grep -aobm 1 'IxkFyUCBLg' "$pumpCompanion_framedFile" | cut -d: -f1) + 0 - 1)) "$pumpCompanion_framedFile" | tail -c +$(($(grep -aobm 1 'u/kDyWI8wQ' "$pumpCompanion_framedFile" | cut -d: -f1) + 10 + 3)) > "$pumpCompanion_encodedFile".parity.r3.par2 && _messagePlain_warn 'warn: missing: parity r3'
	#fi
	# ###
	
	# ###
	if false
	then
	rm -f "$pumpCompanion_encodedFile".parity.r15.par2
	! head -c $(($(grep -aobm 1 'RZBbiTaiPg' "$pumpCompanion_framedFile" | cut -d: -f1) + 0 - 1)) "$pumpCompanion_framedFile" | tail -c +$(($(grep -aobm 1 'XNHhnDH10Q' "$pumpCompanion_framedFile" | cut -d: -f1) + 10 + 3)) > "$pumpCompanion_encodedFile".parity.r15.par2 && _messagePlain_warn 'warn: missing: parity r15'
	fi
	# ###
	
	rm -f "$pumpCompanion_encodedFile".parity.rrf.par2
	! head -c $(($(grep -aobm 1 'FYMhlEknEQ' "$pumpCompanion_framedFile" | cut -d: -f1) + 0 - 1)) "$pumpCompanion_framedFile" | tail -c +$(($(grep -aobm 1 '60+oa3M8eQ' "$pumpCompanion_framedFile" | cut -d: -f1) + 10 + 3)) > "$pumpCompanion_encodedFile".parity.rrf.par2 && _messagePlain_warn 'warn: missing: parity r_index'
	
	rm -f "$pumpCompanion_encodedFile".parity.r_default.par2
	! head -c $(($(grep -aobm 1 'fqFim53L7w' "$pumpCompanion_framedFile" | cut -d: -f1) + 0 - 1)) "$pumpCompanion_framedFile" | tail -c +$(($(grep -aobm 1 'vbbNbIdgqQ' "$pumpCompanion_framedFile" | cut -d: -f1) + 10 + 3)) > "$pumpCompanion_encodedFile".parity.r_default.par2 && _messagePlain_warn 'warn: missing: parity r_default'
	
	mv -f "$pumpCompanion_encodedFile" "$pumpCompanion_encodedFile".parity.rrf
	#"$pumpCompanion_encodedFile".parity.r3.par2 "$pumpCompanion_encodedFile".parity.r11.par2 "$pumpCompanion_encodedFile".parity.r15.par2
	par2 repair -p "$pumpCompanion_encodedFile".parity.rrf "$pumpCompanion_encodedFile".parity.rrf.par2 "$pumpCompanion_encodedFile".parity.r3.par2 "$pumpCompanion_encodedFile".parity.r_default.par2
	currentExitStatus_deframeRepaired="$?"
	
	[[ "$currentExitStatus_deframeRepaired" != "0" ]] && _messagePlain_warn 'warn: bad: parity'
	
	
	#base64 -d
	#lz4 -d -c
	#tr 'A-Za-z' 'N-ZA-Mn-za-m'
	# rot13 prevents lz4 from emitting plain header/footer, while otherwise preserving compressibility and character set limitations
	#xz -d
	if ( [[ "$currentExitStatus_deframeEncoded" == "0" ]] || [[ "$currentExitStatus_deframeRepaired" == "0" ]] )
	then
		mv -f "$pumpCompanion_encodedFile".parity.rrf "$pumpCompanion_encodedFile"
		cat "$pumpCompanion_encodedFile" | xz -d > "$pumpCompanion_outFile"
		rm -f "$pumpCompanion_encodedFile"
	fi
	
	if [[ "$currentExitStatus_deframeEncoded" != "0" ]]
	then
		_messagePlain_bad 'bad: fail: incomplete: _framed.rrf'
		#_messageFAIL
		_messageError 'FAIL'
		sleep 2
		return 1
	fi
	
	rm -f "$pumpCompanion_encodedFile".parity.rrf.par2
	rm -f "$pumpCompanion_encodedFile".parity.r_default.par2
	rm -f "$pumpCompanion_encodedFile".parity.r3.par2
	rm -f "$pumpCompanion_encodedFile".parity.r15.par2
	
	_messagePlain_nominal 'done: _pumpCompanion-deframe'
	sleep 15
	return 0
}

_pumpCompanion-frame-bare() {
	_messageNormal '_pumpCompanion-frame'
	
	if [[ -e "$pumpCompanion_framedFile" ]] && [[ $(head -c 11 "$pumpCompanion_framedFile" | tr -dc 'a-zA-Z0-9+/') != "8NgcK3LC3g" ]]
	then
		_messagePlain_bad 'bad: already INCORRECTLY framed: head'
		_messageError 'FAIL: seems BAD'
		_messageFAIL
		return 1
	fi
	
	if [[ -e "$pumpCompanion_framedFile" ]] && [[ $(tail -c 13 "$pumpCompanion_framedFile" | tr -dc 'a-zA-Z0-9+/') != "ICW64qgsl5I" ]]
	then
		_messagePlain_bad 'bad: already INCORRECTLY framed: tail'
		_messageError 'FAIL: seems BAD'
		_messageFAIL
		return 1
	fi
	
	_pumpCompanion-data-encode
	_pumpCompanion-frame-minimal "$@"
	
	if [[ ! -e "$pumpCompanion_framedFile" ]] || [[ $(head -c 11 "$pumpCompanion_framedFile" | tr -dc 'a-zA-Z0-9+/') != "8NgcK3LC3g" ]] || [[ $(tail -c 13 "$pumpCompanion_framedFile" | tr -dc 'a-zA-Z0-9+/') != "ICW64qgsl5I" ]]
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







_pumpCompanion-frame-fec() {
	_pumpCompanion-data-encode
	
	#rm -f ./_in.rrf.parity.rrf.x.par2 ; par2 create -n1 -r5 _in.rrf.parity.rrf ; rm -f ./_in.rrf.parity.rrf.par2 ; mv -f ./_in.rrf.parity.rrf.*.par2 ./_in.rrf.parity.rrf.x.par2
	#par2 repair -p _in.rrf.parity.rrf _in.rrf.parity.rrf.x.par2
	
	
	mv -f "$pumpCompanion_encodedFile" "$pumpCompanion_encodedFile".parity.rrf
	
	
	# ###
	#if false
	#then
	
	rm -f "$pumpCompanion_encodedFile".parity.*.par2
	par2 create -s8192 -n1 -r6 -f1 "$pumpCompanion_encodedFile".parity.rrf
	#rm -f "$pumpCompanion_encodedFile".parity.rrf.par2
	mv -f "$pumpCompanion_encodedFile".parity.rrf.*.par2 "$pumpCompanion_encodedFile".parity.r_default.par2
	
	#echo '_pumpCompanion-frame PARITY-par2-index 0.3183098862 3.1415926535897932384626433832795028841971693993751058209749445923078164 06286208998628034825342117067' | md5sum
	#echo -n 'eb4fa86b733c79c59f243cb695575a92' | head -c 14 | xxd -p -r | base64 | tr -d '='
	echo >> "$pumpCompanion_framedFile"
	echo "60+oa3M8eQ" >> "$pumpCompanion_framedFile"
	echo >> "$pumpCompanion_framedFile"
	
	#base64 -w 156
	cat "$pumpCompanion_encodedFile".parity.rrf.par2 >> "$pumpCompanion_framedFile"
	rm -f "$pumpCompanion_encodedFile".parity.rrf.par2
	
	#echo '_pumpCompanion-frame END PARITY-par2-index 0.3183098862 3.1415926535897932384626433832795028841971693993751058209749445923078164 06286208998628034825342117067' | md5sum
	#158321944927112ed7da07b3a4ca6723
	echo >> "$pumpCompanion_framedFile"
	echo "FYMhlEknEQ" >> "$pumpCompanion_framedFile"
	echo >> "$pumpCompanion_framedFile"
	
	#echo '_pumpCompanion-frame PARITY-par2-r_default 0.3183098862 3.1415926535897932384626433832795028841971693993751058209749445923078164 06286208998628034825342117067' | md5sum
	#bdb6cd6c8760a98e71db637a0722a45f
	echo >> "$pumpCompanion_framedFile"
	echo "vbbNbIdgqQ" >> "$pumpCompanion_framedFile"
	echo >> "$pumpCompanion_framedFile"
	
	#base64 -w 156
	cat "$pumpCompanion_encodedFile".parity.r_default.par2 >> "$pumpCompanion_framedFile"
	rm -f "$pumpCompanion_encodedFile".parity.r_default.par2
	
	#echo '_pumpCompanion-frame END PARITY-par2-r_default 0.3183098862 3.1415926535897932384626433832795028841971693993751058209749445923078164 06286208998628034825342117067' | md5sum
	#7ea1629b9dcbefdf60b4b8b550443f07
	echo >> "$pumpCompanion_framedFile"
	echo "fqFim53L7w" >> "$pumpCompanion_framedFile"
	echo >> "$pumpCompanion_framedFile"
	
	#fi
	# ###
	
	
	
	# Additional separate parity files may be included if there is some advantage to this, or if more parity is necessary, or if filtering out unnecessary amounts of parity information by header/footer may be useful.
	
	# ###
	#if false
	#then
	
	rm -f "$pumpCompanion_encodedFile".parity.*.par2
	par2 create -s8192 -n1 -r3 -f16384 "$pumpCompanion_encodedFile".parity.rrf
	rm -f "$pumpCompanion_encodedFile".parity.rrf.par2
	mv -f "$pumpCompanion_encodedFile".parity.rrf.*.par2 "$pumpCompanion_encodedFile".parity.r3.par2
	
	#echo '_pumpCompanion-frame PARITY-par2-r3 0.3183098862 3.1415926535897932384626433832795028841971693993751058209749445923078164 06286208998628034825342117067' | md5sum
	#bbf903c9623cc1e1314c72ef3c165992
	echo >> "$pumpCompanion_framedFile"
	echo "u/kDyWI8wQ" >> "$pumpCompanion_framedFile"
	echo >> "$pumpCompanion_framedFile"
	
	#base64 -w 156
	cat "$pumpCompanion_encodedFile".parity.r3.par2 >> "$pumpCompanion_framedFile"
	rm -f "$pumpCompanion_encodedFile".parity.r3.par2
	
	#echo '_pumpCompanion-frame END PARITY-par2-r3 0.3183098862 3.1415926535897932384626433832795028841971693993751058209749445923078164 06286208998628034825342117067' | md5sum
	#231905c940812e875e79ceb7506941bf
	echo >> "$pumpCompanion_framedFile"
	echo "IxkFyUCBLg" >> "$pumpCompanion_framedFile"
	echo >> "$pumpCompanion_framedFile"
	
	#fi
	# ###
	
	
	# ###
	if false
	then
	
	rm -f "$pumpCompanion_encodedFile".parity.*.par2
	par2 create -n1 -r11 -f16384 "$pumpCompanion_encodedFile".parity.rrf
	rm -f "$pumpCompanion_encodedFile".parity.rrf.par2
	mv -f "$pumpCompanion_encodedFile".parity.rrf.*.par2 "$pumpCompanion_encodedFile".parity.r11.par2
	
	#echo '_pumpCompanion-frame PARITY-par2-r11 0.3183098862 3.1415926535897932384626433832795028841971693993751058209749445923078164 06286208998628034825342117067' | md5sum
	#daf1cc79d95ae160aa4d84d8e1021027
	echo >> "$pumpCompanion_framedFile"
	echo "2vHMedla4Q" >> "$pumpCompanion_framedFile"
	echo >> "$pumpCompanion_framedFile"
	
	#base64 -w 156
	cat "$pumpCompanion_encodedFile".parity.r11.par2 >> "$pumpCompanion_framedFile"
	rm -f "$pumpCompanion_encodedFile".parity.r11.par2
	
	#echo '_pumpCompanion-frame END PARITY-par2-r11 0.3183098862 3.1415926535897932384626433832795028841971693993751058209749445923078164 06286208998628034825342117067' | md5sum
	#8b79bbe8cc1cefc34ed6d9bff82c407d
	echo >> "$pumpCompanion_framedFile"
	echo "i3m76Mwc7w" >> "$pumpCompanion_framedFile"
	echo >> "$pumpCompanion_framedFile"
	
	fi
	# ###
	
	
	# ###
	if false
	then
	
	rm -f "$pumpCompanion_encodedFile".parity.*.par2
	par2 create -n1 -r15 -f16384 "$pumpCompanion_encodedFile".parity.rrf
	rm -f "$pumpCompanion_encodedFile".parity.rrf.par2
	mv -f "$pumpCompanion_encodedFile".parity.rrf.*.par2 "$pumpCompanion_encodedFile".parity.r15.par2
	
	#echo '_pumpCompanion-frame PARITY-par2-r15 0.3183098862 3.1415926535897932384626433832795028841971693993751058209749445923078164 06286208998628034825342117067' | md5sum
	#5cd1e19c31f5d13a00e7f165281a0fff
	echo >> "$pumpCompanion_framedFile"
	echo "XNHhnDH10Q" >> "$pumpCompanion_framedFile"
	echo >> "$pumpCompanion_framedFile"
	
	#base64 -w 156
	cat "$pumpCompanion_encodedFile".parity.r15.par2 >> "$pumpCompanion_framedFile"
	rm -f "$pumpCompanion_encodedFile".parity.r15.par2
	
	#echo '_pumpCompanion-frame END PARITY-par2-r15 0.3183098862 3.1415926535897932384626433832795028841971693993751058209749445923078164 06286208998628034825342117067' | md5sum
	#45905b8936a23e8fc756fdbcbac0b3ca
	echo >> "$pumpCompanion_framedFile"
	echo "RZBbiTaiPg" >> "$pumpCompanion_framedFile"
	echo >> "$pumpCompanion_framedFile"
	
	fi
	# ###
	
	
	
	# Parity before data prevents reaching the data then subsequently inappropriately reading supposed parity from the data, if the parity header/footer somehow exists in the data .
	# Data before parity may be helpful if there is a significant chance data has already been correctly received or may be used before any subsequent parity .
	mv -f "$pumpCompanion_encodedFile".parity.rrf "$pumpCompanion_encodedFile"
	(while true ; do echo -n '0w0w0w0w0w0w0w0w0w0w0w0w0w0w0w0wthe quick brown fox jumps over the lazy dog THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG 0123456789 37a0w3wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww70w0w0w0w0w0w0w0w0w0w0w0w0w0w0w0w' ; done) | head -c 2100 >> "$pumpCompanion_framedFile"
	echo >> "$pumpCompanion_framedFile"
	_pumpCompanion-frame-minimal "$@"
	
}








_pumpCompanion-frame-kilo() {
	_messageNormal '_pumpCompanion-frame'
	
	rm -f "$pumpCompanion_framedFile"
	sudo -n rm -f "$pumpCompanion_framedFile"
	
	# Eliminates dependency on radio protocol to adjust AGC , sync clock, etc. DC Balanced , large amplitude, large bandwidth.
	#0w
	#0011 0000 0111 0111
	(while true ; do echo -n '0w0w0w0w0w0w0w0w0w0w0w0w0w0w0w0wthe quick brown fox jumps over the lazy dog THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG 0123456789 37a0w3wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww70w0w0w0w0w0w0w0w0w0w0w0w0w0w0w0w' ; done) | head -c 2100 > "$pumpCompanion_framedFile"
	
	_pumpCompanion-data-encode
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
	# 
	# ...
	# 
	# ( ((44100/2)*log2(1+((2^16/10)/1))) bits * 18 to megabytes == 0.62 MB
	# (0.62 megabytes) / (44100/3*8 bits) == 42 seconds
	#
	# 192000/3*8 bits * 12 to megabytes == 0.77 MB
	# (0.77 megabytes) / (44100/3*8 bits) == 52 seconds
	#
	# 44100/3*8 bits * 18 to bytes == 264600 Bytes
	#  Theoretically preferable, assuming AGC rate scales more with constellation size than sample rate.
	# 
	# ...
	# 
	# 72kbits * (120+15) to bytes == 1350000
	(while true ; do echo -n '0w0w0w0w0w0w0w0w0w0w0w0w0w0w0w0wthe quick brown fox jumps over the lazy dog THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG 0123456789 37a0w3wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww70w0w0w0w0w0w0w0w0w0w0w0w0w0w0w0w' ; done) | head -c 1350100 > "$pumpCompanion_framedFile"
	
	_pumpCompanion-frame-fec "$@"
	#_pumpCompanion-data-encode
	#_pumpCompanion-frame-minimal "$@"
	
	(while true ; do echo -n '0w0w0w0w0w0w0w0w0w0w0w0w0w0w0w0wthe quick brown fox jumps over the lazy dog THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG 0123456789 37a0w3wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww70w0w0w0w0w0w0w0w0w0w0w0w0w0w0w0w' ; done) | head -c 32100 >> "$pumpCompanion_framedFile"
	
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
	
	
	_pumpCompanion-data-encode
	_pumpCompanion-frame-minimal "$@"
	
	(while true ; do echo -n '0w0w0w0w0w0w0w0w0w0w0w0w0w0w0w0wthe quick brown fox jumps over the lazy dog THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG 0123456789 37a0w3wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww70w0w0w0w0w0w0w0w0w0w0w0w0w0w0w0w' ; done) | head -c 66100 >> "$pumpCompanion_framedFile"
	
	_messagePlain_nominal 'done: _pumpCompanion-frame'
	#_messageNormal '_pumpCompanion-frame: done'
	sleep 15
	return 0
}

_pumpCompanion-frame() {
	_pumpCompanion-frame-mega "$@"
}















_gnuradioCompanion-dev() {
	# Beware for direct electrical connections most noise will be jitter from DAC/ADC hardware, quantization error, etc.
	# Forward Error Correction of any kind may not be useful, especially if not Burst Error Correction .
	# Any FEC used should be punctured down to minimal overhead to get the exponential benefit of any correction at all without wasting bandwidth.
	
	# Complexity must be kept to a minimum.
	
	#/usr/share/gnuradio/examples/digital/demod/constellation_soft_decoder.grc
	#/usr/share/gnuradio/examples/fec/fecapi_decoders.grc
	#/usr/share/gnuradio/examples/fec/fecapi_ldpc_decoders.grc
	gnuradio-companion "$scriptAbsoluteFolder"/pumpCompanion_experiment.grc "$scriptAbsoluteFolder"/_ref/scrap.grc "$scriptAbsoluteFolder"/_ref/scratch.grc "$scriptAbsoluteFolder"/_ref/fsk/pumpCompanion_experiment_fsk.grc /usr/share/gnuradio/examples/digital/demod/constellation_soft_decoder.grc /usr/share/gnuradio/examples/fec/fecapi_decoders.grc /usr/share/gnuradio/examples/fec/fecapi_ldpc_decoders.grc /usr/share/gnuradio/examples/digital/mpsk_stage6.grc &
	
	disown -h $!
	disown -a -h -r
	disown -a -r
}



_gnuradioCompanion() {
	# CAUTION: Complexity must be kept to a minimum.
	
	if ! _if_cygwin
	then
		gnuradio-companion "$scriptAbsoluteFolder"/pumpCompanion_audio_rx.grc "$scriptAbsoluteFolder"/pumpCompanion_audio_tx.grc "$scriptAbsoluteFolder"/pumpCompanion_experiment.grc &
		
		disown -h $!
		disown -a -h -r
		disown -a -r
	else
		local currentHomePathMSW
		currentHomePathMSW=$(cygpath -D | sed 's/\/Desktop$//')
		
		#_discoverResource-cygwinNative-ProgramFiles 'qalc' 'Qalculate' false
		
		cd "$currentHomePathMSW"
		
		#os.path.join(os.environ['HOME'], 'Downloads', '_diag.rrf') if os.name == 'posix' else  os.path.join(os.environ['USERPROFILE'], 'Downloads', '_diag.rrf')
		
		#&
		#_userMSW start "" "$currentHomePathMSW"/radioconda/python.exe "$currentHomePathMSW"/radioconda/cwp.py "$currentHomePathMSW"/radioconda "$currentHomePathMSW"/radioconda/Scripts/gnuradio-companion.exe "$scriptAbsoluteFolder"/pumpCompanion_experiment.grc "$scriptAbsoluteFolder"/pumpCompanion_audio_rx-msw.grc "$scriptAbsoluteFolder"/pumpCompanion_audio_tx-msw.grc
		_userMSW start "" "$currentHomePathMSW"/radioconda/python.exe "$currentHomePathMSW"/radioconda/cwp.py "$currentHomePathMSW"/radioconda "$currentHomePathMSW"/radioconda/Scripts/gnuradio-companion.exe "$scriptAbsoluteFolder"/pumpCompanion_audio_rx.grc "$scriptAbsoluteFolder"/pumpCompanion_audio_tx.grc "$scriptAbsoluteFolder"/pumpCompanion_experiment.grc
		
		#disown -h $!
		#disown -a -h -r
		#disown -a -r
	fi
	
	sleep 2
}



_refresh_anchors() {
	_setup_prog
	
	
	
	##cp -a "$scriptAbsoluteFolder"/_anchor ./_pumpCompanion-frame
	##cp -a "$scriptAbsoluteFolder"/_anchor ./_pumpCompanion-deframe
	
	#cp -a "$scriptAbsoluteFolder"/_anchor.bat ./_pumpCompanion-frame.bat
	#cp -a "$scriptAbsoluteFolder"/_anchor.bat ./_pumpCompanion-deframe.bat
	
	
	# May need an expensively fast SDR .
	##cp -a "$scriptAbsoluteFolder"/_anchor ./_pumpCompanion-frame-giga.bat
	
	#cp -a "$scriptAbsoluteFolder"/_anchor ./_gnuradioCompanion
	##cp -a "$scriptAbsoluteFolder"/_anchor.bat ./_gnuradioCompanion.bat
}





_anchor_special() {
	_anchor_configure
	
	cp -a "$scriptAbsoluteFolder"/_anchor ./_gnuradioCompanion
	"$scriptAbsoluteFolder"/pumpCompanion-lean.sh _anchor_configure "$scriptAbsoluteFolder"/_gnuradioCompanion
	cp -a "$scriptAbsoluteFolder"/_anchor.bat ./_gnuradioCompanion.bat
	"$scriptAbsoluteFolder"/pumpCompanion-lean.sh _anchor_configure "$scriptAbsoluteFolder"/_gnuradioCompanion.bat
	
	
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_pumpCompanion-frame.bat
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_pumpCompanion-deframe.bat
	"$scriptAbsoluteFolder"/pumpCompanion-lean.sh _anchor_configure "$scriptAbsoluteFolder"/_pumpCompanion-frame.bat
	"$scriptAbsoluteFolder"/pumpCompanion-lean.sh _anchor_configure "$scriptAbsoluteFolder"/_pumpCompanion-deframe.bat
	

	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_bin.bat
	"$scriptAbsoluteFolder"/ubiquitous_bash.sh _anchor_configure "$scriptAbsoluteFolder"/_bin.bat

	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_bin_rotten.bat
	"$scriptAbsoluteFolder"/pumpCompanion.sh _anchor_configure "$scriptAbsoluteFolder"/_bin_rotten.bat
	
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_true.bat
	"$scriptAbsoluteFolder"/pumpCompanion.sh _anchor_configure "$scriptAbsoluteFolder"/_true.bat
	
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_false.bat
	"$scriptAbsoluteFolder"/pumpCompanion.sh _anchor_configure "$scriptAbsoluteFolder"/_false.bat

	
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_test.bat
	"$scriptAbsoluteFolder"/pumpCompanion-lean.sh _anchor_configure "$scriptAbsoluteFolder"/_test.bat
	
	cp -a "$scriptAbsoluteFolder"/_anchor.bat "$scriptAbsoluteFolder"/_test_rotten.bat
	"$scriptAbsoluteFolder"/pumpCompanion.sh _anchor_configure "$scriptAbsoluteFolder"/_test_rotten.bat
}
