# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
IUSE_L10N=" de es fr it ja nl pl pt-BR ro ru zh-CN"


DESCRIPTION=""
SRC_URI="https://www.kernel.org/pub/linux/docs/man-pages/man-pages-6.19.tar.xz -> man-pages-6.19.tar.xz"
LICENSE="man-pages GPL-2+ BSD"
SLOT="0"
KEYWORDS="*"
IUSE="${IUSE_L10N// / l10n_}"
RDEPEND="virtual/man
	
"
PDEPEND="l10n_de? ( app-i18n/man-pages-l10n[l10n_de(-)] )
	l10n_es? ( app-i18n/man-pages-l10n[l10n_es(-)] )
	l10n_fr? ( app-i18n/man-pages-l10n[l10n_fr(-)] )
	l10n_it? ( app-i18n/man-pages-l10n[l10n_it(-)] )
	l10n_ja? ( app-i18n/man-pages-ja )
	l10n_nl? ( app-i18n/man-pages-l10n[l10n_nl(-)] )
	l10n_pl? ( app-i18n/man-pages-l10n[l10n_pl(-)] )
	l10n_pt-BR? ( app-i18n/man-pages-l10n[l10n_pt-BR(-)] )
	l10n_ro? ( app-i18n/man-pages-l10n[l10n_ro(-)] )
	l10n_ru? ( app-i18n/man-pages-ru )
	l10n_zh-CN? ( app-i18n/man-pages-zh_CN )
	sys-apps/man-pages-posix
	
"
src_prepare() {
	default

	# installed by sys-libs/libxcrypt
	rm man/man3/crypt{,_r}.3 || die
}
src_compile() {
	emake -R
}
src_install() {
	emake -R install prefix="${EPREFIX}/usr" DESTDIR="${D}"
	dodoc README Changes*
}


# vim: filetype=ebuild
