# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo bash-completion-r1

DESCRIPTION="A very fast implementation of tldr in Rust."
HOMEPAGE="https://github.com/dbrgn/tealdeer https://dbrgn.github.io/tealdeer/"
SRC_URI="https://github.com/dbrgn/tealdeer/tarball/5347e803e1f8713ea9833f2756fb45ba02a63908 -> tealdeer-1.7.2-5347e80.tar.gz
https://distfiles.macaronios.org/fc/bb/f1/fcbbf1b3debe6bd96fc5dfe3c0c997e410880213bf43a142f968017647b2c103e4a15bcb4b1a1e88a5fe7c3c53386dcbad00791b063f0d9cff2b3b039d9336a6 -> tealdeer-1.7.2-funtoo-crates-bundle-e46ffc1071f994675b901dbcef8db31d68bb92e96aff928d40aa2c952a36962a16b246c8d98a53524a417774920927487acadbddb276c2f5b2333af4b3a59410.tar.gz"

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