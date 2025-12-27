# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit meson

DESCRIPTION="Tools for managing the osinfo database"
HOMEPAGE="https://libosinfo.org/"
SRC_URI="https://releases.pagure.org/libosinfo/osinfo-db-tools-1.12.0.tar.xz -> osinfo-db-tools-1.12.0.tar.xz"
LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="*"
BDEPEND="virtual/pkgconfig
	sys-devel/gettext
	dev-lang/perl
	
"
RDEPEND="dev-libs/glib:2
	dev-libs/json-glib
	app-arch/libarchive:=
	net-libs/libsoup:3
	dev-libs/libxml2:=
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
