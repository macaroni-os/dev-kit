# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7

DESCRIPTION="Linux Trace Toolkit - next generation"
HOMEPAGE="https://lttng.org"
SRC_URI="https://lttng.org/files/lttng-tools/lttng-tools-2.15.1.tar.bz2 -> lttng-tools-2.15.1.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
IUSE="+ust"
RDEPEND="dev-libs/userspace-rcu:=
	dev-libs/popt
	dev-libs/libxml2
	ust? ( dev-util/lttng-ust:= )
	
"
DEPEND="${RDEPEND}
"
src_configure() {
	econf $(usex ust "" --without-lttng-ust) --disable-static --enable-tests=no
}
src_install() {
	default
	find "${ED}" -name '*.la' -delete || die
}


# vim: filetype=ebuild
