#!/bin/bash
#
# build script for setups on Linux (32+64 bit; DEB+RPM) and Windows
# 
# This script uses the following external tools, which have to be installed
# separately:
#
#  On Linux:
#      epm  - a meta-packaging tool (http://www.easysw.com/epm/)
#      rpm  - the Red Hat package manager
#      dpkg - the Debian package manager
#      fakeroot - needed for building deb packages as ordinary user
#
#  On Windows:
#      ISCC   - the Inno Setup Compiler (http://www.jrsoftware.org/isinfo.php)
#      cygwin - Cygwin tools (http://www.cygwin.com/)

########################################################################
#   Configuration:  set some variables 
########################################################################
# the MuPAD documentation developer toolkit directory
export MUPAD_DDKDIR=`pwd`/../../../DOC

# make sure that mupkern, mmg, and sysinfo are in your path
export PATH="`pwd`/../../../DEV/share/bin:$PATH"

# variables used in the package configuration file
export VERSION_MAJOR=5
export VERSION_MINOR=0
export VERSION_PATCH=0

export VERSION=$VERSION_MAJOR.$VERSION_MINOR.$VERSION_PATCH

# a minor release number
export RELEASE=1

#  name showing up in Linux setups;  real person needed
export PACKAGER="Ralf Hillebrand <tonner@sciface.com>"

export LICENSE=`pwd`/../../../DEV/QT/INSTALL/SRC/MuPAD/License.txt

# current year, for copyright notice
export YEAR=2007



########################################################################
#    nothing to be configuerd below this point
########################################################################

if [ "$OSTYPE" = "cygwin" ] ; then
    # make sure that mupkern, mmg, and sysinfo are in your path
    export PATH="`pwd`/../../../DEV/QT/INSTALL/BUILDDIR/MuPAD/win32/bin:$PATH"
    export SYSNAME=win32
    ARCH=win32
else
    export SYSNAME=`sysinfo`
    if [ "$SYSNAME" = "linux64" ] ; then 
        ARCH=amd64
    else
        ARCH=i386
    fi
fi
export PACKNAME=`basename \`pwd\``

# package directory in the build tree
PACKDIR=TMP_${SYSNAME}/packages/${PACKNAME}

#  build modules
bash make.sh

if [ "$SYSNAME" = "win32" ] ; then
    echo "The documentation and the Tar-lib can't be build under Windows!"
    echo
    echo "Make sure that the documentation and the lib.t?? files were built"
    echo "before on Linux."
else
    #  build tar library
    bash make.sh tarlib

    # build documentation
    bash makeDoc.sh
fi

# make separate directory tree of files to be installed
mkdir -p ${PACKDIR}/modules/${SYSNAME}

# copy tar library, the documentation and the readme in the package source
cp -r lib.t?? doc readme.txt ${PACKDIR}/
cp -r modules/$SYSNAME  ${PACKDIR}/modules/


if [ "$SYSNAME" = "win32" ] ; then
    #  write version file for ISS
    echo "; ------------------------------" >  version
    echo "; Do not edit this file!"         >> version
    echo "; It is generated by mkSetup.sh"  >> version
    echo "; ------------------------------" >> version
    echo "#define VERSION \"${VERSION_MAJOR}.${VERSION_MINOR}\"" >> version
    echo "#define MINORVERSION \".${VERSION_PATCH}\""        >> version
    echo "#define PATCHLEVEL \"$RELEASE\"" >> version
    echo "#define YEAR \"$YEAR\"" >> version

    # Build setups with ISS
    ISCC mupad${PACKNAME}.iss
    rm version
else # Linux
    # make file list for epm
    mkepmlist -g root -u root --prefix /opt/MuPAD-${VERSION}/ TMP_${SYSNAME}/ > mupad.${SYSNAME}.filelist 

    # build RPM
    epm -a ${ARCH}  -nsm -f rpm --output-dir setups mupad${PACKNAME}

    # build DEB 
    fakeroot epm -a ${ARCH}  -nsm -f deb --output-dir setups mupad${PACKNAME}
fi

# remove temporary stuff
rm -rf mupad.${SYSNAME}.filelist TMP_$SYSNAME/
