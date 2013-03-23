# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
inherit eutils

PACKAGE_INSTALL_NAME="sublime_text_3"
PACKAGE_NAME="sublime_text_3_build"
PACKAGE="${PACKAGE_NAME}_${PV}"
S="${WORKDIR}/sublime_text_3"

DESCRIPTION="Sublime Text is a sophisticated text editor for code, markup and prose. You'll love the slick user interface, extraordinary features and amazing performance."
HOMEPAGE="http://www.sublimetext.com"

BASE_URI="http://c758482.r82.cf2.rackcdn.com"
SRC_URI="amd64? ( ${BASE_URI}/${PACKAGE}_x64.tar.bz2 )
	x86? ( ${BASE_URI}/${PACKAGE}_x32.tar.bz2 )"

LICENSE="Sublime"
SLOT="3"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="=app-admin/eselect-sublime-1.0
	>=media-libs/libpng-1.2.46
	>=x11-libs/gtk+-2.24.8-r1:2"
RDEPEND="${DEPEND}"

src_install() {
	einfo "You are going to install Sublime Text 2 in your system"
	einfo "Sublime Text 3 is *NOT* Free Software you must accept"
	einfo "its propietary license in an implicit way"
	einfo "If you're unsure about this just hit Ctrl+C now"

	insinto /opt/${PACKAGE_INSTALL_NAME}
	into /opt/${PACKAGE_INSTALL_NAME}
	exeinto /opt/${PACKAGE_INSTALL_NAME}
	doins -r "Icon"	
	doins -r "Packages"
	doins "python3.3.zip"
	doins "sublime.py"
	doins "sublime_plugin.py"	
	doexe "sublime_text"
	doexe "plugin_host"	
	dosym "/opt/${PACKAGE_INSTALL_NAME}/sublime_text" /usr/bin/subl3
	make_desktop_entry "subl3" "Sublime Text 3" "accesories-text-editor" "Application;TextEditor"
}

pkg_postinst() {
	eselect_sublime_update
}

eselect_sublime_update() {
	elog "Updating Sublime Text to the latest installed version"
	elog "you can select the version you want to use just using"
	elog
	elog "eselect sublime update --sublimeX"
	elog
	elog "where X is the Sublime Text version"
	eselect sublime set --use-old sublime_text_${PV%%.*}	
}
