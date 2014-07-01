#!/sbin/sh

#     _             _     _ ____            _     _
#    / \   _ __ ___| |__ (_)  _ \ _ __ ___ (_) __| |
#   / _ \ | '__/ __| '_ \| | | | | '__/ _ \| |/ _` |
#  / ___ \| | | (__| | | | | |_| | | | (_) | | (_| |
# /_/   \_\_|  \___|_| |_|_|____/|_|  \___/|_|\__,_|
#
# Copyright 2014 Łukasz "JustArchi" Domeradzki
# Contact: JustArchi@JustArchi.net
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e

BCM="$1"
case "$BCM" in
	"stock") exit 0 ;;
	"archidetect")
			if [ -f "/data/.cid.info" ]; then
				BCM="$(cat "/data/.cid.info")"
			elif [ -f "/tmp/archidroid/bcm4334" ]; then
				BCM="$(cat "/tmp/archidroid/bcm4334")"
			else
				exit 0
			fi
			;;
esac

if [ ! -z "$BCM" -a -f "/system/bin/bcm4334.hcd" -a -f "/system/bin/bcm4334_$BCM.hcd" ]; then
	cp -p "/system/bin/bcm4334_$BCM.hcd" "/system/bin/bcm4334.hcd"
else
	exit 1
fi

sync
exit 0
