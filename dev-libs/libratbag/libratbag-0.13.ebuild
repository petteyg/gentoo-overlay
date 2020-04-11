EAPI=7

PYTHON_COMPAT=( python3_{5,6,7} )

inherit meson python-r1 udev

DESCRIPTION="Library to configure gaming mice"
HOMEPAGE="https://github.com/libratbag/libratbag"
RESTRICT="nomirror"
SRC_URI="https://github.com/libratbag/libratbag/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc elogind systemd test"
REQUIRED_USE="^^ ( elogind systemd ) ${PYTHON_REQUIRED_USE}"

DEPEND="
	${PYTHON_DEPS}
	virtual/pkgconfig
	doc? ( app-doc/doxygen )
	elogind? ( sys-auth/elogind )
	systemd? ( sys-apps/systemd )
	dev-python/python-evdev[${PYTHON_USEDEP}]
	dev-lang/swig
	dev-libs/glib
	dev-libs/json-glib
	test? ( dev-util/valgrind )
"
RDEPEND="
	dev-libs/libevdev
	virtual/libudev
"

src_prepare() {
	default

	sed '/default:/d' -i meson_options.txt || die
}

src_configure() {
	if use elogind; then
		sed -e 's/include <systemd/include <logind/g' ratbagd/ratbag*.c
	fi
	python_setup
	local emesonargs=(
		-Dsystemd=$(usex systemd true false)
		-Dlogind-provider=$(usex systemd systemd elogind)
		-Ddocumentation=$(usex doc true false)
		-Dtests=$(usex test true false)
		-Dudev-dir=$(get_udevdir)
	)
	meson_src_configure
}
