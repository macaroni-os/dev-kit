# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
QA_PREBUILT="/usr/bin/pnpm"

DESCRIPTION="Fast, disk space efficient package manager (upstream binary)"
HOMEPAGE="https://pnpm.io"
SRC_URI="
amd64? ( https://github.com/pnpm/pnpm/releases/download/v10.31.0/pnpm-linuxstatic-x64 -> pnpm-bin-10.31-amd64-linux )
arm64? ( https://github.com/pnpm/pnpm/releases/download/v10.31.0/pnpm-linuxstatic-arm64 -> pnpm-bin-10.31-arm64-linux )"
LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE="amd64 arm64"
src_unpack() {
	mkdir -p "${S}"
}
src_configure() { :; }
src_compile() { :; }
src_install() {
	if use amd64 ; then
	  newbin "${DISTDIR}"/pnpm-bin-10.31-amd64-linux pnpm
	fi
	if use arm64 ; then
	  newbin "${DISTDIR}"/pnpm-bin-10.31-arm64-linux pnpm
	fi
}


# vim: filetype=ebuild
