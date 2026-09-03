# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="C11 / gnu11 utilities C library by Shlomi Fish / Rindolf"
HOMEPAGE="https://github.com/shlomif/rinutils"
SRC_URI="https://github.com/shlomif/rinutils/releases/download/0.10.3/rinutils-0.10.3.tar.xz -> rinutils-0.10.3-1162c3b.tar.xz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
src_prepare() {
	cmake_src_prepare
	sed -i -e 's|^CMAKE_MINIMUM_REQUIRED(VERSION.*|CMAKE_MINIMUM_REQUIRED(VERSION 3.10..3.31)|g' \
		CMakeLists.txt
}
src_configure() {
	local mycmakeargs=(
		-DDISABLE_APPLYING_RPATH=OFF
		-DWITH_TEST_SUITE=OFF
	)
	cmake_src_configure
}


# vim: filetype=ebuild
