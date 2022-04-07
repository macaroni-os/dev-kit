# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
adler-1.0.2
adler32-1.2.0
aho-corasick-0.7.18
ansi_term-0.12.1
anyhow-1.0.56
arrayvec-0.4.12
askalono-0.4.4
atty-0.2.14
autocfg-1.0.1
base64-0.13.0
bit_field-0.10.1
bitflags-1.2.1
block-buffer-0.7.3
block-padding-0.1.5
bstr-0.2.16
bumpalo-3.9.1
byte-tools-0.3.1
byte-unit-4.0.14
bytecount-0.6.2
bytemuck-1.7.0
byteorder-1.4.3
cc-1.0.68
cfg-if-1.0.0
chrono-0.4.19
chrono-tz-0.5.3
clap-2.34.0
clap-3.1.6
color_quant-1.1.0
crc32fast-1.2.1
crossbeam-channel-0.5.1
crossbeam-deque-0.8.0
crossbeam-epoch-0.9.5
crossbeam-utils-0.8.5
dashmap-4.0.2
deflate-1.0.0
deunicode-0.4.3
digest-0.8.1
dirs-3.0.2
dirs-sys-0.3.6
either-1.6.1
encoding_rs-0.8.28
encoding_rs_io-0.1.7
env_logger-0.8.4
exr-1.4.1
fake-simd-0.1.2
flate2-1.0.20
flume-0.10.11
fnv-1.0.7
form_urlencoded-1.0.1
futures-core-0.3.21
futures-sink-0.3.21
generic-array-0.12.4
getrandom-0.2.3
gif-0.11.2
git2-0.14.2
globset-0.4.8
globwalk-0.8.1
grep-matcher-0.1.5
grep-searcher-0.1.8
half-1.8.2
hashbrown-0.11.2
heck-0.4.0
hermit-abi-0.1.19
humansize-1.1.1
humantime-2.1.0
idna-0.2.3
ignore-0.4.18
image-0.24.1
indexmap-1.7.0
inflate-0.4.5
instant-0.1.9
itoa-0.4.7
itoa-1.0.1
jobserver-0.1.22
jpeg-decoder-0.1.22
jpeg-decoder-0.2.2
js-sys-0.3.56
lazy_static-1.4.0
lebe-0.5.1
libc-0.2.121
libgit2-sys-0.13.2+1.4.2
libz-sys-1.1.3
linked-hash-map-0.5.4
lock_api-0.4.4
log-0.4.14
maplit-1.0.2
matches-0.1.8
memchr-2.4.0
memmap2-0.3.0
memoffset-0.6.4
miniz_oxide-0.4.4
miniz_oxide-0.5.1
more-asserts-0.2.2
nanorand-0.6.1
nodrop-0.1.14
num-format-0.4.0
num-integer-0.1.44
num-iter-0.1.42
num-rational-0.4.0
num-traits-0.2.14
num_cpus-1.13.0
num_threads-0.1.3
once_cell-1.8.0
opaque-debug-0.2.3
os_str_bytes-6.0.0
owo-colors-3.3.0
parking_lot-0.11.1
parking_lot_core-0.8.3
parse-zoneinfo-0.3.0
paste-1.0.7
percent-encoding-2.1.0
pest-2.1.3
pest_derive-2.1.0
pest_generator-2.1.3
pest_meta-2.1.3
pin-project-1.0.10
pin-project-internal-1.0.10
pkg-config-0.3.19
png-0.17.5
ppv-lite86-0.2.10
proc-macro2-1.0.27
quote-1.0.9
rand-0.8.4
rand_chacha-0.3.1
rand_core-0.6.3
rand_hc-0.3.1
rayon-1.5.1
rayon-core-1.9.1
redox_syscall-0.2.9
redox_users-0.4.0
regex-1.5.5
regex-syntax-0.6.25
rmp-0.8.10
rmp-serde-0.14.4
rustversion-1.0.5
ryu-1.0.5
same-file-1.0.6
scoped_threadpool-0.1.9
scopeguard-1.1.0
serde-1.0.136
serde_derive-1.0.136
serde_json-1.0.79
serde_yaml-0.8.23
sha-1-0.8.2
slug-0.1.4
smallvec-1.8.0
spin-0.9.2
strsim-0.8.0
strsim-0.10.0
strum-0.24.0
strum_macros-0.24.0
syn-1.0.73
tera-1.12.0
term_size-0.3.2
termcolor-1.1.2
terminal_size-0.1.17
textwrap-0.11.0
textwrap-0.15.0
thread_local-1.1.3
threadpool-1.8.1
tiff-0.7.1
time-0.1.43
time-0.3.7
time-humanize-0.1.3
tinyvec-1.2.0
tinyvec_macros-0.1.0
tokei-12.1.2
toml-0.5.8
typenum-1.13.0
ucd-trie-0.1.3
unic-char-property-0.9.0
unic-char-range-0.9.0
unic-common-0.9.0
unic-segment-0.9.0
unic-ucd-segment-0.9.0
unic-ucd-version-0.9.0
unicode-bidi-0.3.5
unicode-normalization-0.1.19
unicode-width-0.1.8
unicode-xid-0.2.2
url-2.2.2
utf8-width-0.1.5
vcpkg-0.2.15
vec_map-0.8.2
walkdir-2.3.2
wasi-0.10.2+wasi-snapshot-preview1
wasm-bindgen-0.2.79
wasm-bindgen-backend-0.2.79
wasm-bindgen-macro-0.2.79
wasm-bindgen-macro-support-0.2.79
wasm-bindgen-shared-0.2.79
weezl-0.1.5
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0
yaml-rust-0.4.5
zstd-0.8.3+zstd.1.5.0
zstd-safe-4.1.0+zstd.1.5.0
zstd-sys-1.6.0+zstd.1.5.0
"

inherit cargo

DESCRIPTION="Onefetch is a command-line Git information tool"
HOMEPAGE="https://github.com/o2sh/onefetch"
SRC_URI="https://api.github.com/repos/o2sh/onefetch/tarball/v2.12.0 -> onefetch-2.12.0.tar.gz
	$(cargo_crate_uris ${CRATES})"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/o2sh-onefetch-* ${S} || die
}