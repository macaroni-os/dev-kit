# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit flag-o-matic toolchain-funcs

DESCRIPTION="Stand-alone build of libbpf from the Linux kernel"
HOMEPAGE="https://github.com/libbpf/libbpf"
SRC_URI="https://api.github.com/repos/libbpf/libbpf/tarball/v1.7.0 -> libbpf-1.7.0-f5dcbae.tar.gz"
LICENSE="GPL-2 LGPL-2.1 BSD-2"
SLOT="0/0.3"
KEYWORDS="*"
IUSE="+static-libs"
BDEPEND="virtual/pkgconfig
	
"
RDEPEND="virtual/libelf
	
"
DEPEND="${RDEPEND}
	sys-kernel/linux-headers
	
"
S="${WORKDIR}/libbpf-1.7.0/src"
post_src_unpack() {
	mv libbpf-libbpf-* libbpf-1.7.0
}
src_compile() {
	  append-cflags -fPIC
	  emake \
	      BUILD_SHARED=y \
	      LIBSUBDIR="$(get_libdir)" \
	      $(usex static-libs 'BUILD_STATIC=y' '' '' '') \
	      CC="$(tc-getCC)" \
	      AR="$(tc-getAR)" \
	      V=1
}
src_install() {
	  emake \
	      BUILD_SHARED=y \
	      LIBSUBDIR="$(get_libdir)" \
	      DESTDIR="${D}" \
	      $(usex static-libs 'BUILD_STATIC=y' '' '' '') \
	      install install_uapi_headers
	   insinto /usr/$(get_libdir)/pkgconfig
	  doins ${PN}.pc
	   # Avoid conflicts with sys-kernel/linux-headers
	  rm "${ED}"/usr/include/linux/{btf,bpf,bpf_common}.h -v
}


# vim: filetype=ebuild
