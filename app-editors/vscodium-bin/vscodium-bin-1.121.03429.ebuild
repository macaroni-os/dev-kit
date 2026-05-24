# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit desktop eutils pax-utils xdg

DESCRIPTION="binary releases of VS Code without MS branding/telemetry/licensing"
HOMEPAGE="https://vscodium.com"
SRC_URI="
amd64? ( https://github.com/VSCodium/vscodium/releases/download/1.121.03429/VSCodium-linux-x64-1.121.03429.tar.gz -> vscodium-bin-1.121.03429-x64.tar.gz )
arm64? ( https://github.com/VSCodium/vscodium/releases/download/1.121.03429/VSCodium-linux-arm64-1.121.03429.tar.gz -> vscodium-bin-1.121.03429-arm64.tar.gz )"
LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE="amd64 arm64 libsecret hunspell"
# Commons depends
CDEPEND="media-libs/libpng
	x11-libs/gtk+:3
	x11-libs/cairo
	x11-libs/libXtst
	
"
RDEPEND="${CDEPEND}
	net-print/cups
	x11-libs/libnotify
	x11-libs/libXScrnSaver
	dev-libs/nss
	hunspell? ( app-text/hunspell )
	libsecret? ( app-crypt/libsecret[crypt] )
	
"
DEPEND="${CDEPEND}
	
"
S="${WORKDIR}"
src_install() {
	local instdir="/opt/vscodium-bin"
	local exe="codium"
	 pax-mark m "${instdir}/${exe}"
	insinto "${instdir}"
	doins -r *
	dosym "${instdir}/${exe}" "/usr/bin/vscodium-bin"
	make_wrapper "vscodium-bin" "${instdir}/${exe}"
	domenu ${FILESDIR}/vscodium-bin.desktop
	newicon ${S}/resources/app/resources/linux/code.png vscodium-bin.png
	 fperms +x "${instdir}/${MY_EXEC}"
	fperms 4755 "${instdir}/chrome-sandbox"
	fperms +x "${instdir}/libEGL.so"
	fperms +x "${instdir}/libGLESv2.so"
	fperms +x "${instdir}/libffmpeg.so"
	 #fix Spawn EACESS bug #25848
	insinto "/usr/share/licenses/vscodium-bin"
	newins "${S}/resources/app/LICENSE.txt" "LICENSE.txt"
}
pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
	elog "You may install some additional utils, so check them in:"
	elog "https://code.visualstudio.com/Docs/setup#_additional-tools"
}
pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}


# vim: filetype=ebuild
