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

DESCRIPTION="Let's encrypt plugin to use DNS-01 authentication via net-dns/pdns"
HOMEPAGE="https://github.com/certbot/certbot https://letsencrypt.org/"

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
	sed -i -e 's|etc/lets|/etc/lets|' setup.py
}

python_prepare_all() {
	# required as deps of deps can trigger this too...
	echo '    ignore:.*collections\.abc:DeprecationWarning' >> ../pytest.ini
	distutils-r1_python_prepare_all
}
