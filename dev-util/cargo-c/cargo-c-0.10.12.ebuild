# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8c5b7af3d6edb6d99f7bffcc94adf550cfee65b3 -> cargo-c-0.10.12-8c5b7af.tar.gz
https://distfiles.macaronios.org/86/62/a9/8662a9e9558f215c6927c29e808f064eacf17739aeaf1885bff52df26da89ef882186b7343d03b57ff2b1cfba15ff415f97d62aa7f5a9aba974e414212f52734 -> cargo-c-0.10.12-funtoo-crates-bundle-3065cb4c031ece8021cca4901cc90b2ea6c58c24ac29fd6fdd80c3589d5d18cc8c33a9852121b5d9355e4c38eba397fb70b2da8115ecc7038aa6c0a2de0c0d09.tar.gz"

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