EAPI=6
PYTHON_COMPAT=( python3_{3,4,5} )

inherit git-r3 python-r1

DESCRIPTION=""
HOMEPAGE="https://github.com/falkTX/cadence"
SRC_URI=""
EGIT_BRANCH="master"
EGIT_REPO_URI="https://github.com/falkTX/cadence.git"
IUSE="midi +pulseaudio"

LICENSE="GPL-2"
SLOT="0"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"
RDEPEND="${PYTHON_DEPS}
	dev-python/PyQt4[${PYTHON_USEDEP}]
	midi? ( media-sound/a2jmidid )
	media-sound/jack2
	pulseaudio? ( media-sound/pulseaudio[jack] )"
DEPEND="${RDEPEND}"
