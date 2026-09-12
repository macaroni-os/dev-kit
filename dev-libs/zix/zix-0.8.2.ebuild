# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit meson

DESCRIPTION="Lightweight C library of portability wrappers and data structures"
HOMEPAGE="https://gitlab.com/drobilla/zix"
SRC_URI="https://download.drobilla.net/zix-0.8.2.tar.xz -> zix-0.8.2.tar.xz"
LICENSE="ISC"
SLOT="0"
KEYWORDS="*"
BDEPEND="virtual/pkgconfig
	
"
src_configure() {
	local emesonargs=(
		-Ddocs=disabled
		-Dhtml=disabled
		-Dsinglehtml=disabled
		-Dlint=false
		-Dbenchmarks=disabled
		-Dchecks=enabled
		-Dposix=enabled
		-Dthreads=enabled
		-Dtests=disabled
		-Dtests_cpp=disabled
	)

	meson_src_configure
}

src_install() {
	local DOCS=( NEWS README.md )
	meson_src_install
}


# vim: filetype=ebuild
