# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

EGO_SUM=(
	"github.com/a8m/envsubst v1.4.2"
	"github.com/a8m/envsubst v1.4.2/go.mod"
	"github.com/alecthomas/assert/v2 v2.11.0"
	"github.com/alecthomas/assert/v2 v2.11.0/go.mod"
	"github.com/alecthomas/participle/v2 v2.1.4"
	"github.com/alecthomas/participle/v2 v2.1.4/go.mod"
	"github.com/alecthomas/repr v0.4.0"
	"github.com/alecthomas/repr v0.4.0/go.mod"
	"github.com/cpuguy83/go-md2man/v2 v2.0.6/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/dimchansky/utfbom v1.1.1"
	"github.com/dimchansky/utfbom v1.1.1/go.mod"
	"github.com/elliotchance/orderedmap v1.8.0"
	"github.com/elliotchance/orderedmap v1.8.0/go.mod"
	"github.com/fatih/color v1.18.0"
	"github.com/fatih/color v1.18.0/go.mod"
	"github.com/gabriel-vasile/mimetype v1.4.3"
	"github.com/gabriel-vasile/mimetype v1.4.3/go.mod"
	"github.com/go-playground/locales v0.14.1"
	"github.com/go-playground/locales v0.14.1/go.mod"
	"github.com/go-playground/universal-translator v0.18.1"
	"github.com/go-playground/universal-translator v0.18.1/go.mod"
	"github.com/go-playground/validator/v10 v10.22.1"
	"github.com/go-playground/validator/v10 v10.22.1/go.mod"
	"github.com/goccy/go-json v0.10.5"
	"github.com/goccy/go-json v0.10.5/go.mod"
	"github.com/goccy/go-yaml v1.13.3"
	"github.com/goccy/go-yaml v1.13.3/go.mod"
	"github.com/google/go-cmp v0.6.0"
	"github.com/google/go-cmp v0.6.0/go.mod"
	"github.com/hexops/gotextdiff v1.0.3"
	"github.com/hexops/gotextdiff v1.0.3/go.mod"
	"github.com/inconshreveable/mousetrap v1.1.0"
	"github.com/inconshreveable/mousetrap v1.1.0/go.mod"
	"github.com/jinzhu/copier v0.4.0"
	"github.com/jinzhu/copier v0.4.0/go.mod"
	"github.com/leodido/go-urn v1.4.0"
	"github.com/leodido/go-urn v1.4.0/go.mod"
	"github.com/magiconair/properties v1.8.10"
	"github.com/magiconair/properties v1.8.10/go.mod"
	"github.com/mattn/go-colorable v0.1.13"
	"github.com/mattn/go-colorable v0.1.13/go.mod"
	"github.com/mattn/go-isatty v0.0.16/go.mod"
	"github.com/mattn/go-isatty v0.0.20"
	"github.com/mattn/go-isatty v0.0.20/go.mod"
	"github.com/pelletier/go-toml/v2 v2.2.3"
	"github.com/pelletier/go-toml/v2 v2.2.3/go.mod"
	"github.com/pkg/diff v0.0.0-20210226163009-20ebb0f2a09e"
	"github.com/pkg/diff v0.0.0-20210226163009-20ebb0f2a09e/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/russross/blackfriday/v2 v2.1.0/go.mod"
	"github.com/spf13/cobra v1.9.1"
	"github.com/spf13/cobra v1.9.1/go.mod"
	"github.com/spf13/pflag v1.0.6"
	"github.com/spf13/pflag v1.0.6/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/testify v1.7.0/go.mod"
	"github.com/stretchr/testify v1.9.0"
	"github.com/stretchr/testify v1.9.0/go.mod"
	"github.com/yuin/gopher-lua v1.1.1"
	"github.com/yuin/gopher-lua v1.1.1/go.mod"
	"golang.org/x/crypto v0.37.0"
	"golang.org/x/crypto v0.37.0/go.mod"
	"golang.org/x/net v0.39.0"
	"golang.org/x/net v0.39.0/go.mod"
	"golang.org/x/sys v0.0.0-20220811171246-fbc7d0a398ab/go.mod"
	"golang.org/x/sys v0.6.0/go.mod"
	"golang.org/x/sys v0.32.0"
	"golang.org/x/sys v0.32.0/go.mod"
	"golang.org/x/text v0.24.0"
	"golang.org/x/text v0.24.0/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/op/go-logging.v1 v1.0.0-20160211212156-b2cb9fa56473"
	"gopkg.in/op/go-logging.v1 v1.0.0-20160211212156-b2cb9fa56473/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c/go.mod"
	"gopkg.in/yaml.v3 v3.0.1"
	"gopkg.in/yaml.v3 v3.0.1/go.mod"
)

go-module_set_globals

DESCRIPTION="yq is a portable command-line YAML, JSON and XML processor"
HOMEPAGE="https://github.com/mikefarah/yq"
SRC_URI="https://github.com/mikefarah/yq/tarball/c59fa8de59f1f5a16fdbfd1e2a6e97a1b42a64b9 -> yq-4.45.2-c59fa8d.tar.gz
https://distfiles.macaronios.org/34/9e/d9/349ed9d7bd84b32733e71a65d3cf2cf25971744f6a5a3ffa0c630d9f580eef966809746d49deba7ed7541f5cf6a18b7dc9d970a4a7ffc98eb6f41d0b3f92aedb -> yq-go-4.45.2-funtoo-go-bundle-db91b6eb5f244ff4f6e56a5c601152088253ad5235e15cde41b6787f871d1310e6bb7a2f0f122ece39271afbd04df471882264638bcf4058aef365611f753139.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"
S="${WORKDIR}/mikefarah-yq-c59fa8d"

DEPEND=""
RDEPEND=""
BDEPEND=">=dev-lang/go-1.16.14"

src_compile() {
	# The default yq go binary will conflict with python-modules-kit's app-misc/yq, which also has a yq executable installed to /usr/bin/yq
	# For now until a decision is made regarding app-misc/yq, yq-go will be used as the binary name to avoid any collisions
	go build -o bin/yq4 || die "compile failed"
}

src_install() {
	dobin bin/yq4
	dodoc README.md
}