# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake flag-o-matic

DESCRIPTION="A C library for reading, creating, and modifying zip archives."
HOMEPAGE="https://libzip.org/"
SRC_URI="https://api.github.com/repos/nih-at/libzip/tarball/v1.11.4 -> libzip-1.11.4-6f8a0cd.tar.gz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="*"
IUSE="bzip2 gnutls lzma mbedtls ssl tools zstd"
RDEPEND="sys-libs/zlib
	bzip2? ( app-arch/bzip2:= )
	lzma? ( app-arch/xz-utils )
	ssl? (
	  gnutls? (
	    dev-libs/nettle:=
	    net-libs/gnutls:=
	  )
	  !gnutls? (
	    mbedtls? ( net-libs/mbedtls:= )
	    !mbedtls? ( dev-libs/openssl:= )
	  )
	)
	zstd? ( app-arch/zstd:= )
	
"
DEPEND="${RDEPEND}
"

post_src_unpack() {
	mv nih-at-libzip-* ${S}
}


src_prepare() {
	rm -r examples/cmake-project || die
	cmake_src_prepare
}
src_configure() {
	append-lfs-flags
	local mycmakeargs=(
	  -DBUILD_DOC=ON
	  -DBUILD_OSSFUZZ=OFF
	  -DBUILD_REGRESS=OFF
	  -DBUILD_EXAMPLES=OFF # nothing is installed
	  -DENABLE_COMMONCRYPTO=OFF # not in tree
	  -DENABLE_BZIP2=$(usex bzip2)
	  -DENABLE_LZMA=$(usex lzma)
	  -DENABLE_ZSTD=$(usex zstd)
	  -DBUILD_TOOLS=$(usex tools)
	)
	 if use ssl; then
	  if use gnutls; then
	    mycmakeargs+=(
	      -DENABLE_GNUTLS=$(usex gnutls)
	      -DENABLE_MBEDTLS=OFF
	      -DENABLE_OPENSSL=OFF
	    )
	  elif use mbedtls; then
	    mycmakeargs+=(
	      -DENABLE_GNUTLS=OFF
	      -DENABLE_MBEDTLS=$(usex mbedtls)
	      -DENABLE_OPENSSL=OFF
	    )
	  else
	    mycmakeargs+=(
	      -DENABLE_GNUTLS=OFF
	      -DENABLE_MBEDTLS=OFF
	      -DENABLE_OPENSSL=ON
	    )
	  fi
	else
	  mycmakeargs+=(
	    -DENABLE_GNUTLS=OFF
	    -DENABLE_MBEDTLS=OFF
	    -DENABLE_OPENSSL=OFF
	  )
	fi
	cmake_src_configure
}



# vim: filetype=ebuild
