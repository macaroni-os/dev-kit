# Distributed under the terms of the GNU General Public License v2

EAPI=7
VALA_USE_DEPEND="vapigen"

inherit cmake vala

DESCRIPTION="Ayatana Application Indicators (Shared Library)"
HOMEPAGE="https://github.com/AyatanaIndicators/libayatana-appindicator"
SRC_URI="https://github.com/AyatanaIndicators/libayatana-appindicator/tarball/31e8bb083b307e1cc96af4874a94707727bd1e79 -> libayatana-appindicator-0.5.94-31e8bb0.tar.gz"

LICENSE="GPL-3 LGPL-2 LGPL-3"
SLOT="0"
KEYWORDS="*"

RDEPEND="
	dev-libs/glib:2
x11-libs/gtk+:3[introspection]
	dev-libs/libdbusmenu[gtk3]
dev-libs/libayatana-indicator"
DEPEND="${RDEPEND}"
BDEPEND="
	$(vala_depend)
"
S="${WORKDIR}/AyatanaIndicators-libayatana-appindicator-31e8bb0"

src_prepare() {
	default

	cmake_src_prepare
	vala_src_prepare
}

src_configure() {
	local mycmakeargs+=(
		-DVALA_COMPILER="${VALAC}"
		-DVAPI_GEN="${VAPIGEN}"
		-DENABLE_TESTS=OFF
		-DENABLE_BINDINGS_MONO=OFF
		-DENABLE_GTKDOC=OFF
		-DFLAVOUR_GTK2=OFF
		-DFLAVOUR_GTK3=ON
	)

	cmake_src_configure
}
