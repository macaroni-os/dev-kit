# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
QA_FLAGS_IGNORED="/usr/bin/cbindgen"
inherit cargo

DESCRIPTION="A project for generating C bindings from Rust code"
HOMEPAGE="https://github.com/mozilla/cbindgen"
SRC_URI="
https://api.github.com/repos/mozilla/cbindgen/tarball/refs/tags/v0.29.2 -> cbindgen-0.29.2-76f41c0.tar.gz
mirror://macaroni/cbindgen-0.29.2-mark-rust-bundle-76f41c0.tar.xz -> cbindgen-0.29.2-mark-rust-bundle-76f41c0.tar.xz"
LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="*"
src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/mozilla-cbindgen-* ${S} || die
}
src_install() {
	cargo_src_install
	einstalldocs
}


# vim: filetype=ebuild
