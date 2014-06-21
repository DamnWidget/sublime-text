# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
inherit eutils gnome2-utils

# get the major version from PV
MV="${PV:0:1}"

MY_PN="sublime_text_${MV}"
MY_P="Sublime%20Text"
S="${WORKDIR}/Sublime Text ${MV}"

DESCRIPTION="Sophisticated text editor for code, markup and prose"
HOMEPAGE="http://www.sublimetext.com"

BASE_URI="http://c758482.r82.cf2.rackcdn.com"
SRC_URI="amd64? ( ${BASE_URI}/${MY_P}%20${PV}%20x64.tar.bz2 )
	x86? ( ${BASE_URI}/${MY_P}%20${PV}.tar.bz2 )"
LICENSE="Sublime"
SLOT="${MV}"
KEYWORDS="~amd64 ~x86"
IUSE="multislot dbus"
RESTRICT="bindist mirror strip"

DEPEND=">=media-libs/libpng-1.2.46
	>=x11-libs/gtk+-2.24.8-r1:2
	multislot? ( app-admin/eselect-sublime )
	dbus? ( sys-apps/dbus )"
RDEPEND="${DEPEND}"

QA_PREBUILT="*"

pkg_nofetch() {
	eerror "Sublime Text official site seems to be unresponsive."
}

src_install() {
	insinto /opt/${MY_PN}
	into /opt/${MY_PN}
	exeinto /opt/${MY_PN}
	doins -r "Icon"
	doins -r "lib"
	doins -r "Pristine Packages"
	doins "sublime_plugin.py"
	doins "PackageSetup.py"
	doexe "sublime_text"
	dosym "/opt/${MY_PN}/sublime_text" /usr/bin/subl${MV}

	local size
	for size in 16 32 48 128 256 ; do
		insinto /usr/share/icons/hicolor/${size}x${size}/apps
		newins "Icon/${size}x${size}/sublime_text.png" sublime_text.png
	done

	make_desktop_entry "subl${MV} %F" "Sublime Text ${MV}" sublime_text "Utility;TextEditor" "StartupNotify=true"
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
	if use multislot; then
		eselect_sublime_update
	else
		einfo "using major version ${MV} as default"
		dosym /usr/bin/subl${MV} /usr/bin/subl
	fi
}

pkg_postrm() {
	gnome2_icon_cache_update
}

eselect_sublime_update() {
	einfo
	elog "Updating Sublime Text to the latest installed version"
	elog "you can select the version you want to use just using"
	elog
	elog "eselect sublime set sublime_text_2"
	einfo
	eselect sublime set sublime_text_${MV} --use-old
}
