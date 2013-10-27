# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils

MY_PN="sublime_text_3"
MY_P="sublime_text_3_build"
S="${WORKDIR}/sublime_text_3"

DESCRIPTION="Sophisticated text editor for code, markup and prose."
HOMEPAGE="http://www.sublimetext.com"

BASE_URI="http://c758482.r82.cf2.rackcdn.com"
SRC_URI="amd64? ( ${BASE_URI}/${MY_P}_${PV}_x64.tar.bz2 )
	x86? ( ${BASE_URI}/${MY_P}_${PV}_x32.tar.bz2 )"

LICENSE="Sublime"
SLOT="3"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="bindist mirror strip"

DEPEND="=app-admin/eselect-sublime-1.0
	>=media-libs/libpng-1.2.46
	>=x11-libs/gtk+-2.24.8-r1:2"
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
	doins -r "Packages"
	doins "python3.3.zip"
	doins "sublime.py"
	doins "sublime_plugin.py"
	doexe "sublime_text"
	doexe "plugin_host"
	dosym "/opt/${MY_PN}/sublime_text" /usr/bin/subl3

	local size
	for size in 16 32 48 128 256 ; do
		insinto /usr/share/icons/hicolor/${size}x${size}/apps
		newins "Icon/${size}x${size}/sublime-text.png" sublime-text.png
	done

	make_desktop_entry subl3 "Sublime Text 3" sublime-text "Utility;TextEditor"
}

pkg_postinst() {
	eselect_sublime_update
}

eselect_sublime_update() {
	einfo
	elog "Updating Sublime Text to the latest installed version"
	elog "you can select the version you want to use just using"
	elog
	elog "eselect sublime set sublime_text_3"
	einfo
	eselect sublime set sublime_text_3 --use-old
}
