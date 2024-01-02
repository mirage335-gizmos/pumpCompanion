_generate_compile_bash_prog() {
	"$scriptAbsoluteLocation" _true
	
	#return
	
	rm "$scriptAbsoluteFolder"/ubiquitous_bash.sh
	
	#"$scriptAbsoluteLocation" _compile_bash cautossh cautossh
	"$scriptAbsoluteLocation" _compile_bash lean pumpCompanion-lean.sh
	
	#"$scriptAbsoluteLocation" _compile_bash core ubiquitous_bash.sh
	
	"$scriptAbsoluteLocation" _compile_bash rotten_test-pumpCompanion pumpCompanion.sh
	
	"$scriptAbsoluteLocation" _compile_bash complete ubiquitous_bash.sh
	
	#"$scriptAbsoluteLocation" _compile_bash "" ""
	#"$scriptAbsoluteLocation" _compile_bash ubiquitous_bash ubiquitous_bash.sh
	
	#"$scriptAbsoluteLocation" _package
}
