# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Just a command runner"
HOMEPAGE="https://github.com/casey/just"
SRC_URI="https://github.com/casey/just/tarball/a5a7cca90770248a523fa6656b16f38d3ccf007e -> just-1.33.0-a5a7cca.tar.gz
https://distfiles.macaronios.org/a0/f1/9d/a0f19de134ac243bec60ae7577cbf509aa23a787efa7f94e500f31c16930438be49995114b4c5050d58ba8dcbf5f421277b8ccc25a0a45e106c0f30985d59761 -> just-1.33.0-funtoo-crates-bundle-dee6b321c24b9a6cd0d753906c42c1e5decffb2adccebd96db49b10065d3def879b34cbb4f1d119e86791986884e286a03d0d3c213e058e82baa8cd28dee7cd3.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND=""
BDEPEND="virtual/rust"

QA_FLAGS_IGNORED="/usr/bin/just"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/casey-just-* ${S} || die
}

src_install() {
	cargo_src_install

	mkdir ${S}/man
	${S}/target/release/just --man > ${S}/man/just.1
	doman man/just.1

	dodoc README.md
	einstalldocs
}