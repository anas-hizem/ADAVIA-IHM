import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15

Rectangle {
    width: 1280
    height: 720
    color: "#f0f0f0"

    // Barre supérieure avec 4 boutons
    Rectangle {
        id: topbar
        width: parent.width
        height: 50
        color: "#333333"

        RowLayout {
            anchors.centerIn: parent
            spacing: 10

            Button {
                text: "Button 1"
                onClicked: console.log("Button 1 clicked")
            }
            Button {
                text: "Button 2"
                onClicked: console.log("Button 2 clicked")
            }
            Button {
                text: "Button 3"
                onClicked: console.log("Button 3 clicked")
            }
            Button {
                text: "Button 4"
                onClicked: console.log("Button 4 clicked")
            }
        }
    }

    // Champs regroupés dans un grand rectangle
    Rectangle {
        id: bottombar
        width: parent.width
        height: parent.height - topbar.height * 2
        anchors.top: topbar.bottom

        Rectangle {
            id: champs1
            width: bottombar.width / 2
            height: bottombar.height / 2
            color: "#FFD700"
            anchors.left: bottombar.left
            anchors.top: bottombar.top
        }
        Rectangle {
            id: champs2
            width: bottombar.width / 2
            height: bottombar.height / 2
            color: "#87CEEB"
            anchors.right: bottombar.right
            anchors.top: bottombar.top
        }
        Rectangle {
            id: champs3
            width: bottombar.width / 2
            height: bottombar.height / 2
            color: "#FFA07A"
            anchors.left: bottombar.left
            anchors.top: champs1.bottom
        }
        Rectangle {
            id: champs4
            width: bottombar.width / 2
            height: bottombar.height / 2
            color: "#98FB98"
            anchors.right: bottombar.right
            anchors.top: champs2.bottom
        }
    }
    Rectangle {
        width: parent.width
        height: 50
        color: "#666666"
        anchors.bottom: parent.bottom
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
                    // Change to Accessory Control interface
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
                    // Change to Sensor Data interface
                    stackView.push(Qt.resolvedUrl("SensorData.qml"))
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
}
