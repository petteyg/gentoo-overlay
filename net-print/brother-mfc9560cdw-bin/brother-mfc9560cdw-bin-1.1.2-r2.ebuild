# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rpm

DESCRIPTION="Brother printer driver for MFC-9560CDW"
HOMEPAGE="http://support.brother.com"
SRC_URI="http://download.brother.com/welcome/dlf006492/mfc9560cdwlpr-1.1.1-5.i386.rpm
http://download.brother.com/welcome/dlf006494/mfc9560cdwcupswrapper-1.1.1-5.i386.rpm"

#http://download.brother.com/welcome/dlf007026/mfc9340cdwlpr-1.1.2-1.i386.rpm
#http://download.brother.com/welcome/dlf007028/mfc9340cdwcupswrapper-1.1.4-0.i386.rpm

LICENSE="brother-eula"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="net-print/cups"
RDEPEND="${DEPEND}"

RESTRICT="mirror strip"

S="${WORKDIR}"

src_unpack() {
	rpm_unpack ${A}
}

src_install() {
	local printer="mfc9560cdw"

	has_multilib_profile && ABI=x86

	insinto /usr/local/Brother/Printer/${printer}
	doins -r "${S}"/usr/local/Brother/Printer/${printer}/inf

	exeinto /usr/local/Brother/Printer/${printer}/lpd
	doexe "${S}"/usr/local/Brother/Printer/${printer}/lpd/*

	# Install wrapping tools for CUPS
	exeinto /usr/local/Brother/Printer/${printer}/cupswrapper
	doexe "${S}"/usr/local/Brother/Printer/${printer}/cupswrapper/brcupsconfpt1
	doins "${S}"/usr/local/Brother/Printer/${printer}/cupswrapper/${printer}.ppd

	# Printer configuration utility
	dobin "${S}"/usr/bin/brprintconf_${printer}

	exeinto usr/libexec/cups/filter
	doexe "${FILESDIR}"/brlpdwrapper${printer}
}
