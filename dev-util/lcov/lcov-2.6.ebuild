# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7

DESCRIPTION="Linux Test Project GUI for gcov: capture, merge and generate coverage reports"
HOMEPAGE="https://github.com/linux-test-project/lcov"
SRC_URI="https://api.github.com/repos/linux-test-project/lcov/tarball/refs/tags/v2.6 -> lcov-2.6-a17443e.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
RDEPEND="dev-lang/perl
	dev-perl/Capture-Tiny
	dev-perl/DateTime
	dev-perl/Devel-StackTrace
	dev-perl/Module-Runtime
	dev-perl/TimeDate
	
"

post_src_unpack() {
	mv linux-test-project-lcov-* ${S}
}


src_prepare() {
	default
	# GitHub tag archives lack the release-generated .version file
	# (only the `make dist` tarball/RPM ship it); without it the
	# Makefile's bin/get_version.sh falls back to a hardcoded 2.5.0
	# and mislabels the installed scripts. Recreate it for the built
	# PV (same failure class as unifdef in this kit).
	if [ ! -f .version ] ; then
	  printf 'VERSION="2.6"\nRELEASE="0"\nFULL="2.6-0"\n' > .version || die
	fi
}

src_install() {
	emake install DESTDIR="${D}" PREFIX="${EPREFIX}/usr" LCOV_NO_DOC=1 LCOV_NO_XS=1
}



# vim: filetype=ebuild
