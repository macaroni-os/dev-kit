# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit go-module

DESCRIPTION="Swagger 2.0 implementation for go"
HOMEPAGE="https://goswagger.io"
SRC_URI="
https://api.github.com/repos/go-swagger/go-swagger/tarball/v0.34.1 -> go-swagger-0.34.1-e5c5fec.tar.gz
mirror://macaroni/go-swagger-0.34.1-mark-go-bundle-e5c5fec.tar.xz -> go-swagger-0.34.1-mark-go-bundle-e5c5fec.tar.xz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"
BDEPEND="dev-lang/go
"

post_src_unpack() {
	mv go-swagger-go-swagger-* ${S}
}


src_compile() {
	go build -x -v ./cmd/swagger
}
src_install() {
	dobin swagger
}



# vim: filetype=ebuild
