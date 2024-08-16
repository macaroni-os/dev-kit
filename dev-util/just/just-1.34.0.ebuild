# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Just a command runner"
HOMEPAGE="https://github.com/casey/just"
SRC_URI="https://github.com/casey/just/tarball/0802dba610d351685b04154ffd559a3462e59adb -> just-1.34.0-0802dba.tar.gz
https://distfiles.macaronios.org/d9/81/1e/d9811e4d7480a769c51a30ed7e13150e2d4cefcdde28d2ecd8da9f5bc801d3a00d7288df49c54c6af38d6b4afa2b4870f045e195a63ddfe7d3a85e54da860638 -> just-1.34.0-funtoo-crates-bundle-544c317ed2ae9c3ad5fb206293a35be54450272d9051532237d30590685e16f0b28752bebd1a4c330ac5b715aba228e88bac8e60ffef63f5c5e2c63cba1c3767.tar.gz"

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