# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7

DESCRIPTION="Miscellaneous files"
HOMEPAGE="https://savannah.gnu.org/projects/miscfiles/"
SRC_URI="
http://gnuftp.mirror.garr.it/miscfiles/miscfiles-1.5.tar.gz -> miscfiles-1.5.tar.gz
https://distfiles.gentoo.org/distfiles/0b/UnicodeData-10.0.0.txt.xz -> miscfiles-UnicodeData-10.0.0.txt.xz"
LICENSE="GPL-2 unicode"
SLOT="0"
KEYWORDS="*"
IUSE="minimal"
src_prepare() {
	default
	mv "${WORKDIR}"/UnicodeData-${UNI_PV}.txt unicode || die
}
src_configure() {
	econf --datadir="${EPREFIX%/}"/usr/share/misc
}

src_install() {
	emake install DESTDIR="${D}"
	dodoc NEWS ORIGIN README dict-README
	# not sure if this is still needed ...
	dodir /usr/share/dict
	cd "${ED%/}"/usr/share/misc || die
	mv $(awk '$1=="dictfiles"{$1="";$2="";print}' "${S}"/Makefile) ../dict/ || die
	cd ../dict || die
	ln -s web2 words || die
	ln -s web2a extra.words || die
	if use minimal ; then
	  pushd "${ED%/}"/usr/share/dict || die
	  rm -f words extra.words || die
	  gzip -9 * || die
	  ln -s web2.gz words || die
	  ln -s web2a.gz extra.words || die
	  ln -s connectives{.gz,} || die
	  ln -s propernames{.gz,} || die
	  popd || die
	  rm -r "${ED%/}"/usr/share/misc || die
	fi
}
pkg_postinst() {
	if [[ ${ROOT} == "/" ]] && type -P create-cracklib-dict >/dev/null ; then
	  ebegin "Regenerating cracklib dictionary"
	  create-cracklib-dict "${EPREFIX%/}"/usr/share/dict/* > /dev/null
	  eend $?
	fi
	# pkg_postinst isn't supposed to fail
	return 0
}


# vim: filetype=ebuild
