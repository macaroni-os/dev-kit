# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
EGO_OVERRIDE_GOMOD=0
inherit bash-completion-r1 go-module

DESCRIPTION="A command-line tool that makes git easier to use with GitHub."
HOMEPAGE="https://hub.github.com/"
SRC_URI="https://api.github.com/repos/mislav/hub/tarball/v2.14.2 -> hub-2.14.2-a1b6bb1.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
BDEPEND="dev-lang/go
	sys-apps/groff
	
"
RDEPEND="dev-vcs/git
	
"
post_src_unpack() {
	mv "${WORKDIR}"/mislav-hub-* "${S}"
}
src_compile() {
	export GOFLAGS="${GOFLAGS} -mod=vendor"
	emake bin/hub man-pages
}
src_install() {
	dobin bin/${PN}
	dodoc README.md
	doman share/man/man1/*.1
	newbashcomp etc/${PN}.bash_completion.sh ${PN}
	insinto /usr/share/vim/vimfiles
	doins -r share/vim/vimfiles/*
	insinto /usr/share/zsh/site-functions
	newins etc/hub.zsh_completion _${PN}
}


# vim: filetype=ebuild
