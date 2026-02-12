# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit toolchain-funcs

DESCRIPTION="remove #ifdef ed lines from a file while otherwise leaving the file alone"
HOMEPAGE="https://dotat.at/prog/unifdef/"
SRC_URI="https://dotat.at/prog/unifdef/unifdef-2.12.tar.xz -> unifdef-2.12.tar.xz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="*"
DOCS=(
	README
)
src_prepare() {
	sed -i "/^prefix/s:=.*:=${EPREFIX}/usr:" Makefile || die
	tc-export CC
	default
}


# vim: filetype=ebuild
