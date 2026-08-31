# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit autotools

DESCRIPTION="Embeddable, replicated and fault tolerant SQL engine"
HOMEPAGE="https://dqlite.io"
SRC_URI="https://api.github.com/repos/canonical/dqlite/tarball/v1.18.6 -> dqlite-1.18.6-f6058ba.tar.gz"
LICENSE="LGPL-3-with-linking-exception"
SLOT="0"
KEYWORDS="*"
IUSE="+lz4"
BDEPEND="virtual/pkgconfig
	
"
RDEPEND="dev-db/sqlite:3
	dev-libs/libuv:=
	lz4? ( app-arch/lz4:= )
	
"
DEPEND="${RDEPEND}
"

post_src_unpack() {
	mv canonical-dqlite-* ${S}
}


src_prepare() {
	default
	sed -i -e '/Werror \\/d' -e 's|-Werror||g' configure.ac
	eautoreconf
}
src_configure() {
	  local myeconfargs=(
	      --disable-backtrace
	      --disable-debug
	      --disable-sanitize
	      --disable-static
	      # Linking to a separately-built libraft is no longer supported.
	      --enable-build-raft=yes
	      # Will build a bundled libsqlite3.so.
	      --enable-build-sqlite=no
	      $(use_with lz4)
	  )
	  econf "${myeconfargs[@]}"
}
src_install() {
	  default
	  find "${ED}" -name '*.la' -delete || die
}



# vim: filetype=ebuild
