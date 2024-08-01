# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo bash-completion-r1

DESCRIPTION="A very fast implementation of tldr in Rust."
HOMEPAGE="https://github.com/dbrgn/tealdeer https://dbrgn.github.io/tealdeer/"
SRC_URI="https://github.com/dbrgn/tealdeer/tarball/412950316b82fbd12d1569cc75badd6fe5c77574 -> tealdeer-1.6.1-4129503.tar.gz
https://distfiles.macaronios.org/2f/ea/11/2fea111db32e861ca4d0b21f8565796e44bb1a4e4c85fb327a3ad324e7d76b240d8d362f48bb73015acd131a101dcfdaf01190b07d198894bf7089c75ab48383 -> tealdeer-1.6.1-funtoo-crates-bundle-9991adc9de3be8c6ff4991e480ff3724a3766e14a73a6e29b6cac72051e7a5fe73873559268989877c72a2e81d1ff0e2fd40a48c01e0d91cdd6bcb16a9bb9629.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE="+bash-completion zsh-completion fish-completion"

DOCS=( README.md CHANGELOG.md )

QA_FLAGS_IGNORED="usr/bin/tldr"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/dbrgn-tealdeer-* ${S} || die
}

src_install() {
	cargo_src_install
	einstalldocs

	use bash-completion && newbashcomp completion/bash_tealdeer tldr

	use zsh-completion && {
		insinto /usr/share/zsh/site-functions
		newins completion/zsh_tealdeer _tldr
	}

	use fish-completion && {
		insinto /usr/share/fish/vendor_completions.d
		newins completion/fish_tealdeer tldr.fish
	}
}