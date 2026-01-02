# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="A modern, C++-native, test framework for unit-tests, TDD and BDD - using C++14, C++17 and later (C++11 support is in v2.x branch, and C++03 on the Catch1.x branch)"
HOMEPAGE="https://discord.gg/4CWS9zD"
SRC_URI="https://api.github.com/repos/catchorg/Catch2/tarball/v3.12.0 -> catch-3.12.0-88abf9b.tar.gz"
LICENSE="BSL-1.0"
SLOT="0"
KEYWORDS="*"

post_src_unpack() {
	mv catchorg-Catch2-* ${S}
}


src_configure() {
	local mycmakeargs=(
	  -DCATCH_DEVELOPMENT_BUILD=ON
	  -DCATCH_ENABLE_WERROR=OFF
	  -DCATCH_BUILD_TESTING=OFF
	)
	cmake_src_configure
}



# vim: filetype=ebuild
