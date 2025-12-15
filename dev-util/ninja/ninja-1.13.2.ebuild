# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
PYTHON_COMPAT=( python3+ )
inherit bash-completion-r1 elisp-common python-any-r1 toolchain-funcs

DESCRIPTION="a small build system with a focus on speed"
HOMEPAGE="https://ninja-build.org/"
SRC_URI="https://api.github.com/repos/ninja-build/ninja/tarball/v1.13.2 -> ninja-1.13.2-3441b63.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"
IUSE="doc emacs vim-syntax"
BDEPEND="${PYTHON_DEPS}
	dev-util/re2c
	doc? (
	  app-text/asciidoc
	  app-doc/doxygen
	  dev-libs/libxslt
	)
	
"
RDEPEND="emacs? ( virtual/emacs )
	vim-syntax? (
	  || (
	    app-editors/vim
	    app-editors/gvim
	  )
	)
	
"

post_src_unpack() {
	mv ninja-build-ninja-* ${S}
}


run_for_build() {
	if tc-is-cross-compiler; then
	  local -x AR=$(tc-getBUILD_AR)
	  local -x CXX=$(tc-getBUILD_CXX)
	  local -x CFLAGS=
	  local -x CXXFLAGS=${BUILD_CXXFLAGS}
	  local -x LDFLAGS=${BUILD_LDFLAGS}
	fi
	echo "$@" >&2
	"$@"
}
src_compile() {
	tc-export AR CXX
	# configure.py uses CFLAGS instead of CXXFLAGS
	export CFLAGS=${CXXFLAGS}
	run_for_build ${EPYTHON} configure.py --bootstrap --verbose || die
	if tc-is-cross-compiler; then
	  mv ninja ninja-build || die
	  ${EPYTHON} configure.py || die
	  ./ninja-build -v ninja || die
	else
	  ln ninja ninja-build || die
	fi
	if use doc; then
	  ./ninja-build -v doxygen manual || die
	fi
	if use emacs; then
	  elisp-compile misc/ninja-mode.el || die
	fi
}
src_install() {
	dodoc README.md
	if use doc; then
	  docinto html
	  dodoc -r doc/doxygen/html/.
	  dodoc doc/manual.html
	fi
	dobin ninja
	newbashcomp misc/bash-completion "${PN}"
	if use vim-syntax; then
	  insinto /usr/share/vim/vimfiles/syntax/
	  doins misc/ninja.vim
	  echo 'au BufNewFile,BufRead *.ninja set ft=ninja' > "${T}/ninja.vim"
	  insinto /usr/share/vim/vimfiles/ftdetect
	  doins "${T}/ninja.vim"
	fi
	insinto /usr/share/zsh/site-functions
	newins misc/zsh-completion _ninja
	if use emacs; then
	  cd misc || die
	  elisp-install ninja ninja-mode.el* || die
	fi
}
pkg_postinst() {
	use emacs && elisp-site-regen
}
pkg_postrm() {
	use emacs && elisp-site-regen
}



# vim: filetype=ebuild
