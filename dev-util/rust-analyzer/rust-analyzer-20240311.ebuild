# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
addr2line-0.21.0
adler-1.0.2
always-assert-0.2.0
anyhow-1.0.80
arbitrary-1.3.2
arrayvec-0.7.4
autocfg-1.1.0
backtrace-0.3.69
bitflags-1.3.2
bitflags-2.4.2
byteorder-1.5.0
camino-1.1.6
cargo-platform-0.1.7
cargo_metadata-0.18.1
cc-1.0.89
cfg-if-1.0.0
chalk-derive-0.96.0
chalk-ir-0.96.0
chalk-recursive-0.96.0
chalk-solve-0.96.0
command-group-2.1.0
countme-3.0.1
cov-mark-2.0.0-pre.1
crc32fast-1.4.0
crossbeam-channel-0.5.12
crossbeam-deque-0.8.5
crossbeam-epoch-0.9.18
crossbeam-utils-0.8.19
ctrlc-3.4.2
dashmap-5.5.3
deranged-0.3.11
derive_arbitrary-1.3.2
dissimilar-1.0.7
dot-0.1.4
drop_bomb-0.1.5
either-1.10.0
ena-0.14.2
equivalent-1.0.1
expect-test-1.4.1
filetime-0.2.23
fixedbitset-0.4.2
flate2-1.0.28
form_urlencoded-1.2.1
fsevent-sys-4.1.0
fst-0.4.7
getrandom-0.2.12
gimli-0.28.1
hashbrown-0.14.3
heck-0.4.1
hermit-abi-0.3.9
home-0.5.9
idna-0.5.0
indexmap-2.2.5
inotify-0.9.6
inotify-sys-0.1.5
itertools-0.12.1
itoa-1.0.10
jod-thread-0.1.2
kqueue-1.0.8
kqueue-sys-1.0.4
la-arena-0.3.1
lazy_static-1.4.0
libc-0.2.153
libloading-0.8.2
libmimalloc-sys-0.1.35
line-index-0.1.1
linked-hash-map-0.5.6
lock_api-0.4.11
log-0.4.21
lsp-server-0.7.6
lsp-types-0.95.0
memchr-2.7.1
memmap2-0.5.10
memoffset-0.9.0
mimalloc-0.1.39
miniz_oxide-0.7.2
mio-0.8.11
miow-0.6.0
nix-0.26.4
nix-0.27.1
nohash-hasher-0.2.0
notify-6.1.1
nu-ansi-term-0.49.0
num-conv-0.1.0
num_cpus-1.16.0
object-0.32.2
object-0.33.0
once_cell-1.19.0
oorandom-11.1.3
parking_lot-0.12.1
parking_lot_core-0.9.9
paste-1.0.14
percent-encoding-2.3.1
perf-event-0.4.7
perf-event-open-sys-1.0.1
petgraph-0.6.4
pin-project-lite-0.2.13
powerfmt-0.2.0
ppv-lite86-0.2.17
proc-macro2-1.0.78
protobuf-3.2.0
protobuf-support-3.2.0
pulldown-cmark-0.9.6
pulldown-cmark-to-cmark-10.0.4
quote-1.0.35
ra-ap-rustc_abi-0.42.0
ra-ap-rustc_index-0.42.0
ra-ap-rustc_index_macros-0.42.0
ra-ap-rustc_lexer-0.42.0
ra-ap-rustc_parse_format-0.42.0
ra-ap-rustc_pattern_analysis-0.42.0
rand-0.8.5
rand_chacha-0.3.1
rand_core-0.6.4
rayon-1.9.0
rayon-core-1.12.1
redox_syscall-0.4.1
rowan-0.15.15
rustc-demangle-0.1.23
rustc-hash-1.1.0
rustc_apfloat-0.2.0+llvm-462a31f5a5ab
ryu-1.0.17
same-file-1.0.6
scip-0.3.3
scoped-tls-1.0.1
scopeguard-1.2.0
semver-1.0.22
serde-1.0.197
serde_derive-1.0.197
serde_json-1.0.114
serde_repr-0.1.18
sharded-slab-0.1.7
smallvec-1.13.1
smol_str-0.2.1
snap-1.1.1
stable_deref_trait-1.2.0
syn-2.0.52
synstructure-0.13.1
text-size-1.1.1
thiserror-1.0.57
thiserror-impl-1.0.57
thread_local-1.1.8
tikv-jemalloc-ctl-0.5.4
tikv-jemalloc-sys-0.5.4+5.3.0-patched
tikv-jemallocator-0.5.4
time-0.3.34
time-core-0.1.2
tinyvec-1.6.0
tinyvec_macros-0.1.1
tracing-0.1.40
tracing-attributes-0.1.27
tracing-core-0.1.32
tracing-log-0.2.0
tracing-subscriber-0.3.18
tracing-tree-0.3.0
triomphe-0.1.11
typed-arena-2.0.2
ungrammar-1.16.1
unicase-2.7.0
unicode-bidi-0.3.15
unicode-ident-1.0.12
unicode-normalization-0.1.23
unicode-properties-0.1.1
unicode-xid-0.2.4
url-2.5.0
valuable-0.1.0
version_check-0.9.4
walkdir-2.5.0
wasi-0.11.0+wasi-snapshot-preview1
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.6
winapi-x86_64-pc-windows-gnu-0.4.0
windows-sys-0.48.0
windows-sys-0.52.0
windows-targets-0.48.5
windows-targets-0.52.4
windows_aarch64_gnullvm-0.48.5
windows_aarch64_gnullvm-0.52.4
windows_aarch64_msvc-0.48.5
windows_aarch64_msvc-0.52.4
windows_i686_gnu-0.48.5
windows_i686_gnu-0.52.4
windows_i686_msvc-0.48.5
windows_i686_msvc-0.52.4
windows_x86_64_gnu-0.48.5
windows_x86_64_gnu-0.52.4
windows_x86_64_gnullvm-0.48.5
windows_x86_64_gnullvm-0.52.4
windows_x86_64_msvc-0.48.5
windows_x86_64_msvc-0.52.4
write-json-0.1.4
xflags-0.3.2
xflags-macros-0.3.2
xshell-0.2.5
xshell-macros-0.2.5
zip-0.6.6
"

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://api.github.com/repos/rust-lang/rust-analyzer/tarball/2024-03-11 -> rust-analyzer-20240311.tar.gz
	$(cargo_crate_uris ${CRATES})"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

BDEPEND="
	>=virtual/rust-1.45
"

DEPEND="${RDEPEND}"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/rust-lang-rust-analyzer-* ${S} || die
}

# To populate a custom version for rust-analyzer use the CFG_RELEASE environmental variable
# If this is not set rust-analyzer --version will return 0.0.0
# Upstream code reference: https://github.com/rust-lang/rust-analyzer/blob/master/crates/rust-analyzer/src/version.rs
src_install() {
	RUST_VERSION="$(rustc --version | awk {'print $2'})"
	CFG_RELEASE="$RUST_VERSION (2024-03-11-standalone-funtoo)" cargo_src_install --path "./crates/rust-analyzer"
	einstalldocs
}