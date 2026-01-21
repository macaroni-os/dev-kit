# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
PYTHON_COMPAT=( python3+ )
DISTUTILS_USE_SETUPTOOLS="rdepend"
inherit bash-completion-r1 distutils-r1 toolchain-funcs

DESCRIPTION="The Meson Build System"
HOMEPAGE="http://mesonbuild.com"
SRC_URI="https://api.github.com/repos/mesonbuild/meson/tarball/1.8.5 -> meson-1.8.5-bc21dd2.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"

post_src_unpack() {
	mv mesonbuild-meson-* ${S}
}


python_install_all() {
	distutils-r1_python_install_all
	insinto /usr/share/vim/vimfiles
	doins -r data/syntax-highlighting/vim/{ftdetect,indent,syntax}
	insinto /usr/share/zsh/site-functions
	doins data/shell-completions/zsh/_meson
}



# vim: filetype=ebuild
