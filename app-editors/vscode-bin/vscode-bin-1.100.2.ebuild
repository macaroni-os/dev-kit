# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1 desktop eutils pax-utils xdg

MY_INSTALL_DIR="/opt/${PN}"
MY_EXEC="code"
MY_PN=${PN/-bin/}

DESCRIPTION="Multiplatform Visual Studio Code from Microsoft"
HOMEPAGE="https://code.visualstudio.com"
SRC_URI="https://update.code.visualstudio.com/1.100.2/linux-x64/stable -> vscode-bin-1.100.2.tar.gz"
RESTRICT="strip bindist"
LICENSE="
	Apache-2.0
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
	W3C"
SLOT="0"
KEYWORDS="*"
IUSE="libsecret hunspell zsh-completion"
DEPEND=""
RDEPEND="
	hunspell? ( app-text/hunspell )
	libsecret? ( app-crypt/libsecret[crypt] )
	app-accessibility/at-spi2-atk
	dev-libs/nss
	media-libs/alsa-lib
	media-libs/libpng:0/16
	x11-libs/cairo
	>=x11-libs/gtk+-3.0
	x11-libs/libnotify
	x11-libs/libxkbcommon
	x11-libs/libxkbfile
	x11-libs/libXScrnSaver
	x11-libs/libXtst
	x11-libs/pango
"

