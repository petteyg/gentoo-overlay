EAPI=6

inherit git-r3 cmake-utils

DESCRIPTION=""
HOMEPAGE="https://github.com/steckdenis/qtorm"
SRC_URI=""
EGIT_BRANCH="master"
EGIT_REPO_URI="https://github.com/steckdenis/qtorm.git"
IUSE=""

LICENSE="GPL-2"
SLOT="0"

RDEPEND="dev-qt/qtcore:4
	dev-qt/qtsql:4"
DEPEND="${RDEPEND}"
