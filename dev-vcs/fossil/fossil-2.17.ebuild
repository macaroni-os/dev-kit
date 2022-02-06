# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit toolchain-funcs

DESCRIPTION="Simple, high-reliability, source control management, and more"
HOMEPAGE="http://www.fossil-scm.org/"
SRC_URI="http://www.fossil-scm.org/home/tarball/f48180f2ff3169651a725396d4f7d667c99a92873b9c3df7eee2f144be7a0721/fossil-src-2.17.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 arm ppc ppc64 x86"
IUSE="+openssl \
-miniz \
+zlib \
-exec-rel-paths \
-th1-docs \
-th1-hooks \
+tcl \
-tcl-stubs \
-tcl-private-stubs \
-mman \
-see \
-print-minimum-sqlite-version \
+internal-sqlite \
-static \
+fusefs \
-debug \
-no-opt \
-json"

REQUIRED_USE="openssl? ( !miniz )"

DEPEND="
	sys-libs/zlib
	|| ( sys-libs/readline:0 dev-libs/libedit )
	!internal-sqlite? ( >=dev-db/sqlite-3.33.0:3 )
	openssl? ( dev-libs/openssl:0 )
	th1-docs? ( dev-lang/tcl:0= )
	th1-hooks? ( dev-lang/tcl:0= )
	tcl? ( dev-lang/tcl:0= )
	tcl-stubs? ( dev-lang/tcl:0= )
	tcl-private-stubs? ( dev-lang/tcl:0= )
"
RDEPEND="${DEPEND}"

# Tests can't be run from the build directory
RESTRICT="test"

S="${WORKDIR}"/fossil-src-2.17

src_configure() {
	local myconf="--with-openssl=$(usex openssl 1 none) \
--with-miniz=$(usex miniz 1 0) \
$(usex zlib "--with-zlib=1" "") \
--with-exec-rel-paths=$(usex exec-rel-paths 1 0) \
--with-th1-docs=$(usex th1-docs 1 0) \
--with-th1-hooks=$(usex th1-hooks 1 0) \
--with-tcl=$(usex tcl 1 0) \
--with-tcl-stubs=$(usex tcl-stubs 1 0) \
--with-tcl-private-stubs=$(usex tcl-private-stubs 1 0) \
--with-mman=$(usex mman 1 0) \
--with-see=$(usex see 1 0) \
--print-minimum-sqlite-version=$(usex print-minimum-sqlite-version 1 0) \
--internal-sqlite=$(usex internal-sqlite 1 0) \
--static=$(usex static 1 0) \
--fusefs=$(usex fusefs 1 0) \
--fossil-debug=$(usex debug 1 0) \
--no-opt=$(usex no-opt 1 0) \
--json=$(usex json 1 0)"
	tc-export CC
	echo "./configure ${myconf}"
	./configure ${myconf} || die
}

src_install() {
	dobin fossil
}