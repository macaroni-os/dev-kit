# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="like ~~grep~~ UBER, but for binaries"
HOMEPAGE="https://github.com/m4b/bingrep"
SRC_URI="https://github.com/m4b/bingrep/tarball/7b0792f0d6853e895086b07228491c3bba82e821 -> bingrep-0.11.0-7b0792f.tar.gz
https://distfiles.macaronios.org/bf/8b/10/bf8b10e9eb3132950a34126af79737bcc89d99eba2352484b160e6671f2f3dbd82a602ec4a559c9bfda0139fc9c53dcc06e9ff9ff68c90be2c3a926aa76a8b44 -> bingrep-0.11.0-funtoo-crates-bundle-e3dce731b5ab846ca2882efb7a166ad383bc3f503a51da993ded0ccfb2879ae15aac6993934dc786aaef0328f6943a2bf8ffb6934bf6a4632a2fa24e53b3cf96.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

QA_FLAGS_IGNORED="/usr/bin/bingrep"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/m4b-bingrep-* ${S} || die
}