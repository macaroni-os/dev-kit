# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Yet another cross-platform graphical process/system monitor."
HOMEPAGE="https://github.com/ClementTsang/bottom"
SRC_URI="https://github.com/ClementTsang/bottom/tarball/2ec1fb56c9db0b37acc4eca3230adfb52720376b -> bottom-0.10.2-2ec1fb5.tar.gz
https://distfiles.macaronios.org/cb/27/45/cb2745eba2f1e39848476de043a4e741ef8606999a54744fc225c68d43cb3f0b9ed3f64cd9c4bc35299d4fc90895f3a984350e140b2c1ce7cc454eab31d53b6d -> bottom-0.10.2-funtoo-crates-bundle-e934c30018c7ddff2c4105470742a48afd70f012b242ad29c8e9c7f186e0bbc52c848c612ac7fb13ae57ea8c4aa070fb3107cd8032dc9fe238d6a4260b4e3fd7.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND=""
BDEPEND="virtual/rust"

DOCS=( README.md CHANGELOG.md )

QA_FLAGS_IGNORED="/usr/bin/btm"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/ClementTsang-bottom-* ${S} || die
}

src_install() {
	cargo_src_install
	einstalldocs
}