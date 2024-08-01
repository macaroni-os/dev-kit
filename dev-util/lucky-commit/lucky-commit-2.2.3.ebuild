# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Customize your git commit hashes!"
HOMEPAGE="https://github.com/not-an-aardvark/lucky-commit"
SRC_URI="https://github.com/not-an-aardvark/lucky-commit/tarball/00000002877d35de410890b322e3f76790706390 -> lucky-commit-2.2.3-0000000.tar.gz
https://distfiles.macaronios.org/c4/a9/a8/c4a9a87d0d3a3b6cce95fca42b4058a929619a3257a8330349b0b14449b559a2f760e4d9cc5395716fc6c1c074b4878b145c5998a26b70398e06b2b4d0d0445a -> lucky-commit-2.2.3-funtoo-crates-bundle-bb0f63a6cb9b09dbfea55b0fbc0f1d6d8b9a48c0546e8fa9cb2e6a5226cfc320bb4d6770c96e6fcfb042d8a2cd16affe49edab61cc179beadee2c7d4084a78a8.tar.gz"

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