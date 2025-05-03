# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Customize your git commit hashes!"
HOMEPAGE="https://github.com/not-an-aardvark/lucky-commit"
SRC_URI="https://github.com/not-an-aardvark/lucky-commit/tarball/0000000876876e416982091254f7d7c18c52001b -> lucky-commit-2.2.5-0000000.tar.gz
https://distfiles.macaronios.org/4f/6e/44/4f6e4427baf3d0b7bc64763336c318d1e8a14e5adbabbd27b9d32153243150e758d7a2e91349b7f82d8f47a662fa27ea21355b61827512dbc7183397db2c4fa9 -> lucky-commit-2.2.5-funtoo-crates-bundle-937581fa411dc7b5172d5ac8f3ce4ea6b1e5ffe56f765a4e4d171ae2373ccf13b8f8da87fa45738dbf3c270e5fa54a082c5c5ea3bcf69c7965f50e8691eede63.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

BDEPEND="virtual/rust"

QA_FLAGS_IGNORED="/usr/bin/lucky-commit"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/not-an-aardvark-lucky-commit-* ${S} || die
}

src_compile() {
	cargo_src_compile --no-default-features
}

src_install() {
	cargo_src_install --no-default-features
}