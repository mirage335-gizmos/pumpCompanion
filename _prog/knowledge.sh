
# NOTICE: Strongly recommended to subsequently add autogenerated annotation to improve Retrieval-Augmented-Generation (RAG) with _semanticAssist .

_knowledge-pumpCompanion() {
    [[ "$objectName" != "pumpCompanion" ]] && _stop 1

    _safeRMR "$scriptLocal"/knowledge/pumpCompanion
    mkdir -p "$scriptLocal"/knowledge/pumpCompanion

    mkdir -p "$scriptLocal"/knowledge/pumpCompanion/_lib
    cp -r "$scriptAbsoluteFolder"/_lib/nsis "$scriptLocal"/knowledge/pumpCompanion/_lib/

    cp -r "$scriptAbsoluteFolder"/.github "$scriptLocal"/knowledge/pumpCompanion/

    cp -r "$scriptAbsoluteFolder"/_prog "$scriptLocal"/knowledge/pumpCompanion/

    cp "$scriptAbsoluteFolder"/pumpCompanion_audio_rx.grc "$scriptLocal"/knowledge/pumpCompanion/
    cp "$scriptAbsoluteFolder"/pumpCompanion_audio_tx.grc "$scriptLocal"/knowledge/pumpCompanion/

    cp "$scriptAbsoluteFolder"/license.txt "$scriptLocal"/knowledge/pumpCompanion/
    cp "$scriptAbsoluteFolder"/agpl-3.0.txt "$scriptLocal"/knowledge/pumpCompanion/

    cp "$scriptAbsoluteFolder"/README.sh.out.txt "$scriptLocal"/knowledge/pumpCompanion/
    cp "$scriptAbsoluteFolder"/README-installer.pdf "$scriptLocal"/knowledge/pumpCompanion/
}
