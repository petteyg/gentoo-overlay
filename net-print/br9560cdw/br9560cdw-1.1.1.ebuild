# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rpm

SRC_URI="https://download.brother.com/welcome/dlf006492/mfc9560cdwlpr-1.1.1-5.i386.rpm
https://download.brother.com/welcome/dlf006494/mfc9560cdwcupswrapper-1.1.1-5.i386.rpm"
KEYWORDS="~amd64 ~x86"

SLOT="0"
RDEPEND="net-print/br9560cdwlpr"
DEPEND="${RDEPEND}
	net-print/cups"

S="${WORKDIR}"

src_install() {
	dodir /usr/share/cups/model/brmfc9560cdw
	insinto /usr/share/cups/model/brmfc9560cdw
	doins usr/local/Brother/Printer/mfc9560cdw/cupswrapper/mfc9560cdw.ppd
	exeinto /usr/lib/cups/filter
	doexe ${FILESDIR}/brlpdwrappermfc9560cdw
	exeinto /usr/local/Brother/Printer/mfc9560cdw/cupswrapper
	doexe usr/local/Brother/Printer/mfc9560cdw/cupswrapper/brcupsconfpt1
}
