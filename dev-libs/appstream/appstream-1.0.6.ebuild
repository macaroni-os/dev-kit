# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit meson vala xdg-utils

DESCRIPTION="Cross-distro effort for providing metadata for software in the Linux ecosystem"
HOMEPAGE="https://www.freedesktop.org/wiki/Distributions/AppStream/"
SRC_URI="https://www.freedesktop.org/software/appstream/releases/AppStream-1.0.6.tar.xz -> AppStream-1.0.6.tar.xz"
LICENSE="LGPL-2.1+ GPL-2+"
SLOT="0"
KEYWORDS="*"
IUSE="apt compose doc +introspection qt systemd vala"
BDEPEND="app-text/docbook-xsl-stylesheets
	dev-libs/appstream-glib
	dev-libs/libxslt
	dev-util/gperf
	dev-util/itstool
	sys-devel/gettext
	doc? ( app-text/docbook-xml-dtd:4.5 )
	vala? ( $(vala_depend) )
	
"
RDEPEND="app-arch/zstd:=
	dev-libs/glib:2
	dev-libs/libxml2:=
	dev-libs/libxmlb:=
	dev-libs/libyaml
	dev-libs/snowball-stemmer:=
	net-misc/curl
	compose? (
	  dev-libs/glib:2
	  dev-libs/libyaml
	  gnome-base/librsvg
	  media-libs/fontconfig:1.0
	  media-libs/freetype:2
	  x11-libs/cairo
	  x11-libs/gdk-pixbuf:2
	)
	introspection? ( dev-libs/gobject-introspection:= )
	qt? (
	  || (
	    dev-qt/qtbase:6
	    dev-qt/qtcore:5
	  )
	)
	systemd? ( sys-apps/systemd:= )
	
"
DEPEND="${RDEPEND}
"
post_src_unpack() {
	mv AppStream-* "${S}"
}
src_prepare() {
	default
	sed -e "/^as_doc_target_dir/s/appstream/${PF}/" -i docs/meson.build || die
	sed -e "/^subdir.*tests/s/^/#DONT /" -i {,qt/}meson.build || die # bug 675944
	use vala && vala_src_prepare
}
src_configure() {
	xdg_environment_reset
	 local emesonargs=(
	  -Dapidocs=false
	  -Ddocs=false
	  -Dmaintainer=false
	  -Dstatic-analysis=false
	  -Dstemming=true
	  -Dvapi=$(usex vala true false)
	  -Dapt-support=$(usex apt true false)
	  -Dcompose=$(usex compose true false)
	  -Dinstall-docs=$(usex doc true false)
	  -Dgir=$(usex introspection true false)
	  -Dqt=$(usex qt true false)
	  -Dsystemd=$(usex systemd true false)
	)
	meson_src_configure
}


# vim: filetype=ebuild
