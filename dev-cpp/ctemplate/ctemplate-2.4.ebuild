# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )

inherit autotools elisp-common python-any-r1

DESCRIPTION="A simple but powerful template language for C++"
HOMEPAGE="https://github.com/olafvdspek/ctemplate"
SRC_URI="https://github.com/OlafvdSpek/ctemplate/tarball/25c570cdb50e11c19aac5f2398e845b570eca76b -> ctemplate-2.4-25c570c.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="*"
IUSE="doc emacs vim-syntax static-libs test"

DEPEND="test? ( ${PYTHON_DEPS} )"
RDEPEND="
	emacs? ( >=app-editors/emacs-23.1:* )
	vim-syntax? ( >=app-editors/vim-core-7 )"

SITEFILE="70ctemplate-gentoo.el"

RESTRICT="test"

post_src_unpack() {
	if [ ! -d "${S}" ]; then
		mv OlafvdSpek-ctemplate* "${S}" || die
	fi
}

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf $(use_enable static-libs static)
}

src_compile() {
	default

	if use emacs; then
		elisp-compile contrib/tpl-mode.el
	fi
}

src_install() {
	default
	if ! use doc; then
		rm -r "${ED}"/usr/share/doc/${PF}/html || die
	fi

	if use vim-syntax; then
		cd "${S}/contrib" || die
		sh highlighting.vim || die "unpacking vim scripts failed"
		insinto /usr/share/vim/vimfiles
		doins -r .vim/.
	fi

	if use emacs; then
		cd "${S}/contrib" || die
		elisp-install ${PN} tpl-mode.el tpl-mode.elc
		elisp-site-file-install "${FILESDIR}/${SITEFILE}"
	fi

	# package provides .pc files
	find "${D}" -name '*.la' -delete || die
}

pkg_postinst() {
	use emacs && elisp-site-regen
}

pkg_postrm() {
	use emacs && elisp-site-regen
}