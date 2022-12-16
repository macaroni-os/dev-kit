# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="C++ functions matching the interface and behavior of python string methods"
HOMEPAGE="https://github.com/imageworks/pystring"
SRC_URI="https://github.com/imageworks/pystring/archive/7d16bc814ccb4cad03c300dcb77440034caa84f7.tar.gz -> pystring-1.1.4_p20220927.tar.gz"

BDEPEND="
	virtual/libc
	sys-devel/libtool
"
RESTRICT="test"

KEYWORDS="*"
LICENSE="BSD"
SLOT="0"

PATCHES=(
	# Patch to convert the project into cmake. Taken from:
	# https://github.com/imageworks/pystring/pull/29
	"${FILESDIR}/cmake.patch"
)

src_unpack() {
	default
	rm -rf "${S}"
	mv "${WORKDIR}"/pystring-* "${S}" || die
}