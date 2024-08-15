# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/c4/dd/a5/c4dda548b55aff9d37106d073928807f4d33f63dd122c9c9c07980a2357d47d4deb265dc6dd6dc6ea04d372c7823fd821eb4d17c5922f7c403d7a4a99607a2d7 -> cargo-c-0.10.3-funtoo-crates-bundle-2f8c53ef831ffe2559f8652c7f030236fdb286f7a2a350e847fd46a4e7916fde8b5edadc60477a89c3f8ad8d2250b190dce4cfe182c87b4b233ca35cd3eeecb1.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND="sys-libs/zlib
	dev-libs/openssl:0=
	dev-vcs/git
	net-misc/curl[ssl]
"
BDEPEND="virtual/rust"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/lu-zero-cargo-c-* ${S} || die
}