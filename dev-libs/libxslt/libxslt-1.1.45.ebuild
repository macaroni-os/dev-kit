# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
PYTHON_COMPAT=( python3+ )
inherit flag-o-matic libtool python-single-r1

DESCRIPTION="XSLT libraries and tools"
HOMEPAGE="https://gitlab.gnome.org/GNOME/libxslt"
SRC_URI="https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.45.tar.xz -> libxslt-1.1.45.tar.xz"
LICENSE="MIT"
SLOT="0/0"
KEYWORDS="*"
IUSE="crypt debug python static-libs examples"
RDEPEND=">=dev-libs/libxml2-2.15.1:2
	crypt?  ( dev-libs/libgcrypt:0= )
	python? ( ${PYTHON_DEPS} )
	
"
DEPEND="${RDEPEND}
	${PYTHON_DEPS}
	
"
PDEPEND="python? ( >=dev-python/libxslt-python-1.1.45 )
	
"
src_prepare() {
	default
	elibtoolize
}
src_configure() {
	# Remove this after upstream merge request to add AC_SYS_LARGEFILE lands:
	# https://gitlab.gnome.org/GNOME/libxslt/-/merge_requests/55
	append-lfs-flags
	ECONF_SOURCE="${S}" econf \
	  --without-python \
	  $(use_with crypt crypto) \
	  $(use_with debug) \
	  $(use_with debug mem-debug) \
	  $(use_enable static-libs static)
}
src_compile() {
	# Peform the build, sans python:
	default
}
src_install() {
	emake DESTDIR="${D}" install
	einstalldocs
	if ! use examples ; then
	  rm -rf "${ED}"/usr/share/doc/${PF}/tutorial{,2} || die
	  rm -rf "${ED}"/usr/share/doc/${PF}/python/examples || die
	fi
	find "${ED}" -type f -name "*.la" -delete || die
}


# vim: filetype=ebuild
