import QtQuick 2.15
import QtQuick.Controls 2.15


Rectangle {
    id: root
    color: "#546472"
    property var destinationCoordinates: null
    property int batteryLevel: 50
    property double endingLatitude: 35.82539
    property double endingLongitude: 10.63699

    NavBar {
        id: bottomBar
        anchors {
            left: root.left
            right: root.right
            bottom: root.bottom
        }
    }
    Rectangle {
        id: rightScreen
        width: root.width * 2 / 3
        anchors {
            top: root.top
            bottom: bottomBar.top
            right: root.right
            margins: 20
        }
        color: "#546472"
        // MAP AREA
        Map {
            id: mapArea
        }
        // WEATHER AREA
        Rectangle {
            id: weatherArea
            width: (rightScreen.width / 2) - 10
            height: (rightScreen.height * 1 / 4) - 15
            color: "#A1CD3C"
            radius: 20
            anchors {
                right: rightScreen.right
                bottom: rightScreen.bottom
            }
        }
        // MUSIC AREA
        Rectangle {
            id: musicArea
            width: (rightScreen.width / 2) - 10
            height: (rightScreen.height * 1 / 4) - 15
            anchors{
                left: rightScreen.left
                bottom: rightScreen.bottom
            }
            radius: 20
            color: "#A1CD3C"
            MusicPlayer {
                id: musicPlayer
            }
        }
    }
    // INFORMATION AREA
    Info {
        id: leftScreen
    }
}
