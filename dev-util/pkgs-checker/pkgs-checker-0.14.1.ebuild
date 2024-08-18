# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Macaroni OS Artefacts Checker"
HOMEPAGE="https://github.com/geaaru/pkgs-checker"
SRC_URI="https://github.com/geaaru/pkgs-checker/tarball/09c3820e27f942384876dcfd2ee6ab7403b8e8a1 -> pkgs-checker-0.14.1-09c3820.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="*"

DEPEND="dev-lang/go"

post_src_unpack() {
	mv geaaru-pkgs-checker-* ${S}
}

src_compile() {
	anise_ldflags=(
		"-X \"github.com/geaaru/pkgs-checker/cmd.BuildTime=$(date -u '+%Y-%m-%d %I:%M:%S %Z')\""
		"-X github.com/geaaru/pkgs-checker/cmd.BuildCommit=09c3820e27f942384876dcfd2ee6ab7403b8e8a1"
		"-X github.com/geaaru/pkgs-checker/cmd.BuildGoVersion=$(go env GOVERSION)"
	)

	CGO_ENABLED=0 go build \
		-ldflags "${anise_ldflags[*]}" \
		-o ${PN} -v -x -mod=vendor . || die
}

src_install() {
	dobin "${PN}"
	dodoc README.md
}

# vim: filetype=ebuild