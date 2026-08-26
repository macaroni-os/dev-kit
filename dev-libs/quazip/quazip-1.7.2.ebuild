# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Simple C++ wrapper over Gilles Vollant's ZIP/UNZIP package"
HOMEPAGE="https://stachenov.github.io/quazip/"
SRC_URI="https://api.github.com/repos/stachenov/quazip/tarball/v1.7.2 -> quazip-1.7.2-3108956.tar.gz"
LICENSE="LGPL-2.1-with-linking-exception"
SLOT="0"
KEYWORDS="*"
IUSE="+bzip2 qt5 +qt6"
REQUIRED_USE="^^ ( qt5 qt6 )"
RDEPEND="sys-libs/zlib:=
	bzip2? ( app-arch/bzip2:= )
	qt5? ( dev-qt/qtcore:5 )
	qt6? (
	  dev-qt/qtbase:6
	  dev-qt/qt5compat:6
	)
	
"
DEPEND="${RDEPEND}
"

post_src_unpack() {
	mv stachenov-quazip-* ${S}
}


src_configure() {
	local mycmakeargs=(
	  -DQUAZIP_QT_MAJOR_VERSION=$(usex qt6 6 5)
	  -DQUAZIP_BZIP2=$(usex bzip2)
	  -DQUAZIP_ENABLE_TESTS=OFF
	  -DQUAZIP_ENABLE_QTEXTCODEC=ON
	  -DQUAZIP_INSTALL=ON
	  -DQUAZIP_USE_QT_ZLIB=OFF
	  -DQUAZIP_FETCH_LIBS=OFF
	  -DQUAZIP_FORCE_FETCH_LIBS=OFF
	)
	cmake_src_configure
}



# vim: filetype=ebuild
