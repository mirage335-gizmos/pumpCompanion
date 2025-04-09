
_setup_prog() {
	
	
	_if_cygwin && return 0

	#sudo -n apt-get install -y dar
	#_getDep dar
	
	sudo -n apt-get install -y par2
	_getDep par2
}


_setup_install() {
	if _if_cygwin
	then
		_self_gitMad
		
		#mkdir -p "$pumpCompanion_directory"
		true
	fi
	
	return 0
}
