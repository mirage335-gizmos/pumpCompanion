
export pumpCompanion_directory="$HOME"/Downloads
if _if_cygwin
then
	export pumpCompanion_directory=$(cygpath -D | sed 's/\/Desktop$//')
	export pumpCompanion_directory="$pumpCompanion_directory"/Downloads
fi


export pumpCompanion_inFile="$pumpCompanion_directory"/_in.rrf
export pumpCompanion_outFile="$pumpCompanion_directory"/_out.rrf
export pumpCompanion_encodedFile="$pumpCompanion_directory"/_encoded.rrf
export pumpCompanion_framedFile="$pumpCompanion_directory"/_framed.rrf


export pumpCompanion_zipFile="$pumpCompanion_directory"/_in.zip

export pumpCompanion_tarFile="$pumpCompanion_directory"/_in.tar
export pumpCompanion_xzFile="$pumpCompanion_directory"/_in.tar.xz
export pumpCompanion_gzFile="$pumpCompanion_directory"/_in.tar.gz


