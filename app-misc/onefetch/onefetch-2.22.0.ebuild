# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Command-line Git information tool"
HOMEPAGE="https://github.com/o2sh/onefetch"
SRC_URI="https://github.com/o2sh/onefetch/tarball/5151b54289e6fc94b0a3f7d2ffca06949fc1a4d7 -> onefetch-2.22.0-5151b54.tar.gz
https://distfiles.macaronios.org/5a/f9/49/5af9494c34a916cd23ccac781c75f041b52e4eb81360376ba702557e4cdc5b5092934ee81245b67713cfe070ce160e5679b3162e0f41b35518f2f761c0f4e05e -> onefetch-2.22.0-funtoo-crates-bundle-9baf236c46175749a81c2724e628ae4b9d6d9ab9663ce9419801d67f92f6b70c44c9b01b96e08a2a17877858ef06c902ebc4c8137a68ac598a3252f56a09c244.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

BDEPEND="virtual/rust"

QA_FLAGS_IGNORED="/usr/bin/onefetch"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/o2sh-onefetch-* ${S} || die
}