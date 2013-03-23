#!/bin/sh

# This program is free software you can redistribute it under
# the terms of the GPL v3 or later license
# 
# Copyright (c) 2013 Oscar Campos - <damnwidget@gmail.com>

EIX=/usr/bin/eix
LAYMAN=/usr/bin/layman
[ -e /etc/make.conf ] && MAKE_CONF=/etc/make.conf || {
	[ -e /etc/portage/make.conf ] && MAKE_CONF=/etc/portage/make.conf || {
		echo "Couln'd find make.conf neither in /etc or /ect/portage. aborting..."
		exit
	}
}

### functions ###

install_layman() {
	emerge layman && {
		echo "
		# LAYMAN OVERLAYS
		source /var/lib/layman/make.conf" >> $MAKE_CONF
	}	
}

### script ###

[ x$(whoami) == "xroot" ] || {
	echo "You must be root to run this script. Try with sudo"
	exit
}

# check for layman
[ -x $LAYMAN ] || {
	echo -n "Layman is not installed on the system. Installing layman..."	
	install_layman
}

echo "Retrieving overlay definition file..."
hash wget >/dev/null && wget --no-check-certificate https://raw.github.com/DamnWidget/sublime-text/master/sublime-text.xml -O /etc/layman/overlays/sublime-text.xml || {
	echo "wget is not installed or there is some problem with the donwload (do you have internet connection?)"
	exit
}

echo "Installing Sublime Text repository to layman local overlays..."
$LAYMAN -a sublime-text

[ -x $EIX ] && {
	echo "Updating emerge and eix cache..."
	eix-sync 
}

echo 
echo "Installation complete, you can now install sublime-text using: "
echo "\temerge app-editors/sublimt-text"
echo 
