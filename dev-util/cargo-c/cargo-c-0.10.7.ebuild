# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://distfiles.macaronios.org/96/90/ff/9690ff289947e8358c56138538c128c0609e675cc66ecc3fc80b859c7cf91443348ff3a0b8602bb9d39a6832a6fd16c02a64ed2adfd3a28089b7c4d9363595ae -> cargo-c-0.10.7-funtoo-crates-bundle-d9e3e5025c780f78d6c22a70ab93f132797f578af52f05321eae381b7f194a2038c631857cb6a72f0d1d71cfed50532d02e61fcfa30df220c06650d6561b4c94.tar.gz"

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