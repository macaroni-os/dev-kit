# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Library for parsing and generating CBOR, the general-purpose data interchange format"
HOMEPAGE="https://github.com/PJK/libcbor"
SRC_URI="https://api.github.com/repos/PJK/libcbor/tarball/v0.14.0 -> libcbor-0.14.0-6730c20.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

post_src_unpack() {
	mv PJK-libcbor-* ${S}
}


src_configure() {
	  local mycmakeargs=(
	      -DENABLE_EXAMPLES=OFF
	      -DENABLE_TESTS=OFF
	  )
	   cmake_src_configure
}



# vim: filetype=ebuild
