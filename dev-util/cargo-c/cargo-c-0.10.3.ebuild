# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/26/bb/52/26bb52dfa6784bcd26ba9bfcfd12b89d1d45d376b6a2e925035fdfb91cda39a56520730d38eef6cec3c2c25e6ec9593b4c34bbccb3562e3167a3e923a287f898 -> cargo-c-0.10.3-funtoo-crates-bundle-13926f67dfcd3e6f9ba35ce0a70f2086126ff46a6e6f1590b59c7de8f9393a9c3a78a1dd6118cbb065d4685bdadef23add456f90d7eda1c6d958ce12e93f63bd.tar.gz"

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