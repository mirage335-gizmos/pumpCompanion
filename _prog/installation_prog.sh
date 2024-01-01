
_setup_prog() {
	sudo -n apt-get install -y dar
	_getDep dar
	
	sudo -n apt-get install -y par2
	_getDep par2
}


