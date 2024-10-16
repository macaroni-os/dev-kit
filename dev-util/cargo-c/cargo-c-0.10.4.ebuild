# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/1f/06/df/1f06dfc4556a6b05233aac816363d08dacb2df29f3e0e3218c31cd2071094b33e2c99ef6bf91bddbd2c8c162f32d331432b8688a6eeed36c9db789f6349a3095 -> cargo-c-0.10.4-funtoo-crates-bundle-f78790567b8d05438594a8c90f2b27087698eff63b0fa831b72541532c75a887d9f88d96deb41b96de3300672676b4774bcb6f613c49f492e6206db8c0572ca2.tar.gz"

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