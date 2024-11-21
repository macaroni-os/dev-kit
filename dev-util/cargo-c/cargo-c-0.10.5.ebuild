# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/c0/b0/b4/c0b0b480ff0c7e9b39225024da9c22f2a9e0326c680cd24a4ebbc0ec863d234cd3ef144a28ce6b9640736662f6bcc32149d48b46e1464523ce1c093377e6b70a -> cargo-c-0.10.5-funtoo-crates-bundle-3d89c7f17b8370bb2de47650a1727a61a4f25b92b46cf349e3b52b2009f3e50fa70fec9e1db0b7f6899aba5118c90861df86383519236d43abbbb7bc8d792c9c.tar.gz"

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