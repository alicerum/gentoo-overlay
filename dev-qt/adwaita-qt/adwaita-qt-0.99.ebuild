EAPI=6

DESCRIPTION="Adwaita theme for qt"
HOMEPAGE="https://github.com/MartinBriza/adwaita-qt"
SRC_URI="https://github.com/MartinBriza/adwaita-qt/archive/${PV}.tar.gz"

SLOT="0"

LICENSE="GPL-2"

KEYWORDS="~amd64"

RDEPEND="dev-qt/qtgui:4
		 dev-qt/qtdbus:4"
DEPEND="${RDEPEND}"

src_configure() {
	mkdir build
	cd build
	cmake -DUSE_QT4=true -DCMAKE_INSTALL_PREFIX:PATH="${D}"/usr ..
}

src_install() {
	cd build
	emake DESTDIR="${D}" install
}

