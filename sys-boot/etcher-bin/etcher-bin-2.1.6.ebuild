# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit desktop eutils electron unpacker pax-utils xdg

DESCRIPTION="Flash OS images to SD cards & USB drives, safely and easily."
HOMEPAGE="https://etcher.io/"
SRC_URI="https://github.com/balena-io/etcher/releases/download/v2.1.6/balena-etcher_2.1.6_amd64.deb -> etcher-bin-2.1.6.linux-amd64.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
# Commons depends
CDEPEND="media-libs/libpng
	x11-libs/gtk+
	x11-libs/cairo
	x11-libs/libXtst
	sys-apps/lsb-release
	
"
RDEPEND="${CDEPEND}
	x11-libs/libnotify
	x11-libs/libXScrnSaver
	dev-libs/nss
	
"
DEPEND="${CDEPEND}
"
src_unpack() {
	# etcher does not use a containing folder(deb archive)
	# manual intervention required
	install -d "${WORKDIR}/${P}"
	S="${WORKDIR}/${P}"
	cd "${S}" || die "cd into target directory ${S} failed"
	unpack_deb "${A}"
}
src_install() {
	local instdir="/opt/balenaEtcher"
	local balenabin="balena-etcher"
	insinto ${instdir}
	doins -r *
	dosym "${instdir}/${balenabin}" "/usr/bin/etcher" || die
	make_wrapper "etcher" "${instdir}/${balenabin}" || die
	# only contains changelog"
	rm -rf "${D}/usr/share/doc" || die
	# use own desktop file
	rm -fR "${D}/usr/share/applications" || die
	domenu "${FILESDIR}/etcher.desktop" || die
	# correct permissions of install components
	fperms a+x "${instdir}/usr/bin/${balenabin}" || die
	pax-mark m "${instdir}/usr/bin/${balenabin}" || die
}
pkg_postinst() {
	xdg_pkg_postinst
}
pkg_postrm() {
	xdg_pkg_postrm
}


# vim: filetype=ebuild
