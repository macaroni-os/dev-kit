# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
QA_PREBUILT="/usr/bin/yq4"

DESCRIPTION="Portable command-line YAML, JSON, XML, CSV, TOML and properties processor"
HOMEPAGE="https://github.com/mikefarah/yq/"
SRC_URI="
amd64? ( https://github.com/mikefarah/yq/releases/download/v4.53.2/yq_linux_amd64.tar.gz -> yq4-bin-4.53.2-linux-amd64.tar.gz )
arm? ( https://github.com/mikefarah/yq/releases/download/v4.53.2/yq_linux_arm.tar.gz -> yq4-bin-4.53.2-linux-arm.tar.gz )
arm64? ( https://github.com/mikefarah/yq/releases/download/v4.53.2/yq_linux_arm64.tar.gz -> yq4-bin-4.53.2-linux-arm64.tar.gz )"
LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE="amd64 arm arm64"
RDEPEND="!app-misc/yq-go
	
"
DEPEND="${RDEPEND}
"
S="${WORKDIR}"
src_prepare() {
	default
	if use amd64; then
	  mv yq_linux_amd64 yq4 || die
	elif use arm64; then
	  mv yq_linux_arm64 yq4 || die
	else
	  cp yq_linux_arm yq4 || die
	fi
	eapply_user
}
src_install() {
	dobin yq4
}


# vim: filetype=ebuild
