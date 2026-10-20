# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Performance-portable, length-agnostic SIMD with runtime dispatch"
HOMEPAGE="https://github.com/google/highway"
SRC_URI="https://api.github.com/repos/google/highway/tarball/refs/tags/1.4.0 -> highway-1.4.0-2607d3b.tar.gz"
LICENSE="NOASSERTION"
SLOT="0"
KEYWORDS="*"
IUSE="cpu_flags_arm_neon"

post_src_unpack() {
	mv google-highway-* ${S}
}


src_configure() {
	local mycmakeargs=(
	  -DHWY_CMAKE_ARM7=$(usex cpu_flags_arm_neon)
	  -DBUILD_TESTING=OFF
	  -DHWY_ENABLE_TESTS=OFF
	  -DHWY_WARNINGS_ARE_ERRORS=OFF
	)
	cmake_src_configure
}



# vim: filetype=ebuild
