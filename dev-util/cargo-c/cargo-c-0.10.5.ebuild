# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/6d/da/86/6dda86a5e41c9df1f8e797c099e882374fbe149790d47adb3ab162ec96ecd1eccb2bcc6e64bcafc5be27a7d7ad4ab7011bdc62dbb582025bf8c66caacc9de07e -> cargo-c-0.10.5-funtoo-crates-bundle-776df0b70553d3e91027acc8fa915bcd760ad9b6a25fa7aa521b2484a145db693a599c3d9f70be39f9e82099148bbba106f32f6e42a29cc1ad3313ab688420a9.tar.gz"

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