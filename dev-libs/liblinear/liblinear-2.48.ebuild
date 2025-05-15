# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit toolchain-funcs

DESCRIPTION="A Library for Large Linear Classification"
HOMEPAGE="https://www.csie.ntu.edu.tw/~cjlin/liblinear/ https://github.com/cjlin1/liblinear"
SRC_URI="https://www.csie.ntu.edu.tw/~cjlin/liblinear/./liblinear-2.48.tar.gz -> liblinear-2.48.tar.gz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="*"
IUSE="blas"
RDEPEND="blas? ( virtual/blas )
	
"
DEPEND="${RDEPEND}
	blas? ( virtual/pkgconfig )
	
"
src_prepare() {
	default
	sed -i \
	  -e '/^CFLAGS/d;/^CXXFLAGS/d' \
	  blas/Makefile || die
	sed -i \
	  -e 's|make|$(MAKE)|g' \
	  -e '/$(LIBS)/s|$(CFLAGS)|& $(LDFLAGS)|g' \
	  -e '/^CFLAGS/d;/^CXXFLAGS/d' \
	  -e 's|$(SHARED_LIB_FLAG)|& $(LDFLAGS)|g' \
	  Makefile || die
}
src_compile() {
	emake \
	  CC="$(tc-getCC)" \
	  CXX="$(tc-getCXX)" \
	  CFLAGS="${CFLAGS} -fPIC" \
	  CXXFLAGS="${CXXFLAGS} -fPIC" \
	  AR="$(tc-getAR)" \
	  RANLIB="$(tc-getRANLIB)" \
	  lib all
}
src_install() {
	dolib.so liblinear.so.*
	dosym liblinear.so.* /usr/$(get_libdir)/liblinear$(get_libname)
	newbin predict liblinear-predict
	newbin train liblinear-train
	doheader linear.h
	dodoc README
}


# vim: filetype=ebuild
