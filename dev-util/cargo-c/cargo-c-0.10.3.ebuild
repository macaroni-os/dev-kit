# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/f3/58/73/f35873f28c4714c17813d474b78c1ee2a3a5b4081d419b69c0cde48c119a380dffaa8f5abeaa3e4cc699772031c7cb143bfc9a3ed40bd38df1a37cb24ecdc7bd -> cargo-c-0.10.3-funtoo-crates-bundle-019803a604ee4ac2b8a9020e96cf00870c9f531bc312e328da3ea4c49fdba2c793d8437a36996c0700c9560e4b479b9db7b6ffb7b67587336d94a0ff9526ee2d.tar.gz"

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