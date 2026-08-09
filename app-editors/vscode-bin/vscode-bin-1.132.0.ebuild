# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
QA_PREBUILT="/opt/*"
inherit bash-completion-r1 desktop eutils pax-utils xdg

DESCRIPTION="Open-source code editor"
HOMEPAGE="https://code.visualstudio.com/"
SRC_URI="
amd64? ( https://update.code.visualstudio.com/1.132.0/linux-x64/stable -> vscode-bin-linux-x64-1.132.0.tar.gz )
arm64? ( https://update.code.visualstudio.com/1.132.0/linux-arm64/stable -> vscode-bin-linux-arm64-1.132.0.tar.gz )"
LICENSE="Apache-2.0
BSD
BSD-1
BSD-2
BSD-4
CC-BY-4.0
ISC
LGPL-2.1+
Microsoft
MIT
MPL-2.0
openssl
PYTHON
TextMate-bundle
Unlicense
UoI-NCSA
W3C
"
SLOT="0"
KEYWORDS="*"
IUSE="amd64 arm64 zsh-completion"
src_unpack() {
	default
	mv "${WORKDIR}"/VSCode-linux-* "${S}" || die
}
src_install() {
	local instdir="/opt/vscode-bin"
	local exe=code
	# Cleanup
	rm -r ${S}/resources/app/ThirdPartyNotices.txt || die
	# Disable update server
	sed -e "/updateUrl/d" -i ${S}/resources/app/product.json || die
	pax-mark m "${instdir}/${exe}"
	insinto "${instdir}"
	doins -r *
	dosym "${instdir}/${exec}" "/usr/bin/vscode-bin"
	make_wrapper "vscode-bin" "${instdir}/${exe}"
	domenu ${FILESDIR}/${PN}.desktop
	newicon ${S}/resources/app/resources/linux/code.png vscode-bin.png
	dosym "${instdir}"/bin/"${exe}" "/usr/bin/code"
	fperms +x "${instdir}/${exe}"
	fperms +x "${instdir}/bin/${exe}"
	fperms 4711 "${instdir}/chrome-sandbox"
	chmod +x $(find "${D}/${instdir}"/resources/app/node_modules/@vscode/ripgrep-universal/bin/ | grep rg)
	if [ -e "${ED}"/"${instdir}"/chrome_crashpad_handler ]; then
	  fperms 4755 "${instdir}"/chrome_crashpad_handler
	fi
	insinto "/usr/share/licenses/vscode-bin"
	newins "resources/app/LICENSE.rtf" "LICENSE.rtf"
	newbashcomp resources/completions/bash/code code
	if use zsh-completion; then
	  insinto /usr/share/zsh/site-functions
	  doins "${S}"/resources/completions/zsh/_code
	fi
}
pkg_postinst() {
	xdg_desktop_database_update
}
pkg_postrm() {
	xdg_desktop_database_update
}


# vim: filetype=ebuild
