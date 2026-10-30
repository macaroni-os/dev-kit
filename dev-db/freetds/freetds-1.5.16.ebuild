# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit autotools

DESCRIPTION="Tabular DataStream Library"
HOMEPAGE="https://www.freetds.org/"
SRC_URI="https://github.com/FreeTDS/freetds/releases/download/v1.5.16/freetds-1.5.16.tar.bz2 -> freetds-1.5.16.tar.bz2"
LICENSE="GPL-2+ LGPL-2+"
SLOT="0"
KEYWORDS="*"
DOCS=(
	NEWS.md
	README.md
)
IUSE="debug gnutls iconv iodbc kerberos mssql odbc ssl static-libs"
REQUIRED_USE="?? ( iodbc odbc )"
RESTRICT="test"
BDEPEND="virtual/pkgconfig
	
"
RDEPEND="gnutls? ( net-libs/gnutls:= )
	iconv? ( virtual/libiconv )
	iodbc? ( dev-db/libiodbc )
	kerberos? ( virtual/krb5 )
	odbc? ( dev-db/unixODBC )
	ssl? ( dev-libs/openssl:= )
	
"
DEPEND="${RDEPEND}
"
src_configure() {
	econf \
		--enable-shared \
		$(use_enable debug) \
		$(use_enable iconv libiconv) \
		$(use_enable kerberos krb5) \
		$(use_enable mssql msdblib) \
		$(use_enable static-libs static) \
		$(use_with gnutls) \
		$(use_with iodbc) \
		$(use_with iconv libiconv-prefix "/usr") \
		$(use_with odbc unixodbc "/usr") \
		$(use_with ssl openssl "/usr")
}

src_install() {
	default
	find "${ED}" -name '*.la' -delete || die
}


# vim: filetype=ebuild
