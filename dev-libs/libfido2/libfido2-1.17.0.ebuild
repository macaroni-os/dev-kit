# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="A library for communicating with FIDO U2F and FIDO2 CTAP1/CTAP2 authenticators"
HOMEPAGE="https://developers.yubico.com/libfido2/"
SRC_URI="https://developers.yubico.com/libfido2/Releases/libfido2-1.17.0.tar.gz -> libfido2-1.17.0.tar.gz"
LICENSE="BSD-2"
SLOT="0"
KEYWORDS="*"
IUSE="examples"
BDEPEND="virtual/pkgconfig
	
"
RDEPEND="dev-libs/libcbor
	>=dev-libs/openssl-1.1.1:=
	sys-libs/zlib
	
"
DEPEND="${RDEPEND}
	examples? ( dev-libs/popt )
	
"
src_configure() {
		local mycmakeargs=(
				-DBUILD_EXAMPLES=$(usex examples)
				-DBUILD_MANUALS=OFF
				-DBUILD_TOOLS=ON
				-DENABLE_PCSC=OFF
				-DENABLE_NFC=OFF
		)

		cmake_src_configure
}


# vim: filetype=ebuild
