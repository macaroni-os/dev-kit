# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/53/d3/85/53d3853af67ec6626624aed1effd0ce112c3c787920c26dda31735ee0fbab1d27aa76c926f9853cc74996e20a3be18a5815c1cecb748362a380fb0a7468e9fd7 -> cargo-c-0.10.5-funtoo-crates-bundle-a6d503fe98877f3e33075640f422bb22470c2af0e851c0f830150511bc6ef325ec99b13bfd883e891c286da8d2e88c93a1ff98a828e622b24fb9d5379137bbae.tar.gz"

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