
# Unusual.  Closely follows similar functions from 'extendedInterface' due to the very long and arduous build/testing cycle associated with thoroughly testing 'pumpCompanion' .



_getMinimal-build_pumpCompanion() {
    if ! _if_cygwin && ( [[ -e /etc/issue ]] && cat /etc/issue | grep 'Ubuntu' > /dev/null 2>&1 || [[ -e /etc/issue ]] && cat /etc/issue | grep 'Debian\|Raspbian' > /dev/null 2>&1 )
    then
        # ATTRIBUTION-AI ChatGPT o1 2025-01-03 ... partially ... suggested to resolve apparent segmentation fault from 'makensis' on Ubuntu 24.04.1 .
        sudo -n dpkg --add-architecture i386
        sudo -n env DEBIAN_FRONTEND=noninteractive apt-get -y update
        sudo -n env DEBIAN_FRONTEND=noninteractive apt-get install --install-recommends -y libc6:i386 lib32z1
		sudo -n env DEBIAN_FRONTEND=noninteractive apt-get install --install-recommends -y wine wine32 wine64 libwine libwine:i386 fonts-wine
    fi


    ! type makensis && _if_cygwin && _at_userMSW_probeCmd_discoverResource-cygwinNative-ProgramFiles 'makensis' 'NSIS/bin' false
    
    if ! type makensis
    then
        _getMost_backend apt-get update

        #https://askubuntu.com/questions/876240/how-to-automate-setting-up-of-keyboard-configuration-package
        #apt-get install -y debconf-utils
        export DEBIAN_FRONTEND=noninteractive
        
        _set_getMost_backend "$@"
        _test_getMost_backend "$@"
        #_getMost_debian11_aptSources "$@"

        _getMost_backend_aptGetInstall nsis
        
        ## WARNING: May be untested.
        ## Essentially, some OS/distributions are NOT trusted to install a working version of the Nullsoft installer.
        ## Really, Ubuntu may just be the issue. All the migration to snaps was probably responsible for breaking anything needed on a development system. Although it would be helpful for GitHub Actions to use Debian, realistically, the more complicated builds probably already mostly use a ChRoot within another dist/OS .
        #if [[ -e /etc/issue ]] && cat /etc/issue | grep 'Ubuntu' > /dev/null 2>&1
        #then
            #_getMost_backend_aptGetInstall nsis
            #_getMost_backend apt-get remove -y nsis
            #
            ## ATTRIBUTION-AI ChatGPT o1 2025-01-03 ... partially
            #_getMost_backend_aptGetInstall scons
            #_getMost_backend_aptGetInstall zlib1g-dev
            #_getMost_backend_aptGetInstall mingw-w64
            ##git clone https://github.com/kichik/nsis.git
            #_gitBest clone --recursive --depth 1 git@github.com:soaringDistributions/nsis.git
            #cd nsis
            #scons -c
            ###scons -j4
            ###scons SKIPSTUBS=all SKIPPLUGINS=all SKIPUTILS=all SKIPMISC=all NSIS_CONFIG_CONST_DATA_PATH=no PREFIX=/usr/local install-compiler
            ###sudo -n cp build/release/makensis /usr/local/bin/
        #fi
    fi


    if ! type 7za
    then
        _getMost_backend apt-get update

        #https://askubuntu.com/questions/876240/how-to-automate-setting-up-of-keyboard-configuration-package
        #apt-get install -y debconf-utils
        export DEBIAN_FRONTEND=noninteractive
        
        _set_getMost_backend "$@"
        _test_getMost_backend "$@"
        #_getMost_debian11_aptSources "$@"

        _getMost_backend_aptGetInstall p7zip
    fi

    
    _getDep 'makensis'
    _getDep '7za'


    ! type makensis && _if_cygwin && _at_userMSW_probeCmd_discoverResource-cygwinNative-ProgramFiles 'makensis' 'NSIS/bin' false

    type makensis > /dev/null 2>&1
}




_getRelease-ubcp() {
    mkdir -p "$currentAccessoriesDir"/integrations/ubcp
    # Download ubcp release binary if not already present.
    if [[ ! -e "$currentAccessoriesDir"/integrations/ubcp/"$1" ]]
    then
        #-H "Authorization: Bearer ${{ secrets.GITHUB_TOKEN }}"
        #curl -L -o "$currentAccessoriesDir"/integrations/ubcp/"$1"  $(curl -s "https://api.github.com/repos/mirage335/ubiquitous_bash/releases" | jq -r ".[] | select(.name == \"internal\") | .assets[] | select(.name == \"""$1""\") | .browser_download_url" | sort -n -r | head -n1)
        #curl -L -o "$currentAccessoriesDir"/integrations/ubcp/"$1"  $(curl -s "https://api.github.com/repos/mirage335-colossus/ubiquitous_bash/releases" | jq -r ".[] | select(.name == \"internal\") | .assets[] | select(.name == \"""$1""\") | .browser_download_url" | sort -n -r | head -n1)
        _wget_githubRelease "mirage335-colossus/ubiquitous_bash" "internal" "$1" -O "$currentAccessoriesDir"/integrations/ubcp/"$1"
    fi
}


