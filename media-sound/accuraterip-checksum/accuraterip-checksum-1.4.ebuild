EAPI=6

inherit git-r3

DESCRIPTION=""
HOMEPAGE="https://github.com/leo-bogert/accuraterip-checksum"
KEYWORDS="~x86 ~amd64"
SRC_URI=""
EGIT_COMMIT="version1.4"
EGIT_REPO_URI="https://github.com/leo-bogert/accuraterip-checksum.git"

LICENSE="GPL-1+"
SLOT="0"

RDEPEND="media-libs/libsndfile"
DEPEND="${RDEPEND}"

src_compile() {
	$(tc-getCC) ${LDFLAGS} ${CFLAGS} -I/usr/include --std=c99 -o ${PN} ${PN}.c || die
}
