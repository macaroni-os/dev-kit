# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/9e/79/c5/9e79c50911e22f59442e1a5944b00f7e5605a06c3f4577978cd027bbf3052ae10afcca54858d6b22cd7beed32d13a6350a7a651e4d64f8186afbc8e0e4a412c1 -> cargo-c-0.10.5-funtoo-crates-bundle-2873c53108971e4529133d8d6cfff64a59fb363d5941ca15159c770671714f8783e9da321f6cdeffb929a8751770aae46e30c75cf259ffe88729594ab3028ac7.tar.gz"

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