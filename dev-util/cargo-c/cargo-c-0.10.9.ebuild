# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/578b4ed8a8baa9faa42a072ca40b7267b125fc15 -> cargo-c-0.10.9-578b4ed.tar.gz
https://distfiles.macaronios.org/b6/4e/41/b64e4113aa6d6a06dba3f965f51a047cd276ebd64d207e578fe1f2881ba9fc3678ce7ffa45282a8ee259f77a5a36fc2f679fad0207fb0c98f13b4800126b6806 -> cargo-c-0.10.9-funtoo-crates-bundle-b3fbd2cf83e77d4a3c396a46de8c66b058e24e8abcb2e400aa36f39114a5a99130ff8bf89c4ef248f906a2ddd361828a996b5d5c71a7347335821c7c44b66787.tar.gz"

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