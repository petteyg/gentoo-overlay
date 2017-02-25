# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"

USE_PHP="php7-1"

inherit php-ext-pecl-r3

KEYWORDS="~amd64 ~x86"

DESCRIPTION="A PHP wrapper to Colin Percival's scrypt implementation"
LICENSE="BSD"
SLOT="7"
IUSE=""

DEPEND="${PHPUSEDEPEND}
	dev-libs/libsodium"
RDEPEND="${DEPEND}"

#src_test() {
#	for slot in $(php_get_slots); do
#		php_init_slot_env "${slot}"
#		NO_INTERACTION="yes" emake test
#	done
#}
