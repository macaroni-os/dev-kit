# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

EGO_SUM=(
	"github.com/a8m/envsubst v1.4.3"
	"github.com/a8m/envsubst v1.4.3/go.mod"
	"github.com/alecthomas/assert/v2 v2.11.0"
	"github.com/alecthomas/assert/v2 v2.11.0/go.mod"
	"github.com/alecthomas/participle/v2 v2.1.4"
	"github.com/alecthomas/participle/v2 v2.1.4/go.mod"
	"github.com/alecthomas/repr v0.4.0"
	"github.com/alecthomas/repr v0.4.0/go.mod"
	"github.com/cpuguy83/go-md2man/v2 v2.0.6/go.mod"
	"github.com/davecgh/go-spew v1.1.0"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/dimchansky/utfbom v1.1.1"
	"github.com/dimchansky/utfbom v1.1.1/go.mod"
	"github.com/elliotchance/orderedmap v1.8.0"
	"github.com/elliotchance/orderedmap v1.8.0/go.mod"
	"github.com/fatih/color v1.18.0"
	"github.com/fatih/color v1.18.0/go.mod"
	"github.com/goccy/go-json v0.10.5"
	"github.com/goccy/go-json v0.10.5/go.mod"
	"github.com/goccy/go-yaml v1.17.1"
	"github.com/goccy/go-yaml v1.17.1/go.mod"
	"github.com/hexops/gotextdiff v1.0.3"
	"github.com/hexops/gotextdiff v1.0.3/go.mod"
	"github.com/inconshreveable/mousetrap v1.1.0"
	"github.com/inconshreveable/mousetrap v1.1.0/go.mod"
	"github.com/jinzhu/copier v0.4.0"
	"github.com/jinzhu/copier v0.4.0/go.mod"
	"github.com/magiconair/properties v1.8.10"
	"github.com/magiconair/properties v1.8.10/go.mod"
	"github.com/mattn/go-colorable v0.1.14"
	"github.com/mattn/go-colorable v0.1.14/go.mod"
	"github.com/mattn/go-isatty v0.0.20"
	"github.com/mattn/go-isatty v0.0.20/go.mod"
	"github.com/pelletier/go-toml/v2 v2.2.4"
	"github.com/pelletier/go-toml/v2 v2.2.4/go.mod"
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
	"github.com/stretchr/testify v1.7.0"
	"github.com/stretchr/testify v1.7.0/go.mod"
	"github.com/yuin/gopher-lua v1.1.1"
	"github.com/yuin/gopher-lua v1.1.1/go.mod"
	"golang.org/x/net v0.40.0"
	"golang.org/x/net v0.40.0/go.mod"
	"golang.org/x/sys v0.6.0/go.mod"
	"golang.org/x/sys v0.33.0"
	"golang.org/x/sys v0.33.0/go.mod"
	"golang.org/x/text v0.25.0"
	"golang.org/x/text v0.25.0/go.mod"
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
SRC_URI="https://github.com/mikefarah/yq/tarball/b534aa9ee5d38001fba3cd8fe254a037e4847b37 -> yq-4.45.4-b534aa9.tar.gz
https://distfiles.macaronios.org/8e/2b/6d/8e2b6d15c2c2089437c7e71fd3c8e254e3c1ac57c3df81ce6532582d66ed72b676dec0aa1fe9c73733e8dc891cd1354bfdc2bba03c1ba339493911332d123dd6 -> yq-go-4.45.4-funtoo-go-bundle-35fc1888cca23a7d8df9de3c8af604725cbe0db3d697e371bae13884e8c1e12cde94ec9c14093e7065da75b6262c34d8a3dd1ee91fd8de977c223c7711b7ec4e.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"
S="${WORKDIR}/mikefarah-yq-b534aa9"

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