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
            id: dashboardbtn
            property color backgroundDefaultColor: "#4E5BF2"
            property color backgroundPressedColor: Qt.darker(backgroundDefaultColor, 1.2)
            property color contentItemTextColor: "white"

            text: "Dashboard"
            onClicked: {
                stackView.push(Qt.resolvedUrl("Dashboard.qml"))
            }
            contentItem: Text {
                text: dashboardbtn.text
                color: dashboardbtn.contentItemTextColor
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
                color: dashboardbtn.down ? dashboardbtn.backgroundPressedColor : dashboardbtn.backgroundDefaultColor
                radius: 3
                layer.enabled: true
                layer.effect: DropShadow {
                    transparentBorder: true
                    color: dashboardbtn.down ? dashboardbtn.backgroundPressedColor : dashboardbtn.backgroundDefaultColor
                    samples: 20
                }
            }
        }
        Button {
            id: navigationcontrolbtn
            property color backgroundDefaultColor: "#0ACF97"
            property color backgroundPressedColor: Qt.darker(backgroundDefaultColor, 1.2)
            property color contentItemTextColor: "white"

            text: "Navigation Control"
            onClicked: {
                stackView.push(Qt.resolvedUrl("NavigationControl.qml"))
            }
            contentItem: Text {
                text: navigationcontrolbtn.text
                color: navigationcontrolbtn.contentItemTextColor
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
                color: navigationcontrolbtn.down ? navigationcontrolbtn.backgroundPressedColor : navigationcontrolbtn.backgroundDefaultColor
                radius: 3
                layer.enabled: true
                layer.effect: DropShadow {
                    transparentBorder: true
                    color: navigationcontrolbtn.down ? navigationcontrolbtn.backgroundPressedColor : navigationcontrolbtn.backgroundDefaultColor
                    samples: 20
                }
            }
        }
        Button {
            id: camerastreamingbtn
            property color backgroundDefaultColor: "#F9375E"
            property color backgroundPressedColor: Qt.darker(backgroundDefaultColor, 1.2)
            property color contentItemTextColor: "white"

            text: "Camera Streaming"
            onClicked: {
                stackView.push(Qt.resolvedUrl("camerastreaming.qml"))
            }
            contentItem: Text {
                text: camerastreamingbtn.text
                color: camerastreamingbtn.contentItemTextColor
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
                color: camerastreamingbtn.down ? camerastreamingbtn.backgroundPressedColor : camerastreamingbtn.backgroundDefaultColor
                radius: 3
                layer.enabled: true
                layer.effect: DropShadow {
                    transparentBorder: true
                    color: camerastreamingbtn.down ? camerastreamingbtn.backgroundPressedColor : camerastreamingbtn.backgroundDefaultColor
                    samples: 20
                }
            }
        }
        Button {
            id: ultrasonsensorbtn
            property color backgroundDefaultColor: "#4E5BF2"
            property color backgroundPressedColor: Qt.darker(backgroundDefaultColor, 1.2)
            property color contentItemTextColor: "white"

            text: "UltrasonSensor"
            onClicked: {
                stackView.push(Qt.resolvedUrl("UltrasonSensor.qml"))
            }
            contentItem: Text {
                text: ultrasonsensorbtn.text
                color: ultrasonsensorbtn.contentItemTextColor
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
                color: ultrasonsensorbtn.down ? ultrasonsensorbtn.backgroundPressedColor : ultrasonsensorbtn.backgroundDefaultColor
                radius: 3
                layer.enabled: true
                layer.effect: DropShadow {
                    transparentBorder: true
                    color: ultrasonsensorbtn.down ? ultrasonsensorbtn.backgroundPressedColor : ultrasonsensorbtn.backgroundDefaultColor
                    samples: 20
                }
            }
        }
    }
}
