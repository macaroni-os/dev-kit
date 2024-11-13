# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/aab1ac81bb31762509b5ea4b39973070725b5d73 -> wasm-tools-1.220.0-aab1ac8.tar.gz
https://distfiles.macaronios.org/9c/2e/78/9c2e78460dd2acd6ef8f5743d2b7811efb9645bcbfd1769fe151a98d85b7ac2f2cd6d07f8365e40baccfc3f556814a1460ddc5323e0be3a53d2072d6407546e0 -> wasm-tools-1.220.0-funtoo-crates-bundle-96188214039ea6e1d2c26a41e863d2bf200d26baa0aae396780627e081cebe73b0c08a5fa9867fc6c069751a1ee7df6bc96c725884b0b602328850e795bc5852.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DOCS=( README.md )

QA_FLAGS_IGNORED="/usr/bin/wasm-tools"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/bytecodealliance-wasm-tools-* ${S} || die
}

src_install() {
	cargo_src_install
	einstalldocs
}