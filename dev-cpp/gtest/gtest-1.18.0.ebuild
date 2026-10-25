# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Google C++ Testing Framework"
HOMEPAGE="https://github.com/google/googletest"
SRC_URI="https://api.github.com/repos/google/googletest/tarball/v1.18.0 -> gtest-1.18.0-063de7e.tar.gz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="*"
IUSE="doc examples"
RDEPEND="!dev-cpp/gmock
	
"

post_src_unpack() {
	mv google-googletest-* ${S}
}


src_configure() {
	local mycmakeargs=(
	  -DBUILD_GMOCK=ON
	  -DINSTALL_GTEST=ON
	   # never build the bundled test suites
	  -Dgmock_build_tests=OFF
	  -Dgtest_build_tests=OFF
	)
	 cmake_src_configure
}

src_install() {
	cmake_src_install
	 einstalldocs
	 if use doc; then
	  docinto googletest
	  dodoc -r googletest/docs/.
	  docinto googlemock
	  dodoc -r googlemock/docs/.
	fi
	 if use examples; then
	  docinto examples
	  dodoc googletest/samples/*.{cc,h}
	fi
}



# vim: filetype=ebuild
