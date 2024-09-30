# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/48/4b/44/484b4494db91db34c07b3eb5716f38e460cf0ba495e7777fcc46dc2e04a70ade2789cf2881d420b35a786f93ddd7c5427182f328542199c6cfa83f0eb1dfdf27 -> cargo-c-0.10.4-funtoo-crates-bundle-67ca73dfec5b449d6009383454ba7d3a7835b1a0c06d29721aa2feef35c5404f366d8b1ec9eb2d864e1dc978cc3ebd72b579f8a66e526de8d582ef2e8ea8eaea.tar.gz"

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