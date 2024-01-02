
; ATTRIBUTION - May be largely attributable to ChatGPT-4/copilot used by mirage335 .
; ATTRIBUTION - https://nsis.sourceforge.io/Sample_installation_script_for_an_application
; ATTRIBUTION - https://nsis.sourceforge.io/A_simple_installer_with_start_menu_shortcut_and_uninstaller
; ATTRIBUTION - https://nsis.sourceforge.io/Embedding_other_installers
; ATTRIBUTION - https://stackoverflow.com/questions/3265141/executing-batch-file-in-nsis-installer





RequestExecutionLevel admin




SilentInstall normal
LicenseData "..\..\license-installer.txt"

Name "pumpCompanion"
Icon ".\icon\pumpCompanion.ico"
OutFile "..\..\..\pumpCompanion.exe"






;/SOLID
SetCompressor /FINAL lzma


Page license
;Page directory
Page instfiles

;https://github.com/mirage335-gizmos/pumpCompanion
!define APPNAME "pumpCompanion"
!define COMPANYNAME "pumpCompanion"
!define DESCRIPTION "pumpCompanion"
!define HELPURL "https://github.com/mirage335-gizmos/pumpCompanion"
!define UPDATEURL "https://github.com/mirage335-gizmos/pumpCompanion"
!define ABOUTURL "https://github.com/mirage335-gizmos/pumpCompanion"
!define INSTALLSIZE 2800000
;!define INSTALLSIZE 4500000


Section "Install"
  SetShellVarContext all

  ; Generate a random alphanumeric string
  System::Call 'KERNEL32::GetTickCount()i.r0'
  System::Call 'ADVAPI32::CryptAcquireContext(i0,t""i0,i0,i0,i0)i.r1'
  System::Call 'ADVAPI32::CryptGenRandom(ir1,i10,i0)i'
  System::Call 'ADVAPI32::CryptReleaseContext(ir1,i0)i'
  IntCmp $0 0 0 +3
  IntOp $0 $0 * -1

  RMDir /r "C:\core\infrastructure\pumpCompanion"
  ;RMDir /r /REBOOTOK "C:\core\infrastructure\pumpCompanion"

  SetOutPath "C:\core\infrastructure\pumpCompanion"
  File /r "..\..\..\pumpCompanion-accessories\parts\pumpCompanion\*"

  SetOutPath "C:\core\infrastructure\pumpCompanion\_local\ubcp"
  File /r "..\..\..\pumpCompanion-accessories\parts\ubcp\package_ubcp-core\ubcp\*"


  SetShellVarContext all


  ; WARNING: Silent install may be not normal (ie. may be intended solely for CI tests). Silent install may be untested.
  ;start /wait
  SetOutPath "$TEMP\pumpCompanion_bundle-adhoc\gnuradio"
  File /r "..\..\..\pumpCompanion-accessories\parts\pumpCompanion_bundle-adhoc\gnuradio\*"
  IfSilent +2
  ExecWait "$TEMP\pumpCompanion_bundle-adhoc\gnuradio\radioconda-2023.11.06-Windows-x86_64.exe"
  IfSilent 0 +2
  ExecWait "$TEMP\pumpCompanion_bundle-adhoc\gnuradio\radioconda-2023.11.06-Windows-x86_64.exe /InstallationType=JustMe /RegisterPython=0 /S /D=%UserProfile%\radioconda"


  ExpandEnvStrings $5 %COMSPEC%
  ExecWait '"$5" /C "C:\core\infrastructure\pumpCompanion\_bin.bat" _setup_install $0'
  DetailPrint '"$0"'
  Sleep 2500

  Exec "explorer.exe C:\core\infrastructure\pumpCompanion\README-installer.pdf"

  # Uninstaller - See function un.onInit and section "uninstall" for configuration
	writeUninstaller "C:\core\infrastructure\pumpCompanion-uninst.exe"


  # Start Menu
	;createDirectory "$SMPROGRAMS\${COMPANYNAME}"
	;createShortCut "$SMPROGRAMS\${COMPANYNAME}\${APPNAME}.lnk" "$INSTDIR\app.exe" "" "$INSTDIR\logo.ico"
 
	# Registry information for add/remove programs
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "DisplayName" "${COMPANYNAME} - ${APPNAME} - ${DESCRIPTION}"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "UninstallString" "$\"C:\core\infrastructure\pumpCompanion-uninst.exe$\""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "QuietUninstallString" "$\"C:\core\infrastructure\pumpCompanion-uninst.exe$\" /S"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "InstallLocation" "$\"C:\core\infrastructure\pumpCompanion$\""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "DisplayIcon" "$\"C:\core\infrastructure\pumpCompanion\_lib\nsis\icon\icon.ico$\""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "Publisher" "$\"${COMPANYNAME}$\""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "HelpLink" "$\"${HELPURL}$\""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "URLUpdateInfo" "$\"${UPDATEURL}$\""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "URLInfoAbout" "$\"${ABOUTURL}$\""
	;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "DisplayVersion" "$\"${VERSIONMAJOR}.${VERSIONMINOR}.${VERSIONBUILD}$\""
	;WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "VersionMajor" ${VERSIONMAJOR}
	;WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "VersionMinor" ${VERSIONMINOR}
	# There is no option for modifying or repairing the install
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "NoModify" 1
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "NoRepair" 1
	# Set the INSTALLSIZE constant (!defined at the top of this script) so Add/Remove Programs can accurately report the size
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}" "EstimatedSize" ${INSTALLSIZE}

SectionEnd



function un.onInit
	SetShellVarContext all
 
	#Verify the uninstaller - last chance to back out
	MessageBox MB_OKCANCEL "Permanantly remove ${APPNAME}?" IDOK next
		Abort
	next:
    Nop
functionEnd
 
section "uninstall"
 
	# Remove Start Menu launcher
	;delete "$SMPROGRAMS\${COMPANYNAME}\${APPNAME}.lnk"
	# Try to remove the Start Menu folder - this will only happen if it is empty
	;rmDir "$SMPROGRAMS\${COMPANYNAME}"
  
	# Remove files
  ;RMDir /r "C:\core\infrastructure\pumpCompanion-backup-uninstalled"
  
  ;RMDir /r "C:\core\infrastructure\pumpCompanion"
  RMDir /r /REBOOTOK "C:\core\infrastructure\pumpCompanion"
 
	# Always delete uninstaller as the last action
	delete "C:\core\infrastructure\pumpCompanion-uninst.exe"
 
	# Try to remove the install directory - this will only happen if it is empty
	;rmDir $INSTDIR
 
	# Remove uninstaller information from the registry
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${COMPANYNAME} ${APPNAME}"
sectionEnd








