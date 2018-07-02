EAPI=6
PYTHON_COMPAT=( python3_{3,4,5} )

inherit python-r1

DESCRIPTION=""
HOMEPAGE="https://github.com/falkTX/cadence"
KEYWORDS="~x86 ~amd64"
SRC_URI="https://github.com/falkTX/Cadence/archive/v0.9.0.tar.gz"
IUSE="midi +pulseaudio"
RESTRICT="nomirror"

S="${WORKDIR}/Cadence-0.9.0"

LICENSE="GPL-2"
SLOT="0"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"
RDEPEND="${PYTHON_DEPS}
	dev-python/PyQt5[${PYTHON_USEDEP}]
	midi? ( media-sound/a2jmidid )
	media-sound/jack2
	pulseaudio? ( media-sound/pulseaudio[jack] )"
DEPEND="${RDEPEND}"
