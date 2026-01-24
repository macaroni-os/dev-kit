# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7

DESCRIPTION="\"DING is not GNU\" helper libraries for SSSD and FreeIPA"
HOMEPAGE="https://github.com/SSSD/ding-libs"
SRC_URI="https://github.com/SSSD/ding-libs/releases/download/0.6.2/ding-libs-0.6.2.tar.gz -> ding-libs-0.6.2.tar.gz"
LICENSE="LGPL-3.0"
SLOT="0"
KEYWORDS="*"
BDEPEND="virtual/pkgconfig
	
"

post_src_unpack() {
	mv SSSD-ding-libs-* ${S}
}


src_configure() {
	ECONF_SOURCE="${S}" econf
}



# vim: filetype=ebuild
