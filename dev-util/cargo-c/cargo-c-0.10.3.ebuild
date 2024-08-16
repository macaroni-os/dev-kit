# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/b4/86/06/b48606226515299f679651e497b3477e5e60a39e99e335bd0176deab9b278f8d040778e6425a128785f097950fe1f43c8efcfd171496a2fb7d21b8a3df611fc0 -> cargo-c-0.10.3-funtoo-crates-bundle-f95aaab9d6517f98038fd0a349fa2389acbb231a656df9403958f6b47b267dac3abe97d18ac1816d6b124c9d98b5e8741c7e9baa809d0fa29465d4efdce1a2f6.tar.gz"

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