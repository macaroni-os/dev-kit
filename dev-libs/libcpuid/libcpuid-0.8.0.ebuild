# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="A small C library for x86 (and x86_64) CPU detection and feature extraction"
HOMEPAGE="http://libcpuid.sourceforge.net/"
SRC_URI="https://github.com/anrieff/libcpuid/tarball/5bb7c32618fb50178462c791f649516ae6a17193 -> libcpuid-0.8.0-5bb7c32.tar.gz"
LICENSE="BSD-2"
SLOT="0/18"
KEYWORDS="*"
IUSE="static-libs"
S="${WORKDIR}/anrieff-libcpuid-5bb7c32"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf "$(use_enable static-libs static)"
}

src_install() {
	default
	find "${ED}" -name "*.la" -delete || die
}