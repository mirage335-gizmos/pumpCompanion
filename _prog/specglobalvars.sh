
export pumpCompanion_directory="$HOME"/Downloads
if _if_cygwin
then
	export pumpCompanion_directory=$(cygpath -D | sed 's/\/Desktop$//')
	export pumpCompanion_directory="$pumpCompanion_directory"/Downloads
fi


export pumpCompanion_inFile="$pumpCompanion_directory"/_in.rrf
export pumpCompanion_outFile="$pumpCompanion_directory"/_out.rrf
export pumpCompanion_framedFile="$pumpCompanion_directory"/_framed.rrf




