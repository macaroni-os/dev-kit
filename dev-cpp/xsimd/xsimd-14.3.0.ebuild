# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="C++ wrappers for SIMD intrinsics and parallelized, optimized mathematical functions (SSE, AVX, AVX512, NEON, SVE, WebAssembly, VSX, RISC-V))"
HOMEPAGE="https://github.com/xtensor-stack/xsimd"
SRC_URI="https://api.github.com/repos/xtensor-stack/xsimd/tarball/refs/tags/14.3.0 -> xsimd-14.3.0-e88a728.tar.gz"
LICENSE="BSD-3-Clause"
SLOT="0"
KEYWORDS="*"

post_src_unpack() {
	mv xtensor-stack-xsimd-* ${S}
}


src_configure() {
	local mycmakeargs=(
	  -DBUILD_TESTS=OFF
	)
	cmake_src_configure
}



# vim: filetype=ebuild
