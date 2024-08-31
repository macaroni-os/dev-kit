# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/50/3d/d1/503dd1b66e99167d2cd76cc7f1e336c02821b32216ac177631a979001062fc69a75db241a08d61bcdd2d6398613314d3213659ca12c3de1a0b1cb3c258ff57e0 -> cargo-c-0.10.3-funtoo-crates-bundle-66fe49bb001bd987eb58f360e23244e489ea4695e1ebb2c3a7c0b347c8bdec84d515fd8590bdc2455c7dcb810a4c854dd233e6ed36adc983139ea3aeddd1bd68.tar.gz"

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