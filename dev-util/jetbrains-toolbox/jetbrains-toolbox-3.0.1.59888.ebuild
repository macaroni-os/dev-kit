# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
QA_PREBUILT="opt/jetbrains-toolbox/jetbrains-toolbox"
inherit desktop eutils xdg java-vm-2

DESCRIPTION=""
HOMEPAGE="https://www.jetbrains.com/toolbox-app"
SRC_URI="
amd64? ( https://download.jetbrains.com/toolbox/jetbrains-toolbox-3.0.1.59888.tar.gz -> jetbrains-toolbox-3.0.1.59888-amd64.tar.gz )
arm64? ( https://download.jetbrains.com/toolbox/jetbrains-toolbox-3.0.1.59888-arm64.tar.gz -> jetbrains-toolbox-3.0.1.59888-arm64.tar.gz )"
LICENSE="JetBrains"
SLOT="0"
KEYWORDS="*"
IUSE="+system-java +sysctl"
DEPEND="sys-fs/fuse:0
"
S="${WORKDIR}/jetbrains-toolbox-3.0.1.59888/bin"
src_install() {
	keepdir /opt/jetbrains-toolbox
	insinto /opt/jetbrains-toolbox
	doins -r .
	fperms +x /opt/jetbrains-toolbox/jetbrains-toolbox
	newicon toolbox-tray-color.png "jetbrains-toolbox.png"
	make_wrapper "jetbrains-toolbox" /opt/jetbrains-toolbox/jetbrains-toolbox
	mkdir -p "${ED}"/usr/share/applications
	insinto /usr/share/applications
	doins "${PN}.desktop"
}
pkg_postinst() {
	xdg_desktop_database_update
}
pkg_postrm() {
	xdg_desktop_database_update
}


# vim: filetype=ebuild
