# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit autotools

DESCRIPTION="Linux Trace Toolkit - UST library"
HOMEPAGE="https://lttng.org"
SRC_URI="https://lttng.org/files/lttng-ust/lttng-ust-2.16.0.tar.bz2 -> lttng-ust-2.16.0.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
IUSE="examples numa python java jni"
RDEPEND="dev-libs/userspace-rcu:=
	numa? ( sys-process/numactl )
	
"
DEPEND="${RDEPEND}
"
src_prepare() {
	default
	if ! use examples; then
		sed -i -e '/SUBDIRS/s:examples::' doc/Makefile.am || die
	fi
	eautoreconf
}
src_configure() {
	econf \
		$(use_enable numa) \
		$(use_enable python python-agent) \
		$(use_enable java java-agent-all) \
		$(use_enable jni jni-interface)
}
src_install() {
	default
	find "${ED}" -name '*.la' -delete || die
}


# vim: filetype=ebuild
