# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://distfiles.macaronios.org/75/cf/93/75cf9348ae5e49a74d034ed727a3656057b3a0408baa303245b73cc0c2f3135974e42f1a4d947aa3dfc5c0b81bbb991212cce9760d04ae6ce453e103c0d2982e -> cargo-c-0.10.7-funtoo-crates-bundle-b24611a25b9a38146c34a755251288391ac7be681647d812637aa34fa0a8fca253a2d18656dd7ace5f25685ed78c9e28bb5a9b287abafb29d6a0cae0873aa692.tar.gz"

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