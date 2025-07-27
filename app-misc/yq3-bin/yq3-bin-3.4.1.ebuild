# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
QA_PREBUILT="/usr/bin/yq"

DESCRIPTION="Portable command-line YAML, JSON, XML, CSV, TOML and properties processor"
HOMEPAGE="https://github.com/mikefarah/yq/"
SRC_URI="
amd64? ( https://github.com/mikefarah/yq/releases/download/3.4.1/yq_linux_amd64 -> yq3-bin-3.4.1-linux-amd64 )
arm? ( https://github.com/mikefarah/yq/releases/download/3.4.1/yq_linux_arm -> yq3-bin-3.4.1-linux-arm )
arm64? ( https://github.com/mikefarah/yq/releases/download/3.4.1/yq_linux_arm64 -> yq3-bin-3.4.1-linux-arm64 )"
SLOT="0"
KEYWORDS="*"
IUSE="amd64 arm arm64"
S="${WORKDIR}"
src_prepare() {
	if use amd64; then
	  cp "${DISTDIR}"/yq3-bin-3.4.1-linux-amd64 yq || die
	elif use arm64; then
	  cp "${DISTDIR}"/yq3-bin-3.4.1-linux-arm64 yq || die
	else
	  cp "${DISTDIR}"/yq3-bin-3.4.1-linux-arm yq || die
	fi
	eapply_user
}
src_install() {
	dobin yq
}


# vim: filetype=ebuild
