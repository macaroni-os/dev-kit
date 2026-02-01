# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
DOCS=( AUTHORS CHANGELOG.md README.md )
inherit cmake

DESCRIPTION="An elegant unit testing framework for C with support for mock objects"
HOMEPAGE="https://cmocka.org/"
SRC_URI="https://cmocka.org/files/2.0/cmocka-2.0.2.tar.xz -> cmocka-2.0.2.tar.xz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"
IUSE="doc examples static-libs test"
BDEPEND="doc? ( app-doc/doxygen[dot] )
	
"
src_configure() {
	local mycmakeargs=(
	  -DWITH_EXAMPLES=$(usex examples)
	  -DWITH_STATIC_LIB=$(usex static-libs)
	  -DWITH_TESTING=$(usex test)
	  $(cmake-utils_use_find_package doc Doxygen \
	    || echo -DCMAKE_DISABLE_FIND_PACKAGE_Doxygen=ON)
	)
	cmake_src_configure
}
src_compile() {
	cmake-utils_src_compile
	use doc && cmake_src_compile docs
}
src_install() {
	if use doc; then
	  local HTML_DOCS=( "${BUILD_DIR}"/doc/html/. )
	fi
	cmake_src_install
}


# vim: filetype=ebuild
