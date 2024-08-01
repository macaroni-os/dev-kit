# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern ls with a lot of pretty colors and awesome icons"
HOMEPAGE="https://github.com/lsd-rs/lsd"
SRC_URI="https://github.com/lsd-rs/lsd/tarball/0e70dbdb7ae99b409130820bfea383ce8fca7492 -> lsd-1.1.2-0e70dbd.tar.gz
https://distfiles.macaronios.org/72/2a/f8/722af8b16faea676a777ef96f85fea878c1dce0ddb9824e13823ba90d9b4fda1bd90c15cfd7f33f17ae6225cad6499b0b3e799fe75e57fa13f4e071b26fd7c9b -> lsd-1.1.2-funtoo-crates-bundle-a732516cc1607bd8673ee9620663a94f66d2a765985118ea77254fd5893551afc2ff03ad067dac42e1b4af4785775d12b756b3d850a535b12789e2ca5213bf2e.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"
IUSE="+git"

DEPEND=""
RDEPEND=""
BDEPEND=">=virtual/rust-1.31.0"

QA_FLAGS_IGNORED="/usr/bin/lsd"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/lsd-rs-lsd-* ${S} || die
}

src_install() {
	cargo_src_install
	einstalldocs
}