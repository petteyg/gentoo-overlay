EAPI=6
PYTHON_COMPAT=( python3_{3,4,5} )

inherit cmake-utils

DESCRIPTION=""
HOMEPAGE="https://github.com/falkTX/cadence"
KEYWORDS="~x86 ~amd64"
SRC_URI="https://github.com/cutelyst/cutelyst/archive/v${PV}.tar.gz -> cutelyst-${PV}.tar.gz"
#EGIT_BRANCH="master"
#EGIT_REPO_URI="https://github.com/cutelyst/cutelyst.git"
IUSE="docs +test +uwsgi"

LICENSE="GPL-2"
SLOT="0"

RDEPEND=">=dev-qt/qtcore-5.6
	>=dev-qt/qtnetwork-5.6
	>=dev-qt/qtscript-5.6
	>=dev-qt/qtsql-5.6
	dev-libs/grantlee
	dev-libs/jemalloc
	uwsgi? ( www-servers/uwsgi )
	docs? ( app-doc/doxygen )"
DEPEND="${RDEPEND}"

src_configure() {
	local mycmakeargs=()
	if ! use test; then
		mycmakeargs+=("-DBUILD_TESTS=FALSE")
	fi
	cmake-utils_src_configure
}
