
// SplashScreen.qml
import QtQuick
import QtQuick.Controls 2.15

Window {
    id: window_intro
    width: 1080
    height: 1940
    visible: true

    Rectangle {
        id: splashScreen
        width: parent.width
        height: parent.height
        color: "white"

        Image {
            id: intro
            x: 0
            y: 0
            width: parent.width
            height: parent.height
            source: "images/intro.png"
            fillMode: Image.PreserveAspectFit
        }
        BusyIndicator {
            id: busyAnimation
            x: (parent.width-parent.width / 4)/2
            y: parent.height-parent.width / 4

            width: parent.width / 5
            height: parent.width / 5
            running: true

            ColorAnimation {
                from: "blue"
                to: "red"
                duration: 200
            }
        }
    }
}
