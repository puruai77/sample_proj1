#!/bin/sh

# Copyright (C) 2011, 2012, 2014 Me and My Shadow
#
# This file is part of Me and My Shadow.
#
# Me and My Shadow is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Me and My Shadow is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Me and My Shadow.  If not, see <http://www.gnu.org/licenses/>.

#Detect the architecture of the system.
ARCH=$(uname -m)
case ${ARCH} in
i486|i586|i686|x86)
    ARCH="32"
    ;;
x86_64|amd64)
    ARCH="64"
    ;;
*)
    echo "ERROR: Unknown architecture!"
    exit 1
    ;;
esac

#Detect the distro.
DISTRO="debian"
if [ -f /etc/SuSE-release ] ; then
	DISTRO="openSUSE"
elif [ -f /etc/debian-release ] ; then
	DISTRO="debian"
elif [ -f /etc/lsb-release ] ; then
	DISTRO="debian"
else
	echo "WARNING: Unsupported distro."
fi

if [ -x ./bin/meandmyshadow-$DISTRO-$ARCH ]
then
    exec ./bin/meandmyshadow-$DISTRO-$ARCH "$@"
else
    echo "ERROR: Unable to find binary!"
    echo "./bin/meandmyshadow-$DISTRO-$ARCH (No such file)"
    exit 1
fi

