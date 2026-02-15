# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
PYTHON_COMPAT=( python3+ )
QA_EXECSTACK="usr/bin/grub-emu* usr/lib/grub/*"
QA_PRESTRIPPED="usr/lib/grub/.*"
QA_MULTILIB_PATHS="usr/lib/grub/.*"
QA_WX_LOAD="usr/lib/grub/*"
WANT_LIBTOOL=none
GRUB_ALL_PLATFORMS=( coreboot efi-32 efi-64 emu ieee1275 loongson
  multiboot qemu qemu-mips pc uboot xen xen-32 xen-pvh )

inherit bash-completion-r1 flag-o-matic multibuild optfeature toolchain-funcs autotools

DESCRIPTION="GNU GRUB boot loader"
HOMEPAGE="https://www.gnu.org/software/grub/"
SRC_URI="
https://ftp.gnu.org/gnu/grub//grub-2.14.tar.xz -> grub-2.14.tar.xz
fonts? ( https://ftp.gnu.org/gnu/unifont/unifont-15.0.06/unifont-15.0.06.pcf.gz -> unifont-15.0.06.pcf.gz )
themes? ( https://download.sourceforge.net/dejavu/dejavu-sans-ttf-2.37.zip -> dejavu-sans-ttf-2.37.zip )"
LICENSE="GPL-3+ BSD MIT fonts? ( GPL-2-with-font-exception ) themes? ( CC-BY-SA-3.0 BitstreamVera )"
SLOT="2"
KEYWORDS="*"
PATCHES=(
	"${FILESDIR}/grub-gfxpayload.patch"
	"${FILESDIR}/grub-2.02_beta2-KERNEL_GLOBS.patch"
	"${FILESDIR}/grub-2.06-test-words.patch"
	"${FILESDIR}/grub-2.06-binutils-2.36.patch"
	"${FILESDIR}/grub-ktype-macaroni.patch"
)
IUSE="device-mapper doc efiemu +fonts mount nls sdl +themes truetype libzfs
grub_platforms_coreboot grub_platforms_efi-32 grub_platforms_efi-64
grub_platforms_emu grub_platforms_ieee1275 grub_platforms_loongson
grub_platforms_multiboot grub_platforms_qemu grub_platforms_qemu-mips
grub_platforms_pc grub_platforms_uboot grub_platforms_xen grub_platforms_xen-32
grub_platforms_xen-pvh
"
REQUIRED_USE="grub_platforms_coreboot? ( fonts )
grub_platforms_qemu? ( fonts )
grub_platforms_ieee1275? ( fonts )
grub_platforms_loongson? ( fonts )
"
# Commons depends
CDEPEND="app-arch/xz-utils
	sys-libs/ncurses:0=
	grub_platforms_emu? (
	  sdl? ( media-libs/libsdl2 )
	)
	device-mapper? ( >=sys-fs/lvm2-2.02.45 )
	libzfs? ( sys-fs/zfs:= )
	mount? ( sys-fs/fuse:3 )
	truetype? ( media-libs/freetype:2= )
	ppc? ( >=sys-apps/ibm-powerpc-utils-1.3.5 )
	ppc64? ( >=sys-apps/ibm-powerpc-utils-1.3.5 )
	
"
BDEPEND="${PYTHON_DEPS}
	sys-devel/flex
	sys-devel/bison
	sys-apps/help2man
	sys-apps/texinfo
	fonts? (
	  media-libs/freetype:2
	  virtual/pkgconfig
	)
	themes? (
	  app-arch/unzip
	  media-libs/freetype:2
	  virtual/pkgconfig
	)
	truetype? ( virtual/pkgconfig )
	
"
RDEPEND="${CDEPEND}
	kernel_linux? (
	  grub_platforms_efi-32? ( sys-boot/efibootmgr )
	  grub_platforms_efi-64? ( sys-boot/efibootmgr )
	)
	nls? ( sys-devel/gettext )
	
"
DEPEND="${CDEPEND}
"
S="${WORKDIR}/${P%_*}"
pkg_setup() {
	:
}
src_prepare() {
	default
	export PYTHON=true
	 eautoreconf
	 # Avoid error due to extra_deps.lst missing from source tarball:
	#       make[3]: *** No rule to make target 'grub-core/extra_deps.lst', needed by 'syminfo.lst'.  Stop.
	echo "depends bli part_gpt" > grub-core/extra_deps.lst || die
}

grub_do() {
	multibuild_foreach_variant run_in_build_dir "$@"
}

grub_do_once() {
	multibuild_for_best_variant run_in_build_dir "$@"
}

grub_configure() {
	local platform
	 case ${MULTIBUILD_VARIANT} in
	  efi*) platform=efi ;;
	  xen-pvh) platform=xen_pvh ;;
	  xen*) platform=xen ;;
	  guessed) ;;
	  *) platform=${MULTIBUILD_VARIANT} ;;
	esac
	 case ${MULTIBUILD_VARIANT} in
	  *-32)
	    if [[ ${CTARGET:-${CHOST}} == x86_64* ]]; then
	      local CTARGET=i386
	    fi ;;
	  *-64)
	    if [[ ${CTARGET:-${CHOST}} == i?86* ]]; then
	      local CTARGET=x86_64
	      local -x TARGET_CFLAGS="-Os -march=x86-64 ${TARGET_CFLAGS}"
	      local -x TARGET_CPPFLAGS="-march=x86-64 ${TARGET_CPPFLAGS}"
	    fi ;;
	esac
	 local myeconfargs=(
	  --disable-werror
	  --program-prefix=
	  --libdir="${EPREFIX}"/usr/lib
	  $(use_enable device-mapper)
	  $(use_enable mount grub-mount)
	  $(use_enable nls)
	  $(use_enable themes grub-themes)
	  $(use_enable truetype grub-mkfont)
	  $(use_enable libzfs)
	  --enable-grub-emu-sdl=no
	  $(use_enable sdl grub-emu-sdl2)
	  ${platform:+--with-platform=}${platform}
	   # Let configure detect this where supported
	  $(usex efiemu '' '--disable-efiemu')
	)
	 local UNIFONT="unifont-15.0.06"
	local DEJAVU="dejavu-sans-ttf-2.37"
	 if use fonts; then
	  ln -rs "${WORKDIR}/${UNIFONT}.pcf" unifont.pcf || die
	fi
	 if use themes; then
	  ln -rs "${WORKDIR}/${DEJAVU}/ttf/DejaVuSans.ttf" DejaVuSans.ttf || die
	fi
	 local ECONF_SOURCE="${S}"
	econf "${myeconfargs[@]}"
}

