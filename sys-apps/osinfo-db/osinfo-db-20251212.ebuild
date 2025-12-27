# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7

DESCRIPTION="Osinfo database for virtualization provisioning tools"
HOMEPAGE="https://libosinfo.org/ https://gitlab.com/libosinfo/osinfo-db"
SRC_URI="https://releases.pagure.org/libosinfo/osinfo-db-20251212.tar.xz -> osinfo-db-20251212.tar.xz"
LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="*"
BDEPEND="sys-apps/osinfo-db-tools
	
"
S="${WORKDIR}/"
src_unpack() { :; }
src_install() {
	osinfo-db-import --root "${D}" --dir "/usr/share/osinfo" "${DISTDIR}/${A}"
}


# vim: filetype=ebuild
