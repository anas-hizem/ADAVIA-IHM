// NavBar.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.0
import QtGraphicalEffects 1.15
Rectangle {
    id: bottomBar
    width: parent.width
    height: parent.height / 12
    color: 'black'
    Row {
        spacing: 20
        anchors.centerIn: parent
        Button {
            id: navbtn
            property color backgroundDefaultColor: "#4E5BF2"
            property color backgroundPressedColor: Qt.darker(backgroundDefaultColor, 1.2)
            property color contentItemTextColor: "white"

            text: "Dashboard"
            onClicked: {
                stackView.push(Qt.resolvedUrl("Dashboard.qml"))
            }
            contentItem: Text {
                text: navbtn.text
                color: navbtn.contentItemTextColor
                font.pixelSize: 15
                font.family: "Arial"
                font.weight: Font.Thin
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 83
                implicitHeight: 37
                color: navbtn.down ? navbtn.backgroundPressedColor : navbtn.backgroundDefaultColor
                radius: 3
                layer.enabled: true
                layer.effect: DropShadow {
                    transparentBorder: true
                    color: navbtn.down ? navbtn.backgroundPressedColor : navbtn.backgroundDefaultColor
                    samples: 20
                }
            }
        }
        Button {
            id: camerabtn
            property color backgroundDefaultColor: "#0ACF97"
            property color backgroundPressedColor: Qt.darker(backgroundDefaultColor, 1.2)
            property color contentItemTextColor: "white"

            text: "Navigation Control"
            onClicked: {
                stackView.push(Qt.resolvedUrl("NavigationControl.qml"))
            }
            contentItem: Text {
                text: camerabtn.text
                color: camerabtn.contentItemTextColor
                font.pixelSize: 15
                font.family: "Arial"
                font.weight: Font.Thin
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 83
                implicitHeight: 37
                color: camerabtn.down ? camerabtn.backgroundPressedColor : camerabtn.backgroundDefaultColor
                radius: 3
                layer.enabled: true
                layer.effect: DropShadow {
                    transparentBorder: true
                    color: camerabtn.down ? camerabtn.backgroundPressedColor : camerabtn.backgroundDefaultColor
                    samples: 20
                }
            }
        }
        Button {
            id: sensorDatabtn
            property color backgroundDefaultColor: "#F9375E"
            property color backgroundPressedColor: Qt.darker(backgroundDefaultColor, 1.2)
            property color contentItemTextColor: "white"

            text: "Sensor Data"
            onClicked: {
                stackView.push(Qt.resolvedUrl("test.qml"))
            }
            contentItem: Text {
                text: sensorDatabtn.text
                color: sensorDatabtn.contentItemTextColor
                font.pixelSize: 15
                font.family: "Arial"
                font.weight: Font.Thin
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 83
                implicitHeight: 37
                color: sensorDatabtn.down ? sensorDatabtn.backgroundPressedColor : sensorDatabtn.backgroundDefaultColor
                radius: 3
                layer.enabled: true
                layer.effect: DropShadow {
                    transparentBorder: true
                    color: sensorDatabtn.down ? sensorDatabtn.backgroundPressedColor : sensorDatabtn.backgroundDefaultColor
                    samples: 20
                }
            }
        }
    }
}