src_configure() {
	# Bug 508758.
	replace-flags -O3 -O2
	 # Workaround for bug 829165.
	filter-ldflags -pie
	 # We don't want to leak flags onto boot code.
	export HOST_CCASFLAGS=${CCASFLAGS}
	export HOST_CFLAGS=${CFLAGS}
	export HOST_CPPFLAGS=${CPPFLAGS}
	export HOST_LDFLAGS=${LDFLAGS}
	unset CCASFLAGS CFLAGS CPPFLAGS LDFLAGS
	 tc-ld-disable-gold #439082 #466536 #526348
	export TARGET_LDFLAGS="${TARGET_LDFLAGS} ${LDFLAGS}"
	unset LDFLAGS
	 tc-export CC NM OBJCOPY RANLIB STRIP
	tc-export BUILD_CC BUILD_PKG_CONFIG
	 # Force configure to use flex & bison; Gentoo bug 887211.
	export LEX=flex
	unset YACC
	 MULTIBUILD_VARIANTS=()
	local p
	for p in "${GRUB_ALL_PLATFORMS[@]}"; do
	  use "grub_platforms_${p}" && MULTIBUILD_VARIANTS+=( "${p}" )
	done
	[[ ${#MULTIBUILD_VARIANTS[@]} -eq 0 ]] && MULTIBUILD_VARIANTS=( guessed )
	grub_do grub_configure
}

src_compile() {
	# Sandbox bug 404013.
	use libzfs && { addpredict /etc/dfs; addpredict /dev/zfs; }
	 grub_do emake
	use doc && grub_do_once emake -C docs html
}

src_install() {
	grub_do emake install DESTDIR="${D}" bashcompletiondir="$(get_bashcompdir)"
	use doc && grub_do_once emake -C docs install-html DESTDIR="${D}"
	 einstalldocs
	 insinto /etc/default
	newins "${FILESDIR}"/grub.default-4 grub
	 # https://bugs.gentoo.org/231935
	dostrip -x /usr/lib/grub
}

pkg_postinst() {
	elog "For information on how to configure GRUB2 please refer to the guide:"
	elog "    https://wiki.gentoo.org/wiki/GRUB2_Quick_Start"
	 if has_version 'sys-boot/grub:0'; then
	  elog "A migration guide for GRUB Legacy users is available:"
	  elog "    https://wiki.gentoo.org/wiki/GRUB2_Migration"
	fi
	 if [[ -z ${REPLACING_VERSIONS} ]]; then
	  elog
	  optfeature "detecting other operating systems (grub-mkconfig)" sys-boot/os-prober
	  optfeature "creating rescue media (grub-mkrescue)" dev-libs/libisoburn
	  optfeature "enabling RAID device detection" sys-fs/mdadm
	fi
	 if has_version sys-boot/os-prober; then
	  ewarn "Due to security concerns, os-prober is disabled by default."
	  ewarn "Set GRUB_DISABLE_OS_PROBER=false in /etc/default/grub to enable it."
	fi
}


# vim: filetype=ebuild
