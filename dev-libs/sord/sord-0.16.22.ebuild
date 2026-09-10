# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit meson

DESCRIPTION="Lightweight C library for storing RDF statements in memory"
HOMEPAGE="https://drobilla.net/software/sord"
SRC_URI="https://download.drobilla.net/sord-0.16.22.tar.xz -> sord-0.16.22.tar.xz"
LICENSE="ISC"
SLOT="0"
KEYWORDS="*"
IUSE="+tools"
BDEPEND="virtual/pkgconfig
	
"
RDEPEND=">=dev-libs/serd-0.30.10
	>=dev-libs/zix-0.4.0
	tools? ( dev-libs/libpcre2 )
	
"
DEPEND="${RDEPEND}
"
src_configure() {
	local emesonargs=(
		-Ddocs=disabled
		-Dlint=false
		-Dman=enabled
		-Dtests=disabled
		$(meson_feature tools)
		-Dbindings_cpp=disabled
	)

	meson_src_configure
}

src_install() {
	local DOCS=( AUTHORS NEWS README.md )
	meson_src_install
}


# vim: filetype=ebuild
