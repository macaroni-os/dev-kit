# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Optimized primitives for collective multi-GPU communication"
HOMEPAGE="https://docs.nvidia.com/deeplearning/nccl/user-guide/docs/index.html"
SRC_URI="https://api.github.com/repos/NVIDIA/nccl/tarball/v2.30.3-1 -> nvidia-nccl-2.30.3.1-6da4220.tar.gz"
LICENSE="NOASSERTION"
SLOT="0"
KEYWORDS="*"
BDEPEND="dev-util/nvidia-cuda-toolkit
	
"

post_src_unpack() {
	mv NVIDIA-nccl-* ${S}
}



# vim: filetype=ebuild
