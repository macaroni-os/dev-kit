# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools flag-o-matic

DESCRIPTION="Tecla command-line editing library"
HOMEPAGE="http://www.astro.caltech.edu/~mcs/tecla/"
SRC_URI="https://sites.astro.caltech.edu/~mcs/tecla/libtecla-1.6.3.tar.gz -> libtecla-1.6.3.tar.gz"

LICENSE="icu"
SLOT="0"
KEYWORDS="*"
IUSE="static-libs"

DEPEND="sys-libs/ncurses:="
RDEPEND="${DEPEND}"
PATCHES=(
	"${FILESDIR}"/"${PN}-1.6.1-install.patch"
	"${FILESDIR}"/"${PN}-1.6.1-no-strip.patch"
	"${FILESDIR}"/"${PN}-1.6.3-ldflags.patch"
	"${FILESDIR}"/"${PN}-1.6.3-prll-build.patch"
	"${FILESDIR}"/"${PN}-1.6.1-prll-install.patch"
	"${FILESDIR}"/"${PN}-1.6.3-static-libs.patch"
	"${FILESDIR}"/"${PN}-1.6.3-secure-runpath.patch"
)

post_src_unpack() {
	if [ ! -d "${WORKDIR}/${S}" ]; then
		mv "${WORKDIR}"/* "${S}" || die
	fi
}

src_prepare() {
	default
	mv configure.in configure.ac || die
	eautoreconf
}

src_configure() {
	econf $(use_enable static-libs)
}

src_compile() {
	emake \
		OPT="" \
		LDFLAGS="${LDFLAGS}" \
		LFLAGS="$(raw-ldflags)"
}