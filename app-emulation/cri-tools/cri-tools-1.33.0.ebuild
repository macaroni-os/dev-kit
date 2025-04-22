# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1 go-module

go-module_set_globals

SRC_URI="https://github.com/kubernetes-sigs/cri-tools/tarball/c677146127eec65369ae41fb556f7122f8308fd4 -> cri-tools-1.33.0-c677146.tar.gz
https://distfiles.macaronios.org/27/8b/55/278b55185bd1a0e2cb6c323b80b63393b322e539d9dcfe54f9b0edc7e7c9ab0d4ca9eddb87e7dd40e7823b558aa8d77587e53da62ce461b4ffb124302f3bf1dd -> cri-tools-1.33.0-funtoo-go-bundle-3c1252674a1f00b121742239e9c7b7dcac237b875095ff8bfc27872bcc0178b5b8169af82b5284ce3af89b6ab3b7733c5aa911ec416abf820cf8cf5eea2dc62a.tar.gz"

DESCRIPTION="CLI and validation tools for Kubelet Container Runtime (CRI)"
HOMEPAGE="https://github.com/kubernetes-sigs/cri-tools"

LICENSE="Apache-2.0 BSD BSD-2 CC-BY-SA-4.0 ISC MIT MPL-2.0"
SLOT="0"
KEYWORDS="*"

DEPEND="dev-lang/go"

RESTRICT+=" test"

src_unpack() {
	go-module_src_unpack
	if [ ! -d "${S}" ]; then
		mv kubernetes-sigs-cri-tools* "${S}" || die
	fi
}

src_compile() {
	emake VERSION="${PV}"
	./build/bin/linux/amd64/crictl completion bash > "${PN}.bash" || die
	./build/bin/linux/amd64/crictl completion zsh > "${PN}.zsh" || die
}

src_install() {
	dobin ./build/bin/linux/amd64/crictl

	newbashcomp ${PN}.bash ${PN}
	insinto /usr/share/zsh/site-functions
	newins ${PN}.zsh _${PN}

	dodoc -r docs {README,RELEASE,CHANGELOG,CONTRIBUTING}.md
}