_build_pumpCompanion-fetch() {
    _start
    #mkdir -p "$shortTmp"
    local functionEntryPWD="$PWD"
    cd "$scriptAbsoluteFolder"


    export currentAccessoriesDir="$scriptAbsoluteFolder"/../"$objectName"-accessories
    [[ -e "$scriptAbsoluteFolder"/../"$objectName"-accessories/parts ]] && _messageFAIL && _stop 1
    #export currentAccessoriesDir="$shortTmp"
    
    #! type makensis && _if_cygwin && _at_userMSW_probeCmd_discoverResource-cygwinNative-ProgramFiles 'makensis' 'NSIS/bin' false
    _getMinimal-build_pumpCompanion


    #_getRelease-ubcp 'package_ubiquitous_bash-msw-rotten.7z'
    #_getRelease-ubcp 'package_ubcp-cygwinOnly.tar.xz'
    _getRelease-ubcp 'package_ubcp-core.7z'

    mkdir -p "$currentAccessoriesDir"/parts/ubcp/package_ubcp-core
    cd "$currentAccessoriesDir"/parts/ubcp/package_ubcp-core
    7za -y x "$currentAccessoriesDir"/integrations/ubcp/package_ubcp-core.7z
    cd "$functionEntryPWD"


    cd "$currentAccessoriesDir"/parts
    if [[ "$objectName" == "pumpCompanion" ]]
    then
        _gitBest clone --recursive git@github.com:mirage335-gizmos/"$objectName".git
    else
        _gitBest clone --recursive git@github.com:mirage335/"$objectName".git
    fi

    mkdir -p "$currentAccessoriesDir"/parts/"$objectName"
    cd "$currentAccessoriesDir"/parts/"$objectName"
    if [[ ! -e ./.git ]]
    then
        cp -a "$scriptAbsoluteFolder"/.git ./
    fi


    #git config gc.pruneExpire now
    #git config gc.reflogExpire now
    #git config gc.reflogExpireUnreachable now
    git reset --hard
    git submodule update
    git submodule update --force --recursive
    git gc
    #git gc --aggressive

    #git show-ref -s HEAD > $(git rev-parse --git-dir)/shallow
    #git reflog expire --expire-unreachable=now --all
    #git reflog expire --expire=0
    #git reflog expire --expire=now --all
    #git prune
    #git prune-packed

    cd "$currentAccessoriesDir"/parts/pumpCompanion/_lib/ubiquitous_bash/
    #git show-ref -s HEAD > $(git rev-parse --git-dir)/shallow
    #git reflog expire --expire-unreachable=now --all
    #git reflog expire --expire=0
    #git reflog expire --expire=now --all
    #git prune
    #git prune-packed

    cd "$currentAccessoriesDir"/parts/pumpCompanion/
    #git reflog expire --expire-unreachable=now --all
    #git reflog expire --expire=now --all
    #git reflog expire --expire=0
    #git prune
    #git prune-packed
    #git gc --prune=all
    #git gc --aggressive
    #git gc

    _github_removeActionsHTTPS ./.git


    cd "$functionEntryPWD"

    

    cd "$currentAccessoriesDir"/parts/pumpCompanion/_lib/ubiquitous_bash/
    ./compile.sh
    cd "$functionEntryPWD"



    cd "$currentAccessoriesDir"/parts/
   # _gitBest clone --depth 1 --recursive git@github.com:mirage335-gizmos/pumpCompanion_bundle.git
    cd "$functionEntryPWD"


    mkdir -p "$currentAccessoriesDir"/parts/pumpCompanion_bundle-adhoc/gnuradio/
    cd "$currentAccessoriesDir"/parts/pumpCompanion_bundle-adhoc/gnuradio/
    wget 'https://github.com/ryanvolz/radioconda/releases/download/2023.11.06/radioconda-2023.11.06-Windows-x86_64.exe'
    cd "$functionEntryPWD"


    cd "$functionEntryPWD"
    _stop
}



_build_pumpCompanion-build() {
    #_start
    mkdir -p "$shortTmp"
    local functionEntryPWD="$PWD"

    rm -f "$scriptAbsoluteFolder"/../pumpCompanion.exe 2> /dev/null

    export currentAccessoriesDir="$scriptAbsoluteFolder"/../"$objectName"-accessories


    #! type makensis && _if_cygwin && _at_userMSW_probeCmd_discoverResource-cygwinNative-ProgramFiles 'makensis' 'NSIS/bin' false
    _getMinimal-build_pumpCompanion
    

    unix2dos "$scriptAbsoluteFolder"/license-installer.txt

    cd "$scriptLib"/nsis
    makensis -V4 "$scriptLib"/nsis/pumpCompanion.nsi






    cd "$functionEntryPWD"
    _stop
}


