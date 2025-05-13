# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8c5b7af3d6edb6d99f7bffcc94adf550cfee65b3 -> cargo-c-0.10.12-8c5b7af.tar.gz
https://distfiles.macaronios.org/4a/a1/bf/4aa1bf3d36a4575f06496690fce6ec15e175d784eacf4b56776ea91eacc16adac066cc622db8be785373ca2d85129fe726418307124226bbf06b14d4a7737d70 -> cargo-c-0.10.12-funtoo-crates-bundle-4f46e44cc96b070dfdab840e125ae009105dbe923d1a5465399d1e4c4a8c687e499b5ee6f456089ecc0550f2a2a4aad148f6d8954dc7df67079e6c25d93a6228.tar.gz"

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