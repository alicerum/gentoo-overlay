EAPI=6

inherit cmake-utils eutils

SRC_URI="https://github.com/Mudlet/Mudlet/archive/Mudlet-${PV}.tar.gz"
DESCRIPTION="Mudlet is a quality MUD client, designed to take mudding to a new level"
HOMEPAGE="http://www.mudlet.org/"

SLOT="0"
LICENSE="GPL-2"

KEYWORDS="amd64"

S="${WORKDIR}/Mudlet-Mudlet-${PV}"

RDEPEND="dev-libs/yajl
         dev-libs/libzip
	     dev-lang/lua
	     app-text/hunspell
	     dev-qt/qtcore:5
	     dev-qt/qtmultimedia:5
		 dev-qt/qtopengl:5"

DEPEND="${RDEPEND}
        dev-qt/designer"

src_prepare() {
	epatch "${FILESDIR}"/${P}-lua-global.patch \
		"${FILESDIR}"/${P}-lua-path.patch

	eapply_user
}

src_install() {
	mkdir -p "${D}"/usr/bin
	mkdir -p "${D}"/usr/share/pixmaps
	mkdir -p "${D}"/usr/share/applications
	mkdir -p "${D}"/usr/share/mudlet/mudlet-lua

	cp "${BUILD_DIR}"/src/mudlet "${D}"/usr/bin
	cp -r "${S}"/src/mudlet-lua/lua "${D}"/usr/share/mudlet/mudlet-lua
	cp "${S}"/src/icons/mudlet.png "${D}"/usr/share/pixmaps
	cp "${S}"/mudlet.desktop "${D}"/usr/share/applications
}
