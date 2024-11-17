# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Cross-platform Rust rewrite of the GNU coreutils"
HOMEPAGE="https://github.com/uutils/coreutils https://uutils.github.io/coreutils/docs/"
SRC_URI="https://github.com/uutils/coreutils/tarball/9074cdeeeee32e4bc127191ccd55ab4b27ce5898 -> coreutils-0.0.28-9074cde.tar.gz
https://distfiles.macaronios.org/b3/77/86/b37786d51ab40e5338b5a6ba76a13356c85429a939a1fe0aefbdbceb72a341071df7b36fa16666381cd38b8f93ff0fcdf1a3cfb512154b953f5efdc83087267f -> uutils-coreutils-0.0.28-funtoo-crates-bundle-f81ca77525ae68f3d8f4f9b3d46a69d9713bc6b1505e13582fd7de37f11c69949cbb17ffcd434cb0ca41dd2af0e448fa226de6a7f57100deac62d6f50eb9202f.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND=""
BDEPEND="virtual/rust"

DOCS=( README.md )

QA_FLAGS_IGNORED="/usr/bin/coreutils"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/uutils-coreutils-* ${S} || die
}

src_configure() {
	cargo_src_configure --features unix
}

src_install() {
	cargo_src_install
	einstalldocs
}