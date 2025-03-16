# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Macaroni OS - M.A.R.K. Development Kit"
HOMEPAGE="https://github.com/macaroni-os/mark-devkit"
SRC_URI="https://github.com/macaroni-os/mark-devkit/tarball/eeabd214d44100a4251f27386246a17f1e451c30 -> mark-devkit-0.15.6-eeabd21.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="*"

DEPEND="dev-lang/go"

post_src_unpack() {
	mv macaroni-os-mark-* ${S}
}

src_compile() {
	mark_ldflags=(
		"-X \"github.com/macaroni-os/mark-devkit/pkg/config.BuildTime=$(date -u '+%Y-%m-%d %I:%M:%S %Z')\""
		"-X github.com/macaroni-os/mark-devkit/pkg/config.BuildCommit=eeabd214d44100a4251f27386246a17f1e451c30"
		"-X github.com/macaroni-os/mark-devkit/pkg/config.BuildGoVersion=$(go env GOVERSION)"
	)

	CGO_ENABLED=0 go build \
		-ldflags "${mark_ldflags[*]}" \
		-o ${PN} -v -x -mod=vendor . || die
}

src_install() {
	dobin "${PN}"
	dodoc README.md
}

# vim: filetype=ebuild