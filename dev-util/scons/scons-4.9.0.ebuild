# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )
DISTUTILS_USE_PEP517="setuptools"
inherit distutils-r1

DESCRIPTION="Extensible Python-based build utility"
HOMEPAGE="https://www.scons.org/"
SRC_URI="https://files.pythonhosted.org/packages/61/7e/79e07dc2eb8874580934cd0c834a8a78f15d5b0d6155a424f6c7b35441c3/scons-4.9.0.tar.gz -> scons-4.9.0.tar.gz"

DEPEND=""
IUSE=""
RESTRICT="test"
SLOT="0"
LICENSE="MIT"
KEYWORDS="*"
S="${WORKDIR}/SCons-4.9.0"

if [ "$PN"  == 'scons-compat' ]; then
	S="${WORKDIR}/scons-${PV}"
fi
python_install() {
	distutils-r1_python_install
	rm "${D}"/usr/*.1
	doman *.1

	if [ "$PN"  == 'scons-compat' ]; then
		rm -rf "${D}"/usr/bin
		find "${D}" -type d -name "man" -exec rm -rf \{\} \;
	fi

}
