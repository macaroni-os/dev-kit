# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/64/26/8c/64268ca24c8bc8aa8452d69f04450d4d7c3210c2dd46a45e2b3ff347b476b851ecdad6a55455eb29c57f465965f58036dc481de9bad465c0035435d0bd466abe -> cargo-c-0.10.3-funtoo-crates-bundle-5816953d9624578b52c2773f02bf4f3975b810a2219a75f3762dbb01529b74023428f0dd6c4b07e2f7f3aeac0ec45a958e16c040dcf12a865e87b41a924cca62.tar.gz"

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