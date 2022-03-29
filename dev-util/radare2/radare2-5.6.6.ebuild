# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1 eutils toolchain-funcs

DESCRIPTION="unix-like reverse engineering framework and commandline tools"
HOMEPAGE="http://www.radare.org"
SRC_URI=" 
	test? ( https://github.com/radareorg/radare2-testbins/tarball/1b0474836cd6eac34f1044006e94fd58f4b7aee7 -> radare2-testbins-20220329-1b04748.tar.gz )
	https://github.com/radareorg/radare2/tarball/50b8813f1df7fbae3bbcb0e8d04397cd353d4759 -> radare2-5.6.6-50b8813.tar.gz
	https://github.com/radareorg/vector35-arch-arm64/tarball/3c5eaba46dab72ecb7d5f5b865a13fdeee95b464 -> radare2-vector35-arch-arm64-20211019-3c5eaba.tar.gz
	https://github.com/radareorg/vector35-arch-armv7/tarball/dde39f69ffea19fc37e681874b12cb4707bc4f30 -> radare2-vector35-arch-armv7-20211026-dde39f6.tar.gz"

LICENSE="GPL-2"

KEYWORDS="*"
SLOT="0"
IUSE="ssl libressl test"

RDEPEND="
	dev-libs/libzip
	dev-libs/xxhash
	sys-apps/file
	sys-libs/zlib
	dev-libs/capstone:0=
	ssl? (
		!libressl? ( dev-libs/openssl:0= )
		libressl? ( dev-libs/libressl:0= )
	)
"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"


post_src_unpack() {
	if [ ! -d "${S}" ]; then
		mv radareorg-radare2* "${S}" || die
	fi

	mv radareorg-vector35-arch-arm64-* "${S}/libr/asm/arch/arm/v35arm64/arch-arm64" || die
	mv radareorg-vector35-arch-armv7-* "${S}/libr/asm/arch/arm/v35arm64/arch-armv7" || die

	if use test; then
		cp -r radare2-testbins-* "${S}/test/bins" || die
		cp -r radare2-testbins-* "${S}" || die
	fi

}

src_prepare() {
	# Fix hardcoded docdir for fortunes
	sed -i -e "/^#define R2_FORTUNES/s/radare2/$PF/" \
		libr/include/r_userconf.h.acr

	default
}

src_configure() {
	# Ideally these should be set by ./configure
	tc-export CC AR LD OBJCOPY RANLIB
	export HOST_CC=${CC}

	econf \
		--without-libuv \
		--with-syscapstone \
		--with-sysmagic \
		--with-sysxxhash \
		--with-syszip \
		$(use_with ssl openssl)
}

src_install() {
	default

	insinto /usr/share/zsh/site-functions
	doins doc/zsh/_*

	newbashcomp doc/bash_autocompletion.sh "${PN}"
	bashcomp_alias "${PN}" rafind2 r2 rabin2 rasm2 radiff2

	# a workaround for unstable $(INSTALL) call, bug #574866
	local d
	for d in doc/*; do
		if [[ -d $d ]]; then
			rm -rfv "$d" || die "failed to delete '$d'"
		fi
	done

	# These are not really docs. radare assumes
	# uncompressed files: bug #761250
	docompress -x /usr/share/doc/${PF}/fortunes.{creepy,fun,nsfw,tips}
}