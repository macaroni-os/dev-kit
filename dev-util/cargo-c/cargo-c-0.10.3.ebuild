# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/ee/e4/04/eee404d48c3ecd5d71249d4fc3ffc46786e761ea727945c00d2da82bd2b83ddd8409660f93b07c3f0d45508843d05fd4238fab1210faa6b98e152bee3dc9b4e1 -> cargo-c-0.10.3-funtoo-crates-bundle-5b8340f45247281eb4f2c7eb5da8fed8cbd1ea7b28819f892c02c8e2d73ebcffaa9637d60d2719e73ee429f74a84f81e6aa7d3ff4600ef5dc9dc21a9a8cdcb97.tar.gz"

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