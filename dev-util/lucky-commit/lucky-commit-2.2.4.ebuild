# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Customize your git commit hashes!"
HOMEPAGE="https://github.com/not-an-aardvark/lucky-commit"
SRC_URI="https://github.com/not-an-aardvark/lucky-commit/tarball/0000000528d30e42901f5650a6597371380c815b -> lucky-commit-2.2.4-0000000.tar.gz
https://distfiles.macaronios.org/f2/5b/e2/f25be2ba3b7150471e1b758a7344d2dfd7db3060e1d98e25b5d838f02279220e1b03ddccf4e6d1255bd60e6726e1c86a2330e6cb5c35153fdfaac2f593dc8da5 -> lucky-commit-2.2.4-funtoo-crates-bundle-bb0f63a6cb9b09dbfea55b0fbc0f1d6d8b9a48c0546e8fa9cb2e6a5226cfc320bb4d6770c96e6fcfb042d8a2cd16affe49edab61cc179beadee2c7d4084a78a8.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

BDEPEND="virtual/rust"

QA_FLAGS_IGNORED="/usr/bin/lucky-commit"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/not-an-aardvark-lucky-commit-* ${S} || die
}

src_compile() {
	cargo_src_compile --no-default-features
}

src_install() {
	cargo_src_install --no-default-features
}