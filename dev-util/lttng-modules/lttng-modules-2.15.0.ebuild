# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
BUILD_TARGETS="default"
MODULE_NAMES="true"
inherit linux-mod

DESCRIPTION="LTTng Kernel Tracer Modules"
HOMEPAGE="https://lttng.org"
SRC_URI="https://lttng.org/files/lttng-modules/lttng-modules-2.15.0.tar.bz2 -> lttng-modules-2.15.0.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
src_compile() {
	BUILD_FIXES="KERNELDIR=$KERNEL_DIR" linux-mod_src_compile
}
src_install() {
	for i in $(find "${S}" -name "*.ko" -print); do
	  local val=${i##${S}/}
	  local modules+="${val%%.ko}(misc:) "
	done
	MODULE_NAMES=${modules}
	linux-mod_src_install
	dodoc ChangeLog README.md
}


# vim: filetype=ebuild
