# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit go-module

DESCRIPTION="Sloc, Cloc and Code: scc is a very fast accurate code counter with complexity calculations and COCOMO estimates written in pure Go"
HOMEPAGE="https://github.com/boyter/scc"
SRC_URI="https://api.github.com/repos/boyter/scc/tarball/v3.7.0 -> scc-3.7.0-74d4df2.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
DOCS=(
	README.md
	CONTRIBUTING.md
)
BDEPEND="dev-lang/go
"

post_src_unpack() {
	mv boyter-scc-* ${S}
}


src_compile() {
	go build -x -v -mod=vendor -o scc main.go
}
src_install() {
	dobin scc
	einstalldocs
}



# vim: filetype=ebuild
