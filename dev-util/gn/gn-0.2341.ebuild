# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
PYTHON_COMPAT=( python3+ )
inherit ninja-utils python-any-r1 toolchain-funcs

DESCRIPTION="GN is a meta-build system that generates build files for Ninja"
HOMEPAGE="https://gn.googlesource.com/"
SRC_URI="https://gn.googlesource.com/gn/%2Barchive/d8c2f07d653520568da7cace755a87dad241b72d.tar.gz -> gn-0.2341-d8c2f07.tar.gz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="*"
BDEPEND="${PYTHON_DEPS}
	dev-util/ninja
	
"
src_unpack() {
	mkdir "${S}"
	cd "${S}"
	unpack "${A}"
}
pkg_setup() {
	:
}
src_configure() {
	mkdir out/
	cp "${FILESDIR}"/last_commit_position.h out/
	sed -i \
	  -e 's|PV|0.2341|g' \
	  -e 's|SHA|macaroni-d8c2f07|g' \
	  out/last_commit_position.h
	python_setup
	tc-export AR CC CXX
	unset CFLAGS
	set -- ${EPYTHON} build/gen.py --no-last-commit-position --no-strip --no-static-libstdc++ --allow-warnings
	echo "$@" >&2
	"$@" || die
}
src_compile() {
	eninja -C out gn
}
src_install() {
	dobin out/gn
	einstalldocs
	insinto /usr/share/vim/vimfiles
	doins -r misc/vim/{autoload,ftdetect,ftplugin,syntax}
}


# vim: filetype=ebuild
