import QtQuick

pragma Singleton

Item {

    readonly property string Expansfont: fontexpans.name

    FontLoader { id: fontexpans; source: "/font/expansiva/Expansiva.otf"  // Path to the custom font
    }

}
