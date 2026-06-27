# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
QA_PREBUILT="/usr/bin/jq"

DESCRIPTION="A lightweight and flexible command-line JSON processor"
HOMEPAGE="https://stedolan.github.io/jq/"
SRC_URI="
amd64? ( https://github.com/jqlang/jq/releases/download/jq-1.8.2/jq-linux-amd64 -> jq-bin-1.8.2-linux-amd64 )
arm? ( https://github.com/jqlang/jq/releases/download/jq-1.8.2/jq-linux-armhf -> jq-bin-1.8.2-linux-armhf )
arm64? ( https://github.com/jqlang/jq/releases/download/jq-1.8.2/jq-linux-arm64 -> jq-bin-1.8.2-linux-arm64 )"
LICENSE="NOASSERTION"
SLOT="0"
KEYWORDS="*"
IUSE="amd64 arm arm64"
RDEPEND="!app-misc/jq
	
"
DEPEND="${RDEPEND}
"
S="${WORKDIR}"
src_prepare() {
	if use amd64; then
	  cp "${DISTDIR}"/${P}-linux-amd64 jq || die
	elif use arm64; then
	  cp "${DISTDIR}"/${P}-linux-arm64 jq || die
	else
	  cp "${DISTDIR}"/${P}-linux-armhf jq || die
	fi
	eapply_user
}
src_install() {
	dobin "${WORKDIR}"/jq
}


# vim: filetype=ebuild
