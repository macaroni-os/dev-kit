# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3+ )

inherit ninja-utils python-any-r1 toolchain-funcs

DESCRIPTION="GN is a meta-build system that generates build files for Ninja"
HOMEPAGE="https://gn.googlesource.com/"
SRC_URI="https://distfiles.macaronios.org/f3/41/c7/f341c753dc80fdc945a70a7f7d736fd1c174c67aa387ee2b92b4c0e76b5a9d8831a54e55fc788789cea5d91132cb5a3edde72b0c56af1c7ab2e20a21b6ec2a1c -> gn-0.2192.tar.xz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="*"
S="${WORKDIR}/gn-0.2192"

BDEPEND="
	${PYTHON_DEPS}
	dev-util/ninja
"

pkg_setup() {
	:
}

src_configure() {
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