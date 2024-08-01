# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="like ~~grep~~ UBER, but for binaries"
HOMEPAGE="https://github.com/m4b/bingrep"
SRC_URI="https://github.com/m4b/bingrep/tarball/7b0792f0d6853e895086b07228491c3bba82e821 -> bingrep-0.11.0-7b0792f.tar.gz
https://distfiles.macaronios.org/bc/2d/ce/bc2dcef709e58752565488383d8965c43a80f16e6200710660767b2e4f060ac0a939c7cbedcbf165bce36dfd1e13bce15625498e63c8eae5afffe10c3847d91f -> bingrep-0.11.0-funtoo-crates-bundle-e3dce731b5ab846ca2882efb7a166ad383bc3f503a51da993ded0ccfb2879ae15aac6993934dc786aaef0328f6943a2bf8ffb6934bf6a4632a2fa24e53b3cf96.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

QA_FLAGS_IGNORED="/usr/bin/bingrep"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/m4b-bingrep-* ${S} || die
}