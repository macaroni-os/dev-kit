# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/4e/c1/70/4ec170beab0c6f1ef457a3e3944d99594ddadd2b8ed7bd7cd48194fd65f5c4d014a614041bfa2e8bd61a2cdf06e9a0d269ebdf1d652aa128b8da0516f32a04d0 -> cargo-c-0.10.3-funtoo-crates-bundle-9be1965c0103b803957902ad1f135ec2288ec21ceaa437ebfcd2c85c47e1e4f6d2c2c8bffd3cef5637c856378b4263bb7d514dd89ed8fa83d69fddf6a5e0b76c.tar.gz"

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