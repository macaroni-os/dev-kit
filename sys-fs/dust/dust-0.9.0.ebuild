# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
aho-corasick-1.1.2
ansi_term-0.12.1
anstream-0.6.4
anstyle-1.0.4
anstyle-parse-0.2.2
anstyle-query-1.0.0
anstyle-wincon-3.0.1
assert_cmd-2.0.12
autocfg-1.1.0
bitflags-1.3.2
bitflags-2.4.1
bstr-1.8.0
cfg-if-1.0.0
clap-4.4.8
clap_builder-4.4.8
clap_complete-4.4.4
clap_lex-0.6.0
clap_mangen-0.2.15
colorchoice-1.0.0
config-file-0.2.3
core-foundation-sys-0.8.4
crossbeam-deque-0.8.3
crossbeam-epoch-0.9.15
crossbeam-utils-0.8.16
difflib-0.4.0
directories-4.0.1
dirs-sys-0.3.7
doc-comment-0.3.3
either-1.9.0
errno-0.3.7
fastrand-2.0.1
getrandom-0.2.11
hermit-abi-0.3.3
io-lifetimes-1.0.11
itertools-0.11.0
lazy_static-1.4.0
libc-0.2.150
libredox-0.0.1
linux-raw-sys-0.3.8
linux-raw-sys-0.4.11
lscolors-0.13.0
memchr-2.6.4
memoffset-0.9.0
ntapi-0.4.1
nu-ansi-term-0.46.0
once_cell-1.18.0
overload-0.1.1
predicates-3.0.4
predicates-core-1.0.6
predicates-tree-1.0.9
proc-macro2-1.0.69
quote-1.0.33
rayon-1.8.0
rayon-core-1.12.0
redox_syscall-0.4.1
redox_users-0.4.4
regex-1.10.2
regex-automata-0.4.3
regex-syntax-0.8.2
roff-0.2.1
rustix-0.37.27
rustix-0.38.25
scopeguard-1.2.0
serde-1.0.193
serde_derive-1.0.193
stfu8-0.2.6
strsim-0.10.0
syn-2.0.39
sysinfo-0.27.8
tempfile-3.8.1
terminal_size-0.2.6
termtree-0.4.1
thiserror-1.0.50
thiserror-impl-1.0.50
thousands-0.2.0
toml-0.5.11
unicode-ident-1.0.12
unicode-width-0.1.11
utf8parse-0.2.1
wait-timeout-0.2.0
wasi-0.11.0+wasi-snapshot-preview1
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.6
winapi-x86_64-pc-windows-gnu-0.4.0
windows-sys-0.48.0
windows-targets-0.48.5
windows_aarch64_gnullvm-0.48.5
windows_aarch64_msvc-0.48.5
windows_i686_gnu-0.48.5
windows_i686_msvc-0.48.5
windows_x86_64_gnu-0.48.5
windows_x86_64_gnullvm-0.48.5
windows_x86_64_msvc-0.48.5
"

inherit cargo

DESCRIPTION="A more intuitive version of du in rust"
HOMEPAGE="https://github.com/bootandy/dust"
SRC_URI="https://api.github.com/repos/bootandy/dust/tarball/v0.9.0 -> dust-0.9.0.tar.gz
	$(cargo_crate_uris ${CRATES})"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND=""
BDEPEND=">=virtual/rust-1.54.0"

QA_FLAGS_IGNORED="/usr/bin/dust"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/bootandy-dust-* ${S} || die
}

src_install() {
	cargo_src_install
	einstalldocs
}