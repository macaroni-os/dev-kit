# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit meson

DESCRIPTION="Lightweight C library for working with RDF data"
HOMEPAGE="https://drobilla.net/software/serd"
SRC_URI="https://download.drobilla.net/serd-0.32.10.tar.xz -> serd-0.32.10.tar.xz"
LICENSE="ISC"
SLOT="0"
KEYWORDS="*"
IUSE="+tools"
BDEPEND="virtual/pkgconfig
	
"
src_configure() {
	local emesonargs=(
		-Ddocs=disabled
		-Dhtml=disabled
		-Dman_html=disabled
		-Dsinglehtml=disabled
		-Dlint=false
		-Dman=enabled
		-Dstatic=false
		-Dtests=disabled
		$(meson_feature tools)
	)

	meson_src_configure
}

src_install() {
	local DOCS=( AUTHORS NEWS README.md )
	meson_src_install
}


# vim: filetype=ebuild
