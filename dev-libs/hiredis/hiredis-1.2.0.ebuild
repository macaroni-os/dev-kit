# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit toolchain-funcs

DESCRIPTION="Minimalistic C client library for the Redis database"
HOMEPAGE="https://github.com/redis/hiredis"
SRC_URI="https://github.com/redis/hiredis/tarball/60e5075d4ac77424809f855ba3e398df7aacefe8 -> hiredis-1.2.0-60e5075.tar.gz"

LICENSE="BSD"
SLOT="0/1.2.013"
KEYWORDS="*"
IUSE="examples static-libs test"

DEPEND="test? ( dev-db/redis )"

PATCHES=(
	"${FILESDIR}"/${PN}-1.0.0-disable-network-tests.patch
)

post_src_unpack() {
        if [ ! -d "${S}" ]; then
                mv redis-hiredis* "${S}" || die
        fi
}

src_prepare() {
	default

	# use GNU ld syntax on Solaris
	sed -i -e '/DYLIB_MAKE_CMD=.* -G/d' Makefile || die
}

_build() {
	emake \
		AR="$(tc-getAR)" \
		CC="$(tc-getCC)" \
		PREFIX="${EPREFIX%/}/usr" \
		LIBRARY_PATH="$(get_libdir)" \
		ARCH= \
		DEBUG= \
		OPTIMIZATION="${CPPFLAGS}" \
		"$@"
}

src_compile() {
	# The static lib re-uses the same objects as the shared lib, so
	# overhead is low w/creating it all the time.  It's also needed
	# by the tests.
	_build dynamic static hiredis.pc
}

src_test() {
	local REDIS_PID="${T}"/hiredis.pid
	local REDIS_SOCK="${T}"/hiredis.sock
	local REDIS_PORT=56379
	local REDIS_TEST_CONFIG="daemonize yes
		pidfile ${REDIS_PID}
		port ${REDIS_PORT}
		bind 127.0.0.1
		unixsocket //${REDIS_SOCK}"

	_build hiredis-test

	/usr/sbin/redis-server - <<< "${REDIS_TEST_CONFIG}" || die
	./hiredis-test -h 127.0.0.1 -p ${REDIS_PID} -s ${REDIS_SOCK}
	local ret=$?

	kill "$(<"${REDIS_PID}")" || die
	[ ${ret} != "0" ] && die "tests failed"
}

src_install() {
	_build PREFIX="${ED%/}/usr" install
	if use static-libs; then
		rm "${ED%/}/usr/$(get_libdir)/libhiredis.a" || die
	fi

	insinto /usr/$(get_libdir)/pkgconfig
	doins ${PN}.pc

	local DOCS=( CHANGELOG.md README.md )
	use examples && DOCS+=( examples )
	einstalldocs
}