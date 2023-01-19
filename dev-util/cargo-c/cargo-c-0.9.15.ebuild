# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="adler-1.0.2
aho-corasick-0.7.20
anyhow-1.0.68
arrayvec-0.5.2
atty-0.2.14
autocfg-1.1.0
base64-0.13.1
bitflags-1.3.2
bitmaps-2.1.0
block-buffer-0.10.3
bstr-0.2.17
bstr-1.1.0
bytes-1.3.0
bytesize-1.1.0
cargo-0.67.1
cargo-platform-0.1.2
cargo-util-0.2.2
cbindgen-0.24.3
cc-1.0.78
cfg-if-1.0.0
clap-3.2.23
clap-4.1.1
clap_derive-4.1.0
clap_lex-0.2.4
clap_lex-0.3.1
combine-4.6.6
commoncrypto-0.2.0
commoncrypto-sys-0.2.0
core-foundation-0.9.3
core-foundation-sys-0.8.3
cpufeatures-0.2.5
crates-io-0.34.0
crc32fast-1.3.2
crypto-common-0.1.6
crypto-hash-0.3.4
curl-0.4.44
curl-sys-0.4.59+curl-7.86.0
digest-0.10.6
either-1.8.0
env_logger-0.9.3
errno-0.2.8
errno-dragonfly-0.1.2
fastrand-1.8.0
filetime-0.2.19
flate2-1.0.25
fnv-1.0.7
foreign-types-0.3.2
foreign-types-shared-0.1.1
form_urlencoded-1.1.0
fwdansi-1.1.0
generic-array-0.14.6
git2-0.16.0
git2-curl-0.17.0
glob-0.3.1
globset-0.4.10
hashbrown-0.12.3
heck-0.4.0
hermit-abi-0.1.19
hermit-abi-0.2.6
hex-0.3.2
hex-0.4.3
hmac-0.12.1
home-0.5.4
humantime-2.1.0
idna-0.3.0
ignore-0.4.20
im-rc-15.1.0
indexmap-1.9.2
instant-0.1.12
io-lifetimes-1.0.4
is-terminal-0.4.2
itertools-0.10.5
itoa-1.0.5
jobserver-0.1.25
kstring-2.0.0
lazy_static-1.4.0
lazycell-1.3.0
libc-0.2.139
libgit2-sys-0.14.1+1.5.0
libnghttp2-sys-0.1.7+1.45.0
libssh2-sys-0.2.23
libz-sys-1.1.8
linux-raw-sys-0.1.4
log-0.4.17
memchr-2.5.0
miniz_oxide-0.6.2
miow-0.3.7
num-traits-0.2.15
once_cell-1.17.0
opener-0.5.0
openssl-0.10.45
openssl-macros-0.1.0
openssl-probe-0.1.5
openssl-src-111.24.0+1.1.1s
openssl-sys-0.9.80
ordered-float-2.10.0
os_info-3.5.1
os_str_bytes-6.4.1
pathdiff-0.2.1
percent-encoding-2.2.0
pkg-config-0.3.26
proc-macro-error-1.0.4
proc-macro-error-attr-1.0.4
proc-macro2-1.0.50
quote-1.0.23
rand_core-0.6.4
rand_xoshiro-0.6.0
redox_syscall-0.2.16
regex-1.7.1
regex-automata-0.1.10
regex-syntax-0.6.28
remove_dir_all-0.5.3
rustc-workspace-hack-1.0.0
rustfix-0.6.1
rustix-0.36.7
ryu-1.0.12
same-file-1.0.6
schannel-0.1.21
semver-1.0.16
serde-1.0.152
serde-value-0.7.0
serde_derive-1.0.152
serde_ignored-0.1.7
serde_json-1.0.91
sha1-0.10.5
shell-escape-0.1.5
sized-chunks-0.6.5
socket2-0.4.7
static_assertions-1.1.0
strip-ansi-escapes-0.1.1
strsim-0.10.0
subtle-2.4.1
syn-1.0.107
tar-0.4.38
tempfile-3.3.0
termcolor-1.2.0
textwrap-0.16.0
thread_local-1.1.4
tinyvec-1.6.0
tinyvec_macros-0.1.0
toml-0.5.10
toml_datetime-0.5.0
toml_edit-0.15.0
typenum-1.16.0
unicode-bidi-0.3.9
unicode-ident-1.0.6
unicode-normalization-0.1.22
unicode-width-0.1.10
unicode-xid-0.2.4
url-2.3.1
utf8parse-0.2.0
vcpkg-0.2.15
version_check-0.9.4
vte-0.10.1
vte_generate_state_changes-0.1.1
walkdir-2.3.2
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0
windows-sys-0.42.0
windows_aarch64_gnullvm-0.42.1
windows_aarch64_msvc-0.42.1
windows_i686_gnu-0.42.1
windows_i686_msvc-0.42.1
windows_x86_64_gnu-0.42.1
windows_x86_64_gnullvm-0.42.1
windows_x86_64_msvc-0.42.1
"

inherit cargo

DESCRIPTION="Cargo applet to build and install C-ABI compatible dynamic and static libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://api.github.com/repos/lu-zero/cargo-c/tarball/v0.9.15 -> cargo-c-0.9.15.tar.gz
	$(cargo_crate_uris ${CRATES})"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND="sys-libs/zlib
	dev-libs/openssl:0=
	net-libs/libssh2
	net-misc/curl[ssl]
"
BDEPEND=">=virtual/rust-1.66.0"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/lu-zero-cargo-c-* ${S} || die
}