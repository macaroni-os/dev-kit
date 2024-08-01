# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A tool for generating C bindings to Rust code"
HOMEPAGE="https://github.com/mozilla/cbindgen"
SRC_URI="https://github.com/mozilla/cbindgen/tarball/703b53c06f9fe2dbc0193d67626558cfa84a0f62 -> cbindgen-0.26.0-703b53c.tar.gz
https://distfiles.macaronios.org/0d/5a/01/0d5a01e879d504da5fe88c9b5f7fcf4f2c1d441e2e84e8c2f5027a010ed1e100e7b77e2ba025fec8dc35eaef4dbf04bb9a98048d88e6362763c7652c820f5e7e -> cbindgen-0.26.0-funtoo-crates-bundle-f2f57b026a06a034dc7a8451d216c48e1bf5a574297a66b0416dabb3146102549a071def72d4e855a4bc4757115fb3f5576db9fb35b2026cb10dfb7d42f3eed4.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT MPL-2.0 Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

QA_FLAGS_IGNORED="/usr/bin/cbindgen"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/mozilla-cbindgen-* ${S} || die
}

src_install() {
	cargo_src_install
	einstalldocs
}