# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/03/15/22/0315222f62ccd9410a2bc10f0ec22b855f348447729ef9d91cc52746572ae57f5aaf3a5e3794f8ea4a2587a78f1013d547ab6470c2e661381570dcd6daebfe46 -> cargo-c-0.10.3-funtoo-crates-bundle-783c35a453da4f2510a6a4abc53bee1778b18074b9baffb16124d31b3cb25dccacdb4dabd420215284f32ac8098f6c2312d6114428365884518b9af81ced06e7.tar.gz"

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