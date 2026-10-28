# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit eutils

DESCRIPTION="Oracle Instant Client SDK: development headers and demo makefiles for OCI consumers"
HOMEPAGE="https://www.oracle.com/database/technologies/instant-client/linux-x86-64-downloads.html"
SRC_URI="https://download.oracle.com/otn_software/linux/instantclient/2124000/instantclient-sdk-linux.x64-21.24.0.0.0dbru.zip -> instantclient-sdk-linux.x64-21.24.0.0.0dbru.zip"
LICENSE="OTN"
SLOT="0"
KEYWORDS="*"
PATCHES=(
	"${FILESDIR}/21.24-makefile.patch"
)
RDEPEND=">=dev-db/oracle-instantclient-basic-21.24.0.0.0
	
"
DEPEND="app-arch/unzip
	
"
S="${WORKDIR}/instantclient_21_24/"

src_install() {
	local ldpath=
	# all binaries go here
	local oracle_home=/usr/$(get_libdir)/oracle/21.24.0.0.0/client
	into "${oracle_home}"

	# runtime library path
	ldpath+=${ldpath:+:}${oracle_home}/$(get_libdir)

	einfo "Installing SDK ..."
	cd "${S}"/sdk || die

	# SDK makefile, for #165834
	# As we change the relative filesystem layout compared
	# to vanilla instantclient.zip content, it feels easier
	# to fake the layout found in Oracle eXpress Edition.
	# Both layouts are known to DBD::Oracle (cpan).
	insinto "${oracle_home}"/rdbms/demo
	newins demo/demo.mk demo_xe.mk

	# Remove ldap.h, #299562
	rm include/ldap.h || die
	# DBD::Oracle needs rdbms/public as real directory
	insinto "${oracle_home}"/rdbms/public
	doins include/*.h
	dosym rdbms/public "${oracle_home}"/include
	# ruby-oci8 expects the headers here
	dosym "${oracle_home}"/rdbms/public /usr/include/oracle/21.24.0.0.0/client

	dodoc demo/*

	eend $?
}


# vim: filetype=ebuild
