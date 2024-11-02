# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/b9/33/63/b933634009300fe1a3ac5fa69279ed6973810a1a16377f34f9f9ff22218fcc3faccb6dff9a5191b1f470414eb4281c68b78e7eabfb6246afc81f9a4d0aad1733 -> cargo-c-0.10.5-funtoo-crates-bundle-be32f9985e53bba996ea39befac7eb2dc798861494ead0eba2ccd435bd25f70f4c10fbe1d9f7bf730e18a272667c48f97e820ae99bf211451e05b058b51f632c.tar.gz"

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