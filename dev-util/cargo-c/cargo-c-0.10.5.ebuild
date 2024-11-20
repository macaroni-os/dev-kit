# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/eb/1a/42/eb1a42fedc681046a0dbe973443eaf9b86e8a754366af465226b74c99bb314b8df47e4c522b5ba55ed0650c80e48c3d84e750d2277ce09caaf6ec49a472d7336 -> cargo-c-0.10.5-funtoo-crates-bundle-a1379491e1f57f45d93ce6e6e93374e03d0c88973519a8873052596ba19ab87ea13acb17ee8fd16ad42a58333a34a6388b8eeecd08246d3594fe210fe759b6d1.tar.gz"

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