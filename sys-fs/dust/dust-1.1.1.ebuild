# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1 cargo

DESCRIPTION="A more intuitive version of du in rust"
HOMEPAGE="https://github.com/bootandy/dust"
SRC_URI="https://github.com/bootandy/dust/tarball/dbd18f90e7b184d12f14533e76e5915dbe4a2051 -> dust-1.1.1-dbd18f9.tar.gz
https://distfiles.macaronios.org/d9/6e/d8/d96ed88c023ab0bd8370603a5b95b012726ec18217e6df8aab9f5d85895e27768227e3f8fb515a747b8414fc44801a071c6740a749371ec3291c7c46b4715927 -> dust-1.1.1-funtoo-crates-bundle-54a0bcdf68182cc3a316b1a00a34e60ee908a97d2e8e011c3c8ab534c95dde4e9179807a2d572f084d251f54e13e31d56b441db8adc107d80e586e74a95f6636.tar.gz"

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