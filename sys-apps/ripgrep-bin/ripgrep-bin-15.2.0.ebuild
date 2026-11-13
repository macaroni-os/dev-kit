# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
QA_PREBUILT="/usr/bin/rg"

DESCRIPTION="ripgrep, a fast recursive grep (upstream binary)"
HOMEPAGE="https://github.com/BurntSushi/ripgrep"
SRC_URI="
amd64? ( https://github.com/BurntSushi/ripgrep/releases/download/15.2.0/ripgrep-15.2.0-x86_64-unknown-linux-musl.tar.gz -> ripgrep-bin-15.2.0-amd64-linux.tar.gz )
arm64? ( https://github.com/BurntSushi/ripgrep/releases/download/15.2.0/ripgrep-15.2.0-aarch64-unknown-linux-musl.tar.gz -> ripgrep-bin-15.2.0-arm64-linux.tar.gz )"
LICENSE="Unlicense"
SLOT="0"
KEYWORDS="*"
IUSE="amd64 arm64"
RESTRICT="strip"
S="${WORKDIR}"
src_install() {
	local bin=$(find . -maxdepth 2 -type f -name rg -print -quit)
	[[ -n ${bin} ]] || die "rg binary not found in ${S}"
	newbin "${bin}" rg
	# README ships inside the versioned per-target dir.
	dodoc "$(dirname "${bin}")/README.md"
}


# vim: filetype=ebuild