QA_PREBUILT="
	${MY_INSTALL_DIR}/vscode-bin
	${MY_INSTALL_DIR}/libEGL.so
	${MY_INSTALL_DIR}/libffmpeg.so
	${MY_INSTALL_DIR}/libGLESv2.so
	${MY_INSTALL_DIR}/libvulkan.so*
	${MY_INSTALL_DIR}/chrome-sandbox
	${MY_INSTALL_DIR}/libvk_swiftshader.so
	${MY_INSTALL_DIR}/swiftshader/libEGL.so
	${MY_INSTALL_DIR}/swiftshader/libGLESv2.so
	${MY_INSTALL_DIR}/resources/app/extensions/*
	${MY_INSTALL_DIR}/resources/app/node_modules.asar.unpacked/*
"

pkg_setup() {
	S="${WORKDIR}/VSCode-linux-x64"
}

src_prepare() {
	default


}

src_install() {
	pax-mark m "${MY_INSTALL_DIR}/${MY_EXEC}"
	insinto "${MY_INSTALL_DIR}"
	doins -r *
	dosym "${MY_INSTALL_DIR}/${MY_EXEC}" "/usr/bin/${PN}"
	make_wrapper "${PN}" "${MY_INSTALL_DIR}/${MY_EXEC}"
	domenu ${FILESDIR}/${PN}.desktop
	newicon ${S}/resources/app/resources/linux/code.png ${PN}.png

	dosym "${MY_INSTALL_DIR}"/bin/"${MY_EXEC}" "/usr/bin/code"

	fperms +x "${MY_INSTALL_DIR}/${MY_EXEC}"
	fperms +x "${MY_INSTALL_DIR}/bin/${MY_EXEC}"

	fperms 4755 "${MY_INSTALL_DIR}/chrome-sandbox"

	if [ -e "${ED}"/"${MY_INSTALL_DIR}"/chrome_crashpad_handler ]; then
		fperms 4755 "${MY_INSTALL_DIR}"/chrome_crashpad_handler
	fi

	fperms +x "${MY_INSTALL_DIR}/libEGL.so"
	fperms +x "${MY_INSTALL_DIR}/libGLESv2.so"
	fperms +x "${MY_INSTALL_DIR}/libffmpeg.so"
	fperms +x "${MY_INSTALL_DIR}/libvk_swiftshader.so"
	fperms +x "${MY_INSTALL_DIR}/resources/app/extensions/git/dist/askpass-empty.sh"
	fperms +x "${MY_INSTALL_DIR}/resources/app/extensions/git/dist/askpass.sh"
	fperms +x "${MY_INSTALL_DIR}/resources/app/extensions/git/dist/git-editor-empty.sh"
	fperms +x "${MY_INSTALL_DIR}/resources/app/extensions/git/dist/git-editor.sh"
	fperms +x "${MY_INSTALL_DIR}/resources/app/extensions/git/dist/ssh-askpass-empty.sh"
	fperms +x "${MY_INSTALL_DIR}/resources/app/extensions/git/dist/ssh-askpass.sh"
	fperms +x "${MY_INSTALL_DIR}/resources/app/extensions/ms-vscode.js-debug/src/targets/node/terminateProcess.sh"
	fperms +x "${MY_INSTALL_DIR}/resources/app/extensions/ms-vscode.js-debug/src/win32-app-container-tokens.win32-arm64-msvc-4ZJZ3U55.node"
	fperms +x "${MY_INSTALL_DIR}/resources/app/extensions/ms-vscode.js-debug/src/win32-app-container-tokens.win32-x64-msvc-VCQE7GJP.node"
	fperms +x "${MY_INSTALL_DIR}/resources/app/node_modules/@parcel/watcher/build/Release/watcher.node"
	fperms +x "${MY_INSTALL_DIR}/resources/app/node_modules/@vscode/deviceid/build/Release/windows.node"
	fperms +x "${MY_INSTALL_DIR}/resources/app/node_modules/@vscode/policy-watcher/build/Release/vscode-policy-watcher.node"
	fperms +x "${MY_INSTALL_DIR}/resources/app/node_modules/@vscode/ripgrep/bin/rg"
	fperms +x "${MY_INSTALL_DIR}/resources/app/node_modules/@vscode/spdlog/build/Release/spdlog.node"
	fperms +x "${MY_INSTALL_DIR}/resources/app/node_modules/@vscode/sqlite3/build/Release/vscode-sqlite3.node"
	fperms +x "${MY_INSTALL_DIR}/resources/app/node_modules/jschardet/scripts/run-workflow.sh"
	fperms +x "${MY_INSTALL_DIR}/resources/app/node_modules/jschardet/scripts/show-size-changes.sh"
	fperms +x "${MY_INSTALL_DIR}/resources/app/node_modules/kerberos/build/Release/kerberos.node"
	fperms +x "${MY_INSTALL_DIR}/resources/app/node_modules/kerberos/build/Release/obj.target/kerberos.node"
	fperms +x "${MY_INSTALL_DIR}/resources/app/node_modules/native-is-elevated/build/Release/iselevated.node"
	fperms +x "${MY_INSTALL_DIR}/resources/app/node_modules/native-keymap/build/Release/keymapping.node"
	fperms +x "${MY_INSTALL_DIR}/resources/app/node_modules/native-watchdog/build/Release/watchdog.node"
	fperms +x "${MY_INSTALL_DIR}/resources/app/node_modules/node-pty/build/Release/pty.node"
	fperms +x "${MY_INSTALL_DIR}/resources/app/node_modules/vsda/build/Release/vsda.node"
	fperms +x "${MY_INSTALL_DIR}/resources/app/node_modules/windows-foreground-love/build/Release/foreground_love.node"
	fperms +x "${MY_INSTALL_DIR}/resources/app/node_modules/windows-foreground-love/build/Release/obj.target/foreground_love.node"
	fperms +x "${MY_INSTALL_DIR}/resources/app/node_modules.asar.unpacked/vsda/build/Release/vsda.node"
	fperms +x "${MY_INSTALL_DIR}/resources/app/out/vs/base/node/cpuUsage.sh"
	fperms +x "${MY_INSTALL_DIR}/resources/app/out/vs/base/node/ps.sh"
	fperms +x "${MY_INSTALL_DIR}/resources/app/out/vs/base/node/terminateProcess.sh"
	fperms +x "${MY_INSTALL_DIR}/resources/app/out/vs/workbench/contrib/terminal/common/scripts/shellIntegration-bash.sh"
	insinto "/usr/share/licenses/${PN}"
	newins "resources/app/LICENSE.rtf" "LICENSE.rtf"

	newbashcomp resources/completions/bash/code code

	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		doins "${S}"/resources/completions/zsh/_code
	fi
}

pkg_postinst() {
	xdg_desktop_database_update
	elog "You may install some additional utils, so check them in:"
	elog "https://code.visualstudio.com/Docs/setup#_additional-tools"
}

pkg_postrm() {
	xdg_desktop_database_update
}