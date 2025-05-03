# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1 cargo

DESCRIPTION="A more intuitive version of du in rust"
HOMEPAGE="https://github.com/bootandy/dust"
SRC_URI="https://github.com/bootandy/dust/tarball/646cdd976ded146779f4fc57c34c56fa850d728f -> dust-1.2.0-646cdd9.tar.gz
https://distfiles.macaronios.org/0b/00/3f/0b003fc6c2d953bafac2c32502a8141568b809e7b21f00980fb2b069a9bf63b07d3fd9c8ecd72ca1882e3354725a80437c5d54f3854da025ea2475de102d169f -> dust-1.2.0-funtoo-crates-bundle-c5e647ca140bbf7d319b0cd0636ea8f0a10a34e9c048bbf62c0a1d2b2da11372868246779b20cb2e3c0744caa635313017dea839e3e37df111c99ffd7a727cd9.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND=""
BDEPEND="virtual/rust"

DOCS=( README.md )

QA_FLAGS_IGNORED="/usr/bin/dust"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/bootandy-dust-* ${S} || die
}

src_install() {
	cargo_src_install
	einstalldocs

	doman man-page/dust.1

	newbashcomp completions/dust.bash dust

	insinto /usr/share/fish/vendor_completions.d/
	doins completions/dust.fish
}