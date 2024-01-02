
_setup_prog() {
	sudo -n apt-get install -y dar
	_getDep dar
	
	sudo -n apt-get install -y par2
	_getDep par2
}


_setup_install() {
	if _if_cygwin
	then
		#mkdir -p "$pumpCompanion_directory"
		true
	fi
	
	return 0
}
