# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
CMAKE_MAKEFILE_GENERATOR="emake"
CMAKE_REMOVE_MODULES_LIST=( nonde )
SITEFILE="50${PN}-mark.el"
inherit bash-completion-r1 cmake elisp-common flag-o-matic multiprocessing toolchain-funcs xdg-utils

DESCRIPTION="Mirror of CMake upstream repository"
HOMEPAGE="https://gitlab.kitware.com/cmake/cmake"
SRC_URI="https://api.github.com/repos/Kitware/CMake/tarball/v3.31.9 -> cmake-3.31.9-622044c.tar.gz"
LICENSE="BSD-3-Clause"
SLOT="0"
KEYWORDS="*"
PATCHES=(
	"${FILESDIR}/cmake-3.27.0_rc1-0002-Set-some-proper-paths-to-make-cmake-find-our-tools.patch"
	"${FILESDIR}/cmake-3.31.6-Prefer-pkgconfig-in-FindBLAS.patch"
	"${FILESDIR}/cmake-3.27.0_rc1-0004-Ensure-that-the-correct-version-of-Qt-is-always-used.patch"
	"${FILESDIR}/cmake-3.27.0_rc1-0005-Respect-Gentoo-s-Python-eclasses.patch"
	"${FILESDIR}/cmake-3.30.3-cudahostld.patch"
	"${FILESDIR}/cmake-3.31.7-hdf5.patch"
)
IUSE="doc emacs ncurses qt"
BDEPEND="doc? (
	  dev-python/requests
	  dev-python/sphinx
	)
	
"
RDEPEND=">=app-arch/libarchive-3.3.3:=
	app-crypt/rhash
	>=dev-libs/expat-2.0.1
	>=dev-libs/jsoncpp-1.9.2-r2:0=
	>=dev-libs/libuv-1.10.0:=
	>=net-misc/curl-7.21.5[ssl]
	sys-libs/zlib
	virtual/pkgconfig
	emacs? ( >=app-editors/emacs-23.1:* )
	ncurses? ( sys-libs/ncurses:0= )
	qt? (
	  || (
	    dev-qt/qtbase:5[gui]
	    dev-qt/qtbase:6[gui]
	  )
	)
	
"
DEPEND="${RDEPEND}
"

post_src_unpack() {
	mv Kitware-CMake-* ${S}
}


cmake_src_bootstrap() {
	# disable running of cmake in bootstrap command
	sed -i \
	  -e '/"${cmake_bootstrap_dir}\/cmake"/s/^/#DONOTRUN /' \
	  bootstrap || die "sed failed"
	# bootstrap script isn't exactly /bin/sh compatible
	tc-env_build ${CONFIG_SHELL:-sh} ./bootstrap \
	  --prefix="${T}/cmakestrap/" \
	  --parallel=$(makeopts_jobs "${MAKEOPTS}" "$(get_nproc)") \
	  || die "Bootstrap failed"
}
src_prepare() {
	cmake_src_prepare
	# Add gcc libs to the default link paths
	sed -i \
	  -e "s|@GENTOO_PORTAGE_GCCLIBDIR@|${EPREFIX}/usr/${CHOST}/lib/|g" \
	  -e "$(usex prefix-guest "s|@GENTOO_HOST@||" "/@GENTOO_HOST@/d")" \
	  -e "s|@GENTOO_PORTAGE_EPREFIX@|${EPREFIX}/|g" \
	  Modules/Platform/{UnixPaths,Darwin}.cmake || die "sed failed"
	if ! has_version -b \>=${CATEGORY}/${PN}-3.13 || ! cmake --version &>/dev/null ; then
	  CMAKE_BINARY="${S}/Bootstrap.cmk/cmake"
	  cmake_src_bootstrap
	fi
}
src_configure() {
	# ODR warnings, bug #858335
	# https://gitlab.kitware.com/cmake/cmake/-/issues/20740
	filter-flags '-flto*' -fwhole-program-vtables '-fsanitize=cfi*' || die
	 local mycmakeargs=(
	-DCMAKE_USE_SYSTEM_LIBRARIES=ON
	-DCMake_ENABLE_DEBUGGER=no
	-DCMAKE_DOC_DIR=/share/doc/${PF}
	-DCMAKE_MAN_DIR=/share/man
	-DCMAKE_DATA_DIR=/share/${PN}
	-DSPHINX_MAN=$(usex doc)
	-DSPHINX_HTML=$(usex doc)
	-DBUILD_CursesDialog="$(usex ncurses)"
	-DBUILD_TESTING=no
	)
	use qt && mycmakeargs+=( -DBUILD_QtDialog=ON )
	 cmake_src_configure
}
src_install() {
	cmake_src_install
	 if use emacs; then
	  elisp-install ${PN} Auxiliary/cmake-mode.el Auxiliary/cmake-mode.elc
	  elisp-site-file-install "${FILESDIR}/${SITEFILE}"
	fi
	 insinto /usr/share/vim/vimfiles/syntax
	doins Auxiliary/vim/syntax/cmake.vim
	 insinto /usr/share/vim/vimfiles/indent
	doins Auxiliary/vim/indent/cmake.vim
	 insinto /usr/share/vim/vimfiles/ftdetect
	doins "${FILESDIR}/${PN}.vim"
	 dobashcomp Auxiliary/bash-completion/{${PN},ctest,cpack}
}

pkg_postinst() {
	use emacs && elisp-site-regen
	 if use qt; then
	  xdg_icon_cache_update
	  xdg_desktop_database_update
	  xdg_mimeinfo_database_update
	fi
}

pkg_postrm() {
	use emacs && elisp-site-regen
	 if use qt; then
	  xdg_icon_cache_update
	  xdg_desktop_database_update
	  xdg_mimeinfo_database_update
	fi
}



# vim: filetype=ebuild
