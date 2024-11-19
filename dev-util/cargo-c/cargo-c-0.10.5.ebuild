# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/91/f4/0d/91f40d95e5d72cbf341c74eab2b3b78f8d4520963a8cda052c7c2f5b61aeceebd56711d74825497fd952f354c980a8c515c164e448df001c3528b44f4bb7c3df -> cargo-c-0.10.5-funtoo-crates-bundle-9b1d6c879a99aaeb1c5ac5ad8bb5fe8c14c11747c30fcea0981c77f8eac96ebae882ab1dbca76a30f710df788e700b006b9affaef4a37e8fe6457d8fd9fd2685.tar.gz"

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