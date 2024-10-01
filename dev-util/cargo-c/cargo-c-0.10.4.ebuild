# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/42/9a/ff/429aff3bb976f90a1b8f484dd224d9a3ba8933730298262f7e9ccc4840afea9e515ec5f8e862c836224d160ee3d1c8c954277499d4b552e62a7d54addd14f4fa -> cargo-c-0.10.4-funtoo-crates-bundle-7b6245be56be8104857c14c01879110f75d7dd789123d345cb9fc26c9d71b9c9dd899157597f89f203841f1d8c7ea0f44fea50814ecd1031dbb2fd3fdde4eda2.tar.gz"

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