# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
MAKEOPTS+=" -j1"

DESCRIPTION="Multi-platform library designed to allow a developer to create robust software"
HOMEPAGE="http://www.jedsoft.org/slang/"
SRC_URI="http://www.jedsoft.org/releases/slang/slang-2.3.3.tar.bz2 -> slang-2.3.3.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
IUSE="cjk pcre png readline static-libs zlib"
RDEPEND="sys-libs/ncurses:0=
	cjk? ( dev-libs/oniguruma:= )
	pcre? ( dev-libs/libpcre )
	png? ( media-libs/libpng:0= )
	readline? ( sys-libs/readline:0= )
	zlib? ( sys-libs/zlib )
	
"
DEPEND="${RDEPEND}
"
# S-Lang 2.3.x still supports PCRE1 only (--with-pcre=DIR); there is
# no PCRE2 configure path, so the optional regex dependency stays on
# dev-libs/libpcre.
src_prepare() {
	default

	# avoid linking to -ltermcap race with some systems
	sed -i -e '/^TERMCAP=/s:=.*:=:' configure || die
	# we use the GNU linker also on Solaris
	sed -i -e 's/-G -fPIC/-shared -fPIC/g' \
		-e 's/-Wl,-h,/-Wl,-soname,/g' configure || die

	# slsh links against the installed library by default; use the
	# just-built one (the 2.3.1 patch carried in the tree, adapted to
	# the 2.3.3 Makefile layout).
	sed -i -e 's|$(OBJDIR)/slsh $(LDFLAGS) $(DLINK_FLAGS) $(INST_LIBS)|$(OBJDIR)/slsh $(LDFLAGS) $(DLINK_FLAGS) $(SRC_LIBS)|' \
		slsh/Makefile.in || die
}

src_configure() {
	local myeconfargs=(
		--with-readline=$(usex readline gnu slang)
		$(use_with pcre)
		$(use_with cjk onig)
		$(use_with png)
		$(use_with zlib z)
	)
	econf "${myeconfargs[@]}"
}

src_compile() {
	emake elf $(use static-libs && echo static)

	pushd slsh >/dev/null || die
	emake slsh
	popd >/dev/null || die
}

src_install() {
	emake DESTDIR="${D}" install $(use static-libs && echo install-static)

	rm -r "${ED%/}"/usr/share/doc/{slang,slsh} || die
	dodoc NEWS README *.txt doc/{,internal,text}/*.txt
	docinto html
	dodoc doc/slangdoc.html slsh/doc/html/*.html
}


# vim: filetype=ebuild
