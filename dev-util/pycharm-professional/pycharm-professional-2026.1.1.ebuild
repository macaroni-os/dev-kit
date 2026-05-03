# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
QA_PREBUILT="opt/${PN}/bin/fsnotifier
  opt/${PN}/bin/fsnotifier64
  opt/${PN}/bin/fsnotifier-arm
  opt/${PN}/bin/libyjpagent-linux.so
  opt/${PN}/bin/libyjpagent-linux64.so"

inherit desktop eutils xdg

DESCRIPTION=""
HOMEPAGE="https://www.jetbrains.com/python"
SRC_URI="
amd64? ( https://download.jetbrains.com/python/pycharm-2026.1.1.tar.gz -> pycharm-professional-2026.1.1-amd64.tar.gz )
arm64? ( https://download.jetbrains.com/python/pycharm-2026.1.1-aarch64.tar.gz -> pycharm-professional-2026.1.1-aarch64.tar.gz )"
LICENSE="JetBrains"
SLOT="0"
KEYWORDS="*"
IUSE="+system-java +sysctl"
RDEPEND="system-java? ( virtual/jre )
	dev-libs/libdbusmenu
	dev-python/pip
	
"
post_src_unpack() {
	if [ ! -d "$S" ]; then
	  einfo "Renaming source directory to predictable name..."
	  mv $(ls "${WORKDIR}") "pycharm-2026.1.1" || die
	fi
}
src_install() {
	patchelf --set-rpath '$ORIGIN' jbr/lib/jcef_helper jbr/lib/libjcef.so
	local dir="/opt/pycharm-professional"
	local dst="${D}${dir}"
	insinto "${dir}"
	mv "${S}"/* "${dst}"
	local bundled_script_name="${PN%-*}.sh" # bundled script is always lowercase, and doesn't have -ultimate, -professional suffix.
	make_wrapper "pycharm-professional" "${dir}/bin/$bundled_script_name" || die
	local svgfile="$(find ${dst}/bin -maxdepth 1 -iname '*.svg')"
	newicon $svgfile "pycharm-professional.svg" || die
	local pngfile="$(find ${dst}/bin -maxdepth 1 -iname '*.png')"
	newicon $pngfile "pycharm-professional.png" || die
	make_desktop_entry pycharm-professional "PyCharm Professional" pycharm-professional "Development;IDE;" || die
	if use system-java; then
	  rm -rf "$dst{jbr,jre{64}}" || die "Failed to remove bundled Java"
	fi
	if use sysctl; then
	  dodir /etc/sysctl.d
	  echo "fs.inotify.max_user_watches = 524288" > "${D}/etc/sysctl.d/30-pycharm-professional-idea-inotify-watches.conf" || die
	fi
}
pkg_postinst() {
	xdg_pkg_postinst
	if use sysctl; then
	  ( /etc/init.d/sysctl restart >/dev/null 2>&1 )
	  einfo "An /etc/sysctl.d file was installed to optimally configure the IDE, with this"
	  einfo "setting:"
	else
	  einfo "JetBrains recommends adding the following to /etc/sysctl.conf:"
	fi
	einfo
	einfo "fs.inotify.max_user_watches = 524288"
	einfo
	einfo "See https://confluence.jetbrains.com/display/IDEADEV/Inotify+Watches+Limit for"
	einfo "more information."
	if use sysctl; then
	  einfo "If this change is undesired, set -sysctl in /etc/portage/package.use."
	fi
}


# vim: filetype=ebuild
