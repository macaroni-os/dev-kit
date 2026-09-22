# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
PYTHON_COMPAT=( python3+ )
PYTHON_REQ_USE="threads(+)"
inherit python-single-r1 autotools

DESCRIPTION="Samba talloc library"
HOMEPAGE="https://talloc.samba.org/"
SRC_URI="https://download.samba.org/pub/talloc/talloc-2.5.0.tar.gz -> talloc-2.5.0.tar.gz"
LICENSE="GPL-3 LGPL-3+ LGPL-2"
SLOT="0"
KEYWORDS="*"
IUSE="compat +python"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"
BDEPEND="sys-devel/gettext
	dev-libs/libxslt
	${PYTHON_DEPS}
	
"
RDEPEND="dev-libs/libbsd
	python? ( ${PYTHON_DEPS} )
	
"
DEPEND="${RDEPEND}
"
pkg_setup() {
	export DISTCC_DISABLE=1
	export CCACHE_DISABLE=1
	python-single-r1_pkg_setup
}
src_configure() {
	local extra_opts=(
	  --libdir="${EPREFIX}/usr/$(get_libdir)"
	  --disable-dependency-tracking
	  --disable-warnings-as-errors
	  $(usev compat --enable-talloc-compat1)
	  $(usex python '' --disable-python)
	)
	 append-ldflags $(test-flags-CCLD -Wl,--undefined-version)
	 econf "${extra_opts[@]}"
}
src_install() {
	emake DESTDIR="${ED}" install
	use python && python_optimize
}


# vim: filetype=ebuild
