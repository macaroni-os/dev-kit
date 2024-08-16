# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Asynchronous Network C++ Library"
HOMEPAGE="https://think-async.com https://github.com/chriskohlhoff/asio"
SRC_URI="mirror://sourceforge/${PN}/${PN}/${P}.tar.bz2"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="*"
IUSE="doc examples libressl ssl test"

RDEPEND="dev-libs/boost
	ssl? (
		!libressl? ( dev-libs/openssl:0= )
		libressl? ( dev-libs/libressl:0= )
	)"
DEPEND="${RDEPEND}"

src_prepare() {
	default

	if ! use test; then
		# Don't build nor install any examples or unittests
		# since we don't have a script to run them
		cat > src/Makefile.in <<-EOF || die
			all:

			install:

			clean:
		EOF
	fi
}

src_install() {
	use doc && local HTML_DOCS=( doc/. )
	default

	if use examples; then
		# Get rid of the object files
		emake clean
		dodoc -r src/examples
		docompress -x /usr/share/doc/${PF}/examples
	fi
}
