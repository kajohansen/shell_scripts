#!/bin/sh

# Clean all log files
sudo mv  /private/var/log/*/*.asl ~/.Trash             
sudo mv  /private/var/log/*.gz ~/.Trash
sudo mv  /private/var/log/*.bz2 ~/.Trash
sudo mv  /private/var/log/*/*.gz ~/.Trash
sudo mv  /private/var/log/module/*/*.gz ~/.Trash
sudo mv  /private/var/log/*.peruser.* ~/.Trash
sudo mv  /private/var/log/opendirectoryd.log.* ~/.Trash
sudo mv  /private/var/log/pffirewall.log.* ~/.Trash
sudo mv  /private/var/log/asl/AUX.* ~/.Trash
sudo mv  /Library/Logs/DiagnosticReports/*.diag ~/.Trash
sudo mv  /Library/Logs/DiagnosticReports/*.awd ~/.Trash
sudo mv /Library/Logs/DiagnosticReports/*.hang ~/.Trash
sudo mv /Library/Logs/DiagnosticReports/*.crash ~/.Trash

open ~/.Trash
