# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit meson

DESCRIPTION="GNU FriBidi"
HOMEPAGE="https://github.com/fribidi/fribidi"
SRC_URI="https://api.github.com/repos/fribidi/fribidi/tarball/v1.0.17 -> fribidi-1.0.17-b93119f.tar.gz"
LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="*"
IUSE="doc"
BDEPEND="virtual/pkgconfig
	
"

post_src_unpack() {
	mv fribidi-fribidi-* ${S}
}


src_configure() {
	local emesonargs=(
	  -Ddeprecated=true
	  -Dbin=true
	  -Dtests=false
	  $(meson_use doc docs)
	)
	meson_src_configure
}



# vim: filetype=ebuild
