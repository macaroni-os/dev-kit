# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
QA_FLAGS_IGNORED="/usr/bin/rg"
inherit cargo

DESCRIPTION="ripgrep recursively searches directories for a regex pattern while respecting your gitignore"
HOMEPAGE="https://github.com/BurntSushi/ripgrep"
SRC_URI="
https://api.github.com/repos/BurntSushi/ripgrep/tarball/16.0.0 -> ripgrep-16.0.0-669cb4c.tar.gz
mirror://macaroni/ripgrep-16.0.0-mark-rust-bundle-669cb4c.tar.xz -> ripgrep-16.0.0-mark-rust-bundle-669cb4c.tar.xz"
LICENSE="Unlicense"
SLOT="0"
KEYWORDS="*"
RDEPEND="!sys-apps/ripgrep-bin
"
src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/BurntSushi-ripgrep-* ${S} || die
}
src_install() {
	cargo_src_install
	einstalldocs
}


# vim: filetype=ebuild
