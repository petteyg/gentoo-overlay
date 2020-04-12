# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=(python{3_6,3_7})

if [[ ${PV} == 9999* ]]; then
	EGIT_REPO_URI="https://github.com/robin-thoni/${PN}.git"
	inherit git-r3
else
	SRC_URI="https://github.com/robin-thoni/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~arm64 ~ppc64 ~x86"
fi

inherit distutils-r1

KEYWORDS="~amd64"
DESCRIPTION="Let's encrypt plugin to use DNS-01 authentication via net-dns/pdns"
HOMEPAGE="https://github.com/certbot/certbot"

LICENSE="Apache-2.0"
SLOT="0"
IUSE="test"
RESTRICT="!test? ( test )"

CDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="${CDEPEND}
	app-crypt/certbot[${PYTHON_USEDEP}]
	net-dns/pdns"
DEPEND="${CDEPEND}"

distutils_enable_tests pytest

src_prepare() {
	default
	# Fix installing configuration into /usr/etc
	# Remove if https://github.com/robin-thoni/certbot-pdns/pull/11 is merged
	sed -i -e 's|etc/lets|/etc/lets|' setup.py || die
}
