# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1 cargo

DESCRIPTION="A more intuitive version of du in rust"
HOMEPAGE="https://github.com/bootandy/dust"
SRC_URI="https://github.com/bootandy/dust/tarball/b24f4c8096557529e63e6fb09fc6ecdb497d153b -> dust-1.1.2-b24f4c8.tar.gz
https://distfiles.macaronios.org/2c/4e/2d/2c4e2d8d3b783278ce327c674996ff2c4b4df2a5e62d8d8b3f61de7e26974f95a67655325c4907c3035d0cd829cb5a0efd67b5d709c521f9f137a4cde0e5326c -> dust-1.1.2-funtoo-crates-bundle-a241bb2a3866a5e148df6ef901dc18695f98415757c3d288efe155f448ef678d498f481a2d2d5cf09c23b01ca1ef0480ea31afb84af72bc26618c865818cf5ad.tar.gz"

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