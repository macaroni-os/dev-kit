# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

EGO_SUM=(
	"dario.cat/mergo v1.0.0"
	"dario.cat/mergo v1.0.0/go.mod"
	"github.com/!ada!logics/go-fuzz-headers v0.0.0-20230811130428-ced1acdcaa24"
	"github.com/!ada!logics/go-fuzz-headers v0.0.0-20230811130428-ced1acdcaa24/go.mod"
	"github.com/!alec!aivazis/survey/v2 v2.3.7"
	"github.com/!alec!aivazis/survey/v2 v2.3.7/go.mod"
	"github.com/!azure/go-ansiterm v0.0.0-20210617225240-d185dfc1b5a1"
	"github.com/!azure/go-ansiterm v0.0.0-20210617225240-d185dfc1b5a1/go.mod"
	"github.com/!masterminds/semver v1.5.0"
	"github.com/!masterminds/semver v1.5.0/go.mod"
	"github.com/!microsoft/go-winio v0.5.2/go.mod"
	"github.com/!microsoft/go-winio v0.6.1"
	"github.com/!microsoft/go-winio v0.6.1/go.mod"
	"github.com/!microsoft/hcsshim v0.11.4"
	"github.com/!microsoft/hcsshim v0.11.4/go.mod"
	"github.com/!netflix/go-expect v0.0.0-20220104043353-73e0943537d2"
	"github.com/!netflix/go-expect v0.0.0-20220104043353-73e0943537d2/go.mod"
	"github.com/!proton!mail/go-crypto v1.0.0"
	"github.com/!proton!mail/go-crypto v1.0.0/go.mod"
	"github.com/adrg/xdg v0.5.0"
	"github.com/adrg/xdg v0.5.0/go.mod"
	"github.com/andreaskoch/go-fswatch v1.0.0"
	"github.com/andreaskoch/go-fswatch v1.0.0/go.mod"
	"github.com/anmitsu/go-shlex v0.0.0-20200514113438-38f4b401e2be"
	"github.com/anmitsu/go-shlex v0.0.0-20200514113438-38f4b401e2be/go.mod"
	"github.com/armon/go-socks5 v0.0.0-20160902184237-e75332964ef5"
	"github.com/armon/go-socks5 v0.0.0-20160902184237-e75332964ef5/go.mod"
	"github.com/bwesterb/go-ristretto v1.2.3/go.mod"
	"github.com/cenkalti/backoff/v4 v4.3.0"
	"github.com/cenkalti/backoff/v4 v4.3.0/go.mod"
	"github.com/cloudflare/circl v1.3.3/go.mod"
	"github.com/cloudflare/circl v1.3.7"
	"github.com/cloudflare/circl v1.3.7/go.mod"
	"github.com/containerd/containerd v1.7.13"
	"github.com/containerd/containerd v1.7.13/go.mod"
	"github.com/containerd/log v0.1.0"
	"github.com/containerd/log v0.1.0/go.mod"
	"github.com/cpuguy83/go-md2man/v2 v2.0.4/go.mod"
	"github.com/creack/pty v1.1.17/go.mod"
	"github.com/creack/pty v1.1.21"
	"github.com/creack/pty v1.1.21/go.mod"
	"github.com/cyphar/filepath-securejoin v0.2.4"
	"github.com/cyphar/filepath-securejoin v0.2.4/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/distribution/reference v0.5.0"
	"github.com/distribution/reference v0.5.0/go.mod"
	"github.com/docker/cli v26.1.4+incompatible"
	"github.com/docker/cli v26.1.4+incompatible/go.mod"
	"github.com/docker/distribution v2.8.3+incompatible"
	"github.com/docker/distribution v2.8.3+incompatible/go.mod"
	"github.com/docker/docker v26.1.3+incompatible"
	"github.com/docker/docker v26.1.3+incompatible/go.mod"
	"github.com/docker/docker-credential-helpers v0.8.0"
	"github.com/docker/docker-credential-helpers v0.8.0/go.mod"
	"github.com/docker/go-connections v0.5.0"
	"github.com/docker/go-connections v0.5.0/go.mod"
	"github.com/docker/go-units v0.5.0"
	"github.com/docker/go-units v0.5.0/go.mod"
	"github.com/elazarl/goproxy v0.0.0-20230808193330-2592e75ae04a"
	"github.com/elazarl/goproxy v0.0.0-20230808193330-2592e75ae04a/go.mod"
	"github.com/emirpasic/gods v1.18.1"
	"github.com/emirpasic/gods v1.18.1/go.mod"
	"github.com/fatih/color v1.17.0"
	"github.com/fatih/color v1.17.0/go.mod"
	"github.com/felixge/httpsnoop v1.0.4"
	"github.com/felixge/httpsnoop v1.0.4/go.mod"
	"github.com/gliderlabs/ssh v0.3.7"
	"github.com/gliderlabs/ssh v0.3.7/go.mod"
	"github.com/go-git/gcfg v1.5.1-0.20230307220236-3a3c6141e376"
	"github.com/go-git/gcfg v1.5.1-0.20230307220236-3a3c6141e376/go.mod"
	"github.com/go-git/go-billy/v5 v5.5.0"
	"github.com/go-git/go-billy/v5 v5.5.0/go.mod"
	"github.com/go-git/go-git-fixtures/v4 v4.3.2-0.20231010084843-55a94097c399"
	"github.com/go-git/go-git-fixtures/v4 v4.3.2-0.20231010084843-55a94097c399/go.mod"
	"github.com/go-git/go-git/v5 v5.12.0"
	"github.com/go-git/go-git/v5 v5.12.0/go.mod"
	"github.com/go-logr/logr v1.2.2/go.mod"
	"github.com/go-logr/logr v1.4.1"
	"github.com/go-logr/logr v1.4.1/go.mod"
	"github.com/go-logr/stdr v1.2.2"
	"github.com/go-logr/stdr v1.2.2/go.mod"
	"github.com/gogo/protobuf v1.3.2"
	"github.com/gogo/protobuf v1.3.2/go.mod"
	"github.com/golang-jwt/jwt/v5 v5.2.1"
	"github.com/golang-jwt/jwt/v5 v5.2.1/go.mod"
	"github.com/golang/groupcache v0.0.0-20210331224755-41bb18bfe9da"
	"github.com/golang/groupcache v0.0.0-20210331224755-41bb18bfe9da/go.mod"
	"github.com/google/go-cmp v0.6.0"
	"github.com/google/go-cmp v0.6.0/go.mod"
	"github.com/google/shlex v0.0.0-20191202100458-e7afc7fbc510"
	"github.com/google/shlex v0.0.0-20191202100458-e7afc7fbc510/go.mod"
	"github.com/grpc-ecosystem/grpc-gateway/v2 v2.19.0"
	"github.com/grpc-ecosystem/grpc-gateway/v2 v2.19.0/go.mod"
	"github.com/hinshun/vt10x v0.0.0-20220119200601-820417d04eec"
	"github.com/hinshun/vt10x v0.0.0-20220119200601-820417d04eec/go.mod"
	"github.com/inconshreveable/mousetrap v1.1.0"
	"github.com/inconshreveable/mousetrap v1.1.0/go.mod"
	"github.com/jbenet/go-context v0.0.0-20150711004518-d14ea06fba99"
	"github.com/jbenet/go-context v0.0.0-20150711004518-d14ea06fba99/go.mod"
	"github.com/joho/godotenv v1.5.1"
	"github.com/joho/godotenv v1.5.1/go.mod"
	"github.com/julienschmidt/httprouter v1.3.0"
	"github.com/julienschmidt/httprouter v1.3.0/go.mod"
	"github.com/kballard/go-shellquote v0.0.0-20180428030007-95032a82bc51"
	"github.com/kballard/go-shellquote v0.0.0-20180428030007-95032a82bc51/go.mod"
	"github.com/kevinburke/ssh_config v1.2.0"
	"github.com/kevinburke/ssh_config v1.2.0/go.mod"
	"github.com/kisielk/errcheck v1.5.0/go.mod"
	"github.com/kisielk/gotool v1.0.0/go.mod"
	"github.com/klauspost/compress v1.17.4"
	"github.com/klauspost/compress v1.17.4/go.mod"
	"github.com/kr/pretty v0.1.0/go.mod"
	"github.com/kr/pretty v0.3.1"
	"github.com/kr/pretty v0.3.1/go.mod"
	"github.com/kr/pty v1.1.1/go.mod"
	"github.com/kr/text v0.1.0/go.mod"
	"github.com/kr/text v0.2.0"
	"github.com/kr/text v0.2.0/go.mod"
	"github.com/mattn/go-colorable v0.1.2/go.mod"
	"github.com/mattn/go-colorable v0.1.13"
	"github.com/mattn/go-colorable v0.1.13/go.mod"
	"github.com/mattn/go-isatty v0.0.8/go.mod"
	"github.com/mattn/go-isatty v0.0.16/go.mod"
	"github.com/mattn/go-isatty v0.0.20"
	"github.com/mattn/go-isatty v0.0.20/go.mod"
	"github.com/mattn/go-runewidth v0.0.15"
	"github.com/mattn/go-runewidth v0.0.15/go.mod"
	"github.com/mgutz/ansi v0.0.0-20170206155736-9520e82c474b"
	"github.com/mgutz/ansi v0.0.0-20170206155736-9520e82c474b/go.mod"
	"github.com/mitchellh/mapstructure v1.1.2"
	"github.com/mitchellh/mapstructure v1.1.2/go.mod"
	"github.com/moby/buildkit v0.13.2"
	"github.com/moby/buildkit v0.13.2/go.mod"
	"github.com/moby/docker-image-spec v1.3.1"
	"github.com/moby/docker-image-spec v1.3.1/go.mod"
	"github.com/moby/patternmatcher v0.6.0"
	"github.com/moby/patternmatcher v0.6.0/go.mod"
	"github.com/moby/sys/sequential v0.5.0"
	"github.com/moby/sys/sequential v0.5.0/go.mod"
	"github.com/moby/sys/user v0.1.0"
	"github.com/moby/sys/user v0.1.0/go.mod"
	"github.com/moby/term v0.5.0"
	"github.com/moby/term v0.5.0/go.mod"
	"github.com/morikuni/aec v1.0.0"
	"github.com/morikuni/aec v1.0.0/go.mod"
	"github.com/onsi/gomega v1.27.10"
	"github.com/onsi/gomega v1.27.10/go.mod"
	"github.com/opencontainers/go-digest v1.0.0"
	"github.com/opencontainers/go-digest v1.0.0/go.mod"
	"github.com/opencontainers/image-spec v1.1.0"
	"github.com/opencontainers/image-spec v1.1.0/go.mod"
	"github.com/opencontainers/selinux v1.11.0"
	"github.com/opencontainers/selinux v1.11.0/go.mod"
	"github.com/pjbgf/sha1cd v0.3.0"
	"github.com/pjbgf/sha1cd v0.3.0/go.mod"
	"github.com/pkg/errors v0.9.1"
	"github.com/pkg/errors v0.9.1/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/rhysd/actionlint v1.7.1"
	"github.com/rhysd/actionlint v1.7.1/go.mod"
	"github.com/rivo/uniseg v0.2.0/go.mod"
	"github.com/rivo/uniseg v0.4.7"
	"github.com/rivo/uniseg v0.4.7/go.mod"
	"github.com/robfig/cron/v3 v3.0.1"
	"github.com/robfig/cron/v3 v3.0.1/go.mod"
	"github.com/rogpeppe/go-internal v1.11.0"
	"github.com/rogpeppe/go-internal v1.11.0/go.mod"
	"github.com/russross/blackfriday/v2 v2.1.0/go.mod"
	"github.com/sabhiram/go-gitignore v0.0.0-20210923224102-525f6e181f06"
	"github.com/sabhiram/go-gitignore v0.0.0-20210923224102-525f6e181f06/go.mod"
	"github.com/sergi/go-diff v1.3.2-0.20230802210424-5b0b94c5c0d3"
	"github.com/sergi/go-diff v1.3.2-0.20230802210424-5b0b94c5c0d3/go.mod"
	"github.com/sirupsen/logrus v1.7.0/go.mod"
	"github.com/sirupsen/logrus v1.9.3"
	"github.com/sirupsen/logrus v1.9.3/go.mod"
	"github.com/skeema/knownhosts v1.2.2"
	"github.com/skeema/knownhosts v1.2.2/go.mod"
	"github.com/spf13/cobra v1.8.1"
	"github.com/spf13/cobra v1.8.1/go.mod"
	"github.com/spf13/pflag v1.0.5"
	"github.com/spf13/pflag v1.0.5/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/objx v0.4.0/go.mod"
	"github.com/stretchr/objx v0.5.0/go.mod"
	"github.com/stretchr/objx v0.5.2"
	"github.com/stretchr/objx v0.5.2/go.mod"
	"github.com/stretchr/testify v1.2.2/go.mod"
	"github.com/stretchr/testify v1.3.0/go.mod"
	"github.com/stretchr/testify v1.4.0/go.mod"
	"github.com/stretchr/testify v1.6.1/go.mod"
	"github.com/stretchr/testify v1.7.0/go.mod"
	"github.com/stretchr/testify v1.7.1/go.mod"
	"github.com/stretchr/testify v1.8.0/go.mod"
	"github.com/stretchr/testify v1.8.1/go.mod"
	"github.com/stretchr/testify v1.9.0"
	"github.com/stretchr/testify v1.9.0/go.mod"
	"github.com/timshannon/bolthold v0.0.0-20240314194003-30aac6950928"
	"github.com/timshannon/bolthold v0.0.0-20240314194003-30aac6950928/go.mod"
	"github.com/xanzy/ssh-agent v0.3.3"
	"github.com/xanzy/ssh-agent v0.3.3/go.mod"
	"github.com/xeipuuv/gojsonpointer v0.0.0-20180127040702-4e3ac2762d5f/go.mod"
	"github.com/xeipuuv/gojsonpointer v0.0.0-20190905194746-02993c407bfb"
	"github.com/xeipuuv/gojsonpointer v0.0.0-20190905194746-02993c407bfb/go.mod"
	"github.com/xeipuuv/gojsonreference v0.0.0-20180127040603-bd5ef7bd5415"
	"github.com/xeipuuv/gojsonreference v0.0.0-20180127040603-bd5ef7bd5415/go.mod"
	"github.com/xeipuuv/gojsonschema v1.2.0"
	"github.com/xeipuuv/gojsonschema v1.2.0/go.mod"
	"github.com/yuin/goldmark v1.1.27/go.mod"
	"github.com/yuin/goldmark v1.2.1/go.mod"
	"github.com/yuin/goldmark v1.4.13/go.mod"
	"go.etcd.io/bbolt v1.3.8/go.mod"
	"go.etcd.io/bbolt v1.3.10"
	"go.etcd.io/bbolt v1.3.10/go.mod"
	"go.etcd.io/gofail v0.1.0/go.mod"
	"go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp v0.50.0"
	"go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp v0.50.0/go.mod"
	"go.opentelemetry.io/otel v1.25.0"
	"go.opentelemetry.io/otel v1.25.0/go.mod"
	"go.opentelemetry.io/otel/exporters/otlp/otlptrace v1.25.0"
	"go.opentelemetry.io/otel/exporters/otlp/otlptrace v1.25.0/go.mod"
	"go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracehttp v1.25.0"
	"go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracehttp v1.25.0/go.mod"
	"go.opentelemetry.io/otel/metric v1.25.0"
	"go.opentelemetry.io/otel/metric v1.25.0/go.mod"
	"go.opentelemetry.io/otel/sdk v1.25.0"
	"go.opentelemetry.io/otel/sdk v1.25.0/go.mod"
	"go.opentelemetry.io/otel/trace v1.25.0"
	"go.opentelemetry.io/otel/trace v1.25.0/go.mod"
	"go.opentelemetry.io/proto/otlp v1.1.0"
	"go.opentelemetry.io/proto/otlp v1.1.0/go.mod"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
	"golang.org/x/crypto v0.0.0-20191011191535-87dc89f01550/go.mod"
	"golang.org/x/crypto v0.0.0-20200622213623-75b288015ac9/go.mod"
	"golang.org/x/crypto v0.0.0-20210921155107-089bfa567519/go.mod"
	"golang.org/x/crypto v0.0.0-20220622213112-05595931fe9d/go.mod"
	"golang.org/x/crypto v0.3.1-0.20221117191849-2c476679df9a/go.mod"
	"golang.org/x/crypto v0.7.0/go.mod"
	"golang.org/x/crypto v0.21.0"
	"golang.org/x/crypto v0.21.0/go.mod"
	"golang.org/x/mod v0.2.0/go.mod"
	"golang.org/x/mod v0.3.0/go.mod"
	"golang.org/x/mod v0.6.0-dev.0.20220419223038-86c51ed26bb4/go.mod"
	"golang.org/x/mod v0.8.0/go.mod"
	"golang.org/x/mod v0.13.0"
	"golang.org/x/mod v0.13.0/go.mod"
	"golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3/go.mod"
	"golang.org/x/net v0.0.0-20190620200207-3b0461eec859/go.mod"
	"golang.org/x/net v0.0.0-20200226121028-0de0cce0169b/go.mod"
	"golang.org/x/net v0.0.0-20201021035429-f5854403a974/go.mod"
	"golang.org/x/net v0.0.0-20210226172049-e18ecbb05110/go.mod"
	"golang.org/x/net v0.0.0-20211112202133-69e39bad7dc2/go.mod"
	"golang.org/x/net v0.0.0-20220722155237-a158d28d115b/go.mod"
	"golang.org/x/net v0.2.0/go.mod"
	"golang.org/x/net v0.6.0/go.mod"
	"golang.org/x/net v0.8.0/go.mod"
	"golang.org/x/net v0.23.0"
	"golang.org/x/net v0.23.0/go.mod"
	"golang.org/x/sync v0.0.0-20190423024810-112230192c58/go.mod"
	"golang.org/x/sync v0.0.0-20190911185100-cd5d95a43a6e/go.mod"
	"golang.org/x/sync v0.0.0-20201020160332-67f06af15bc9/go.mod"
	"golang.org/x/sync v0.0.0-20220722155255-886fb9371eb4/go.mod"
	"golang.org/x/sync v0.1.0/go.mod"
	"golang.org/x/sync v0.7.0"
	"golang.org/x/sync v0.7.0/go.mod"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
	"golang.org/x/sys v0.0.0-20190222072716-a9d3bda3a223/go.mod"
	"golang.org/x/sys v0.0.0-20190412213103-97732733099d/go.mod"
	"golang.org/x/sys v0.0.0-20191026070338-33540a1f6037/go.mod"
	"golang.org/x/sys v0.0.0-20200930185726-fdedc70b468f/go.mod"
	"golang.org/x/sys v0.0.0-20201119102817-f84b799fce68/go.mod"
	"golang.org/x/sys v0.0.0-20210124154548-22da62e12c0c/go.mod"
	"golang.org/x/sys v0.0.0-20210423082822-04245dca01da/go.mod"
	"golang.org/x/sys v0.0.0-20210615035016-665e8c7367d1/go.mod"
	"golang.org/x/sys v0.0.0-20210616094352-59db8d763f22/go.mod"
	"golang.org/x/sys v0.0.0-20220520151302-bc2c85ada10a/go.mod"
	"golang.org/x/sys v0.0.0-20220715151400-c0bba94af5f8/go.mod"
	"golang.org/x/sys v0.0.0-20220722155257-8c9f86f7a55f/go.mod"
	"golang.org/x/sys v0.0.0-20220811171246-fbc7d0a398ab/go.mod"
	"golang.org/x/sys v0.2.0/go.mod"
	"golang.org/x/sys v0.3.0/go.mod"
	"golang.org/x/sys v0.4.0/go.mod"
	"golang.org/x/sys v0.5.0/go.mod"
	"golang.org/x/sys v0.6.0/go.mod"
	"golang.org/x/sys v0.15.0/go.mod"
	"golang.org/x/sys v0.22.0"
	"golang.org/x/sys v0.22.0/go.mod"
	"golang.org/x/term v0.0.0-20201126162022-7de9c90e9dd1/go.mod"
	"golang.org/x/term v0.0.0-20210927222741-03fcf44c2211/go.mod"
	"golang.org/x/term v0.2.0/go.mod"
	"golang.org/x/term v0.5.0/go.mod"
	"golang.org/x/term v0.6.0/go.mod"
	"golang.org/x/term v0.22.0"
	"golang.org/x/term v0.22.0/go.mod"
	"golang.org/x/text v0.3.0/go.mod"
	"golang.org/x/text v0.3.3/go.mod"
	"golang.org/x/text v0.3.6/go.mod"
	"golang.org/x/text v0.3.7/go.mod"
	"golang.org/x/text v0.4.0/go.mod"
	"golang.org/x/text v0.7.0/go.mod"
	"golang.org/x/text v0.8.0/go.mod"
	"golang.org/x/text v0.14.0"
	"golang.org/x/text v0.14.0/go.mod"
	"golang.org/x/time v0.3.0"
	"golang.org/x/time v0.3.0/go.mod"
	"golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod"
	"golang.org/x/tools v0.0.0-20191119224855-298f0cb1881e/go.mod"
	"golang.org/x/tools v0.0.0-20200619180055-7c47624df98f/go.mod"
	"golang.org/x/tools v0.0.0-20210106214847-113979e3529a/go.mod"
	"golang.org/x/tools v0.1.12/go.mod"
	"golang.org/x/tools v0.6.0/go.mod"
	"golang.org/x/tools v0.14.0"
	"golang.org/x/tools v0.14.0/go.mod"
	"golang.org/x/xerrors v0.0.0-20190717185122-a985d3407aa7/go.mod"
	"golang.org/x/xerrors v0.0.0-20191011141410-1b5146add898/go.mod"
	"golang.org/x/xerrors v0.0.0-20191204190536-9bdfabe68543/go.mod"
	"golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1/go.mod"
	"google.golang.org/genproto v0.0.0-20231016165738-49dd2c1f3d0b"
	"google.golang.org/genproto/googleapis/api v0.0.0-20240227224415-6ceb2ff114de"
	"google.golang.org/genproto/googleapis/api v0.0.0-20240227224415-6ceb2ff114de/go.mod"
	"google.golang.org/genproto/googleapis/rpc v0.0.0-20240401170217-c3f982113cda"
	"google.golang.org/genproto/googleapis/rpc v0.0.0-20240401170217-c3f982113cda/go.mod"
	"google.golang.org/grpc v1.63.0"
	"google.golang.org/grpc v1.63.0/go.mod"
	"google.golang.org/protobuf v1.34.2"
	"google.golang.org/protobuf v1.34.2/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/check.v1 v1.0.0-20190902080502-41f04d3bba15/go.mod"
	"gopkg.in/check.v1 v1.0.0-20201130134442-10cb98267c6c"
	"gopkg.in/check.v1 v1.0.0-20201130134442-10cb98267c6c/go.mod"
	"gopkg.in/warnings.v0 v0.1.2"
	"gopkg.in/warnings.v0 v0.1.2/go.mod"
	"gopkg.in/yaml.v2 v2.2.2/go.mod"
	"gopkg.in/yaml.v2 v2.4.0"
	"gopkg.in/yaml.v2 v2.4.0/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c/go.mod"
	"gopkg.in/yaml.v3 v3.0.1"
	"gopkg.in/yaml.v3 v3.0.1/go.mod"
	"gotest.tools/v3 v3.5.1"
	"gotest.tools/v3 v3.5.1/go.mod"
)

go-module_set_globals

DESCRIPTION="Run your GitHub Actions locally"
HOMEPAGE="https://github.com/nektos/act"
SRC_URI="https://github.com/nektos/act/tarball/a8c5651f639fd46ef4b09916f90b1de0223aea55 -> act-0.2.65-a8c5651.tar.gz
https://distfiles.macaronios.org/30/84/01/3084017f116e5bcca466c3ac9342c6eacb277b48ddcaa5542ca14830e6d93f2081fd168802f5b12d0cbe80c7ae4dc73c9bb93ec0d5a8604f101b0176993682ae -> act-0.2.65-funtoo-go-bundle-b9333ea7baee62160eb0468e57902db11692079fab6501b662967d93b2668bb4d282450f81bd798074128340708fabfa349e00b30aefdfb862677c2af4d3375f.tar.gz"

RDEPEND="
	app-emulation/docker
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

post_src_unpack() {
	mv ${WORKDIR}/nektos-act-* ${S} || die
}

src_compile() {
	go build \
		-ldflags "-X main.version=${PV}" \
		-mod=mod \
		-o ${PN} \
		main.go || die "compile failed"
}

src_install() {
	dobin ${PN}
	dodoc README.md
}