import QtQuick

pragma Singleton

Item {

    readonly property string Expansfont: fontexpans.name
    readonly property string ExpansfontI: fontexpansI.name
    readonly property string ExpansfontB: fontexpansB.name
    readonly property string ExpansfontBI: fontexpansBI.name

    FontLoader { id: fontexpans; source: "/font/expansiva/Expansiva.otf" } // Path to the custom font
    FontLoader { id: fontexpansI; source: "/font/expansiva/Expansiva italic.otf"}
    FontLoader { id: fontexpansB; source: "/font/expansiva/Expansiva bold.otf"}
    FontLoader { id: fontexpansBI; source: "/font/expansiva/Expansiva bold italic.otf"

    }

}

