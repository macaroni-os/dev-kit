# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
QA_PREBUILT="/usr/bin/pnpm"

DESCRIPTION="Fast, disk space efficient package manager (upstream binary)"
HOMEPAGE="https://pnpm.io"
SRC_URI="
amd64? ( https://github.com/pnpm/pnpm/releases/download/v12.15.0/pnpm-linux-x64.tar.gz -> pnpm-bin-12.15-amd64-linux.tar.gz )
arm64? ( https://github.com/pnpm/pnpm/releases/download/v12.15.0/pnpm-linux-arm64.tar.gz -> pnpm-bin-12.15-arm64-linux.tar.gz )"
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
	local asset
	if use amd64 ; then
		asset="${DISTDIR}/pnpm-bin-12.15-amd64-linux.tar.gz"
	fi
	if use arm64 ; then
		asset="${DISTDIR}/pnpm-bin-12.15-arm64-linux.tar.gz"
	fi
	[[ -n "${asset}" ]] || die "No pnpm binary asset available for the current ARCH"
	# The upstream tarball holds the standalone Node SEA executable
	# as ./pnpm (plus an unneeded dist/ tree). Extract only the binary.
	tar xzf "${asset}" -C "${T}" pnpm || die
	newbin "${T}/pnpm" pnpm
}


# vim: filetype=ebuild
