# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
addr2line-0.19.0
adler-1.0.2
always-assert-0.1.3
anyhow-1.0.71
anymap-1.0.0-beta.2
arbitrary-1.3.0
arrayvec-0.7.4
atty-0.2.14
autocfg-1.1.0
backtrace-0.3.67
bitflags-1.3.2
bitflags-2.3.2
byteorder-1.4.3
camino-1.1.4
cargo-platform-0.1.2
cargo_metadata-0.15.4
cc-1.0.79
cfg-if-1.0.0
chalk-derive-0.92.0
chalk-ir-0.92.0
chalk-recursive-0.92.0
chalk-solve-0.92.0
command-group-2.1.0
countme-3.0.1
cov-mark-2.0.0-pre.1
crc32fast-1.3.2
crossbeam-channel-0.5.8
crossbeam-deque-0.8.3
crossbeam-epoch-0.9.15
crossbeam-utils-0.8.16
dashmap-5.4.0
derive_arbitrary-1.3.1
dissimilar-1.0.6
dot-0.1.4
drop_bomb-0.1.5
either-1.8.1
ena-0.14.2
equivalent-1.0.0
expect-test-1.4.1
filetime-0.2.22
fixedbitset-0.2.0
flate2-1.0.26
form_urlencoded-1.2.0
fsevent-sys-4.1.0
fst-0.4.7
gimli-0.27.3
hashbrown-0.12.3
hashbrown-0.14.0
heck-0.3.3
hermit-abi-0.1.19
hermit-abi-0.2.6
hkalbasi-rustc-ap-rustc_abi-0.0.20221221
hkalbasi-rustc-ap-rustc_index-0.0.20221221
home-0.5.5
idna-0.4.0
indexmap-1.9.3
indexmap-2.0.0
inotify-0.9.6
inotify-sys-0.1.5
instant-0.1.12
itertools-0.10.5
itoa-1.0.6
jod-thread-0.1.2
kqueue-1.0.7
kqueue-sys-1.0.3
la-arena-0.3.1
lazy_static-1.4.0
libc-0.2.146
libloading-0.8.0
libmimalloc-sys-0.1.33
line-index-0.1.0-pre.1
lock_api-0.4.10
log-0.4.19
lsp-server-0.7.4
lsp-types-0.94.0
memchr-2.5.0
memmap2-0.5.10
memoffset-0.8.0
memoffset-0.9.0
mimalloc-0.1.37
miniz_oxide-0.6.2
miniz_oxide-0.7.1
mio-0.8.5
miow-0.5.0
nix-0.26.2
nohash-hasher-0.2.0
notify-6.1.1
nu-ansi-term-0.46.0
num_cpus-1.15.0
object-0.30.4
object-0.32.0
once_cell-1.18.0
oorandom-11.1.3
overload-0.1.1
parking_lot-0.11.2
parking_lot-0.12.1
parking_lot_core-0.8.6
parking_lot_core-0.9.6
paste-1.0.12
percent-encoding-2.3.0
perf-event-0.4.7
perf-event-open-sys-1.0.1
petgraph-0.5.1
pin-project-lite-0.2.9
proc-macro2-1.0.60
protobuf-3.1.0
protobuf-support-3.1.0
pulldown-cmark-0.9.3
pulldown-cmark-to-cmark-10.0.4
quote-1.0.28
ra-ap-rustc_index-0.10.0
ra-ap-rustc_lexer-0.10.0
ra-ap-rustc_parse_format-0.10.0
rayon-1.7.0
rayon-core-1.11.0
redox_syscall-0.2.16
redox_syscall-0.3.5
rowan-0.15.11
rustc-demangle-0.1.23
rustc-hash-1.1.0
ryu-1.0.13
salsa-0.17.0-pre.2
salsa-macros-0.17.0-pre.2
same-file-1.0.6
scip-0.1.1
scoped-tls-1.0.1
scopeguard-1.1.0
semver-1.0.17
serde-1.0.156
serde_derive-1.0.156
serde_json-1.0.97
serde_repr-0.1.12
sharded-slab-0.1.4
smallvec-1.10.0
smol_str-0.2.0
snap-1.1.0
static_assertions-1.1.0
syn-1.0.109
syn-2.0.18
synstructure-0.13.0
text-size-1.1.0
thiserror-1.0.40
thiserror-impl-1.0.40
thread_local-1.1.7
tikv-jemalloc-ctl-0.5.0
tikv-jemalloc-sys-0.5.3+5.3.0-patched
tikv-jemallocator-0.5.0
time-0.3.22
time-core-0.1.1
tinyvec-1.6.0
tinyvec_macros-0.1.1
tracing-0.1.37
tracing-attributes-0.1.26
tracing-core-0.1.31
tracing-log-0.1.3
tracing-subscriber-0.3.17
tracing-tree-0.2.3
triomphe-0.1.8
typed-arena-2.0.2
ungrammar-1.16.1
unicase-2.6.0
unicode-bidi-0.3.13
unicode-ident-1.0.9
unicode-normalization-0.1.22
unicode-properties-0.1.0
unicode-segmentation-1.10.1
unicode-xid-0.2.4
url-2.4.0
valuable-0.1.0
version_check-0.9.4
walkdir-2.3.3
wasi-0.11.0+wasi-snapshot-preview1
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0
windows-sys-0.42.0
windows-sys-0.48.0
windows-targets-0.48.0
windows_aarch64_gnullvm-0.42.2
windows_aarch64_gnullvm-0.48.0
windows_aarch64_msvc-0.42.2
windows_aarch64_msvc-0.48.0
windows_i686_gnu-0.42.2
windows_i686_gnu-0.48.0
windows_i686_msvc-0.42.2
windows_i686_msvc-0.48.0
windows_x86_64_gnu-0.42.2
windows_x86_64_gnu-0.48.0
windows_x86_64_gnullvm-0.42.2
windows_x86_64_gnullvm-0.48.0
windows_x86_64_msvc-0.42.2
windows_x86_64_msvc-0.48.0
write-json-0.1.2
xflags-0.3.1
xflags-macros-0.3.1
xshell-0.2.3
xshell-macros-0.2.3
zip-0.6.6
"

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://api.github.com/repos/rust-lang/rust-analyzer/tarball/2023-09-18 -> rust-analyzer-20230918.tar.gz
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
	CFG_RELEASE="$RUST_VERSION (2023-09-18-standalone-funtoo)" cargo_src_install --path "./crates/rust-analyzer"
	einstalldocs
}