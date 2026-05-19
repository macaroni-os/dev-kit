# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake-utils flag-o-matic

DESCRIPTION="C client library for MariaDB/MySQL"
HOMEPAGE="http://www.mysql.com/"
SRC_URI="https://api.github.com/repos/mysql/mysql-server/tarball/refs/tags/mysql-8.4.9 -> mysql-connector-c-8.4.9-f9c8813.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
DOCS=(
	README
)
IUSE="ldap static-libs"
RDEPEND="sys-libs/zlib:=
	ldap? ( dev-libs/cyrus-sasl:= )
	dev-libs/openssl:=
	
"
DEPEND="${RDEPEND}
"
S="${WORKDIR}/mysql-8.4.9"

post_src_unpack() {
	mv mysql-mysql-server-* ${S}
}


src_prepare() {
	sed -i -e 's/CLIENT_LIBS/CONFIG_CLIENT_LIBS/' "${S}/scripts/CMakeLists.txt" || die
	# All these are for the server only
	sed -i \
	  -e '/MYSQL_CHECK_LIBEVENT/d' \
	  -e '/MYSQL_CHECK_RAPIDJSON/d' \
	  -e '/MYSQL_CHECK_ICU/d' \
	  -e '/MYSQL_CHECK_RE2/d' \
	  -e '/MYSQL_CHECK_LZ4/d' \
	  -e '/MYSQL_CHECK_EDITLINE/d' \
	  -e '/MYSQL_CHECK_CURL/d' \
	  -e '/ADD_SUBDIRECTORY(man)/d' \
	  -e '/ADD_SUBDIRECTORY(share)/d' \
	  -e '/INCLUDE(cmake\/boost/d' \
	  CMakeLists.txt || die
	# Skip building clients
	echo > client/CMakeLists.txt || die
	# Forcefully disable auth plugin
	if ! use ldap ; then
	  sed -i -e '/MYSQL_CHECK_SASL/d' CMakeLists.txt || die
	  echo > libmysql/authentication_ldap/CMakeLists.txt || die
	fi
	cmake-utils_src_prepare
}
src_configure() {
	local mycmakeargs=(
	  -DINSTALL_LAYOUT=RPM
	  -DINSTALL_LIBDIR=$(get_libdir)
	  -DWITH_DEFAULT_COMPILER_OPTIONS=OFF
	  -DWITH_DEFAULT_FEATURE_SET=OFF
	  -DENABLED_LOCAL_INFILE=ON
	  -DMYSQL_UNIX_ADDR="/run/mysqld/mysqld.sock"
	  -DWITH_ZLIB=system
	  -DWITH_SSL=system
	  -DLIBMYSQL_OS_OUTPUT_NAME=mysqlclient
	  -DSHARED_LIB_PATCH_VERSION="0"
	  -DCMAKE_POSITION_INDEPENDENT_CODE=ON
	  -DWITHOUT_SERVER=ON
	)
	append-cxxflags -std=gnu++20
	cmake-utils_src_configure
}
src_install() {
	cmake-utils_src_install
	if ! use static-libs ; then
	  find "${ED}" -name "*.a" -delete || die
	fi
}



# vim: filetype=ebuild
