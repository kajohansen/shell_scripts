#!/bin/sh

LATEST_SAMBA="samba-4.3.1"
LATEST_NETATALK="netatalk-3.1.7"

mkdir DownloadedSoftware

curl -L http://prdownloads.sourceforge.net/netatalk/${LATEST_NETATALK}.tar.gz?download > netatalk-3.1.7.tar.gz
tar xfvz netatalk-3.1.7.tar.gz
mv netatalk-3.1.7 DownloadedSoftware
rm netatalk-3.1.7.tar.gz

curl -O https://download.samba.org/pub/samba/stable/${LATEST_SAMBA}.tar.gz
tar xzvf samba-4.3.1.tar.gz
mv samba-4.3.1 DownloadedSoftware
rm samba-4.3.1.tar.gz

echo "\n\n\t----Done! listing downloaded software:"
ls -l DownloadedSoftware

