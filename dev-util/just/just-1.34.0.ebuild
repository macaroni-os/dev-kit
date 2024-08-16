# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Just a command runner"
HOMEPAGE="https://github.com/casey/just"
SRC_URI="https://github.com/casey/just/tarball/0802dba610d351685b04154ffd559a3462e59adb -> just-1.34.0-0802dba.tar.gz
https://distfiles.macaronios.org/f5/ea/54/f5ea541297e833601b968a9c7344eda4c63cc1e55cd7c6266f6e48b81810ef632a25f6f8261ac4682dd7a1e558655bf71327341452693e45ba9e211bcf610d05 -> just-1.34.0-funtoo-crates-bundle-544c317ed2ae9c3ad5fb206293a35be54450272d9051532237d30590685e16f0b28752bebd1a4c330ac5b715aba228e88bac8e60ffef63f5c5e2c63cba1c3767.tar.gz"

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