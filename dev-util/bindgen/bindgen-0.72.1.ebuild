# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
QA_FLAGS_IGNORED="/usr/bin/bindgen"
inherit cargo

DESCRIPTION="Automatically generates Rust FFI bindings to C (and some C++) libraries."
HOMEPAGE="https://rust-lang.github.io/rust-bindgen/"
SRC_URI="
https://api.github.com/repos/rust-lang/rust-bindgen/tarball/refs/tags/v0.72.1 -> bindgen-0.72.1-d874de8.tar.gz
mirror://macaroni/bindgen-0.72.1-mark-rust-bundle-d874de8.tar.xz -> bindgen-0.72.1-mark-rust-bundle-d874de8.tar.xz"
LICENSE="BSD-3-Clause"
SLOT="0"
KEYWORDS="*"
RDEPEND="sys-devel/clang
	
"
src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/rust-lang-rust-bindgen-* ${S} || die
}
src_install() {
	cargo_src_install --path "${S}/bindgen-cli"
	einstalldocs
}


# vim: filetype=ebuild
