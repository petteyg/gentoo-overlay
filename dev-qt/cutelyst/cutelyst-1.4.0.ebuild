EAPI=6
PYTHON_COMPAT=( python3_{3,4,5} )

inherit cmake-utils

DESCRIPTION=""
HOMEPAGE="https://github.com/falkTX/cadence"
KEYWORDS="~x86 ~amd64"
SRC_URI="https://github.com/cutelyst/cutelyst/archive/r1.4.0.tar.gz -> cutelyst-1.4.0.tar.gz"
#EGIT_BRANCH="master"
#EGIT_REPO_URI="https://github.com/cutelyst/cutelyst.git"
IUSE="docs +test +uwsgi"

LICENSE="GPL-2"
SLOT="0"

RDEPEND=">=dev-qt/qtcore-5.6
	>=dev-qt/qtnetwork-5.6
	dev-libs/jemalloc
	uwsgi? ( www-servers/uwsgi )
	docs? ( app-doc/doxygen )"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}-r${PV}"

src_configure() {
	local mycmakeargs=()
	if ! use test; then
		mycmakeargs+=("-DBUILD_TESTS=FALSE")
	fi
	cmake-utils_src_configure
}
