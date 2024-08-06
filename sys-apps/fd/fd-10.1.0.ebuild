# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A simple, fast and user-friendly alternative to 'find'"
HOMEPAGE="https://github.com/sharkdp/fd"
SRC_URI="https://github.com/sharkdp/fd/tarball/289a68bac3938d56b176d5b15fab312fd538e949 -> fd-10.1.0-289a68b.tar.gz
https://distfiles.macaronios.org/b1/af/a6/b1afa60185f70795d656d5da439d52717f5ffe0e496d543228f6f2cbc2c8db702eba2b62233ca2f9e06c0dc609554fcd7ecb84f21a374ef8c8da514646f6dcd1 -> fd-10.1.0-funtoo-crates-bundle-477f541bd9f5e5c33850ac474d6d742ae4d0d7d2b9b8d8d9b61dbd36f11806bfda0c042338391625155c916df5c2d5c9f3b152335b9d784f373efd0c5414f0e8.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND="${DEPEND}"
DEPEND="virtual/rust"

QA_FLAGS_IGNORED="/usr/bin/fd"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/sharkdp-fd-* ${S} || die
}

src_compile() {
	# https://bugs.funtoo.org/browse/FL-10663
	# If we want bash and fish shell completions we have to
	# reverse engineer components of this Makefile from upstream
	# into this ebuild: https://github.com/sharkdp/fd/blob/master/Makefile
	#
	# After fd v8.5.0, bash and fish shell completion is being handled directly
	# by the fd Rust binary itself, specifically the clap_complete feature of the clap Crate
	#
	# These shell completion files can now be dynamically generated  with:
	# fd --gen-completions bash
	# fd --gen-completions fish
	#
	# The problem is the absolute pathing to the fd binary in those auto-generated
	# completion files needs to be correct relative to the Funtoo install in this ebuild
	cargo_src_compile
}

src_install() {
	cargo_src_install

	insinto /usr/share/zsh/site-functions
	doins contrib/completion/_fd
	dodoc README.md
	doman doc/fd.1
}