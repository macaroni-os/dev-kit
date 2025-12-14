# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit eutils pax-utils xdg-utils

DESCRIPTION="Git GUI client"
HOMEPAGE="https://www.gitkraken.com/"
SRC_URI="https://release.gitkraken.com/linux/GitKraken-v11.7.0.tar.gz -> gitkraken-11.7.0-amd64.tar.gz"
LICENSE="Axosoft, LLC"
SLOT="0"
KEYWORDS="*"
RDEPEND="x11-libs/libXScrnSaver
	gnome-base/libgnome-keyring
	dev-libs/nss
	
"
DEPEND="${RDEPEND}
"
S="${WORKDIR}/gitkraken"
src_install() {
	declare GITKRAKEN_HOME=/opt/${PN}
	# Install gitkraken in /opt
	dodir ${GITKRAKEN_HOME%/*}
	mv "${S}" "${ED}"${GITKRAKEN_HOME} || die
	insinto ${GITKRAKEN_HOME}
	doins "${FILESDIR}/gitkraken.png"
	# Create /usr/bin/gitkraken
	dodir /usr/bin/
	echo '#!/bin/sh' > "${ED}"/usr/bin/${PN}
	echo 'exec /opt/${PN}/${PN} "\$@"' >> "${ED}"/usr/bin/${PN}
	fperms 0755 /usr/bin/${PN}
	fperms 4755 /opt/gitkraken/chrome-sandbox
	insinto /usr/share/applications
	doins "${FILESDIR}/gitkraken.desktop"
}
pkg_postinst() {
	xdg_desktop_database_update
}


# vim: filetype=ebuild
