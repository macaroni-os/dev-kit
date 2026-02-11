# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake flag-o-matic prefix

DESCRIPTION="Validating XML parser written in a portable subset of C++"
HOMEPAGE="https://xerces.apache.org/xerces-c/"
SRC_URI="https://archive.apache.org/dist/xerces/c/3/sources/xerces-c-3.3.0.tar.xz -> xerces-c-3.3.0.tar.xz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"
PATCHES=(
	"${FILESDIR}/xerces-c-3.2.4-strict-aliasing.patch"
	"${FILESDIR}/xerces-c-3.2.5-cxx17.patch"
	"${FILESDIR}/xerces-c-3.3.0-symbol-name.patch"
)
DOCS=(
	CREDITS
	KEYS
	NOTICE
	README
)
IUSE="cpu_flags_x86_sse2 curl doc examples iconv icu static-libs threads"
BDEPEND="doc? ( app-text/doxygen )
	
"
RDEPEND="curl? ( net-misc/curl )
	icu? ( dev-libs/icu:0= )
	virtual/libiconv
	
"
DEPEND="${RDEPEND}
"
pkg_setup() {
	export ICUROOT="${EPREFIX}/usr"
	 if use iconv && use icu; then
	  ewarn "This package can use iconv or icu for loading messages"
	  ewarn "and transcoding, but not both. ICU takes precedence."
	fi
}

src_configure() {
	# bug #856100
	filter-lto
	append-flags -fno-strict-aliasing
	 # 'cfurl' is only available on OSX and 'socket' isn't supposed to work.
	# But the docs aren't clear about it, so we would need some testing...
	local netaccessor
	if use curl; then
	  netaccessor="curl"
	else
	  netaccessor="socket"
	fi
	 local msgloader
	if use icu; then
	  msgloader="icu"
	elif use iconv; then
	  msgloader="iconv"
	else
	  msgloader="inmemory"
	fi
	 local transcoder
	if use icu; then
	  transcoder="icu"
	else
	  transcoder="gnuiconv"
	fi
	 local mycmakeargs=(
	  -DCMAKE_INSTALL_DOCDIR="${EPREFIX}/usr/share/doc/${PF}"
	  -Dnetwork-accessor="${netaccessor}"
	  -Dmessage-loader="${msgloader}"
	  -Dtranscoder="${transcoder}"
	  -Dthreads:BOOL="$(usex threads)"
	  -Dsse2:BOOL="$(usex cpu_flags_x86_sse2)"
	)
	 cmake_src_configure
}

src_compile() {
	cmake_src_compile
	 use doc && cmake_build doc-style createapidocs doc-xml
}

src_install() {
	cmake_src_install
	 # package provides .pc files
	find "${D}" -name '*.la' -delete || die
	 if use examples; then
	  # clean out object files, executables, Makefiles
	  # and the like before installing examples
	  find samples/ \( -type f -executable -o -iname 'runConfigure' -o -iname '*.o' \
	    -o -iname '.libs' -o -iname 'Makefile*' \) -exec rm -rf '{}' + || die
	  docinto examples
	  dodoc -r samples/.
	  docompress -x /usr/share/doc/${PF}/examples
	fi
	 # To make sure an appropriate NLS msg file is around when using
	# the iconv msgloader ICU has the messages compiled in.
	if use iconv && ! use icu; then
	  doenvd "$(prefixify_ro "${FILESDIR}/50xerces-c")"
	fi
}


# vim: filetype=ebuild
