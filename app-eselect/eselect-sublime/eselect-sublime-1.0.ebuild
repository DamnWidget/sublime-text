# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="Utility to change the version of Sublime Text being used"
HOMEPAGE="https://github.com/DamnWidget/eselect-sublime"
SRC_URI="${HOMEPAGE}/archive/1.0.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=app-admin/eselect-1.2.4"

src_install() {
	insinto "/usr/share/eselect/modules"
	doins sublime.eselect || die
}
