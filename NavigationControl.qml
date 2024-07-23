import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras.Private 1.0
import QtMultimedia 5.15
import QtGraphicalEffects 1.15

Item {
    id: navigationControl
    property int batteryLevel: 50
    property int currentSpeed: 0
    property int leftMotorSpeed: 0
    property int rightMotorSpeed: 0

    Rectangle {
        id: bottomBar
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        color: 'white'
        height: parent.height / 12
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
    Image {
        id: batteryImage
        width: 80
        height: 80
        fillMode: Image.PreserveAspectFit
        anchors {
            right: parent.right
            top: parent.top
            margins: 10
        }
        source: {
            if (batteryLevel > 90)
                return "assets/battery-full-solid.svg";
            else if (batteryLevel > 75)
                return "assets/battery-three-quarters-solid.svg";
            else if (batteryLevel > 50)
                return "assets/battery-half-solid.svg";
            else if (batteryLevel > 25)
                return "assets/battery-quarter-solid.svg";
            else
                return "assets/battery-empty-solid.svg";
        }
    }
    Slider {
        id: batterySlider
        width: 100
        height: 10
        anchors {
            right: parent.right
            top: batteryImage.bottom
            topMargin: 10
        }
        from: 0
        to: 100
        stepSize: 1
        value: batteryLevel
        onValueChanged: {
            batteryLevel = value;
        }
    }
    ColumnLayout {
        anchors.centerIn: parent
        spacing: 10

        RowLayout {
            CircularGauge {
                id: gauge1
                value: navigationControl.leftMotorSpeed
                maximumValue: 160
                Layout.alignment: Qt.AlignHCenter

                style: CircularGaugeStyle {
                    tickmarkLabel: Text {
                        font.pixelSize: Math.max(6, outerRadius * 0.1)
                        text: styleData.value
                        color: styleData.value >= 120 ? "#e34c22" : "#000000"
                    }

                    needle: Rectangle {
                        y: outerRadius * 0.15
                        implicitWidth: outerRadius * 0.03
                        implicitHeight: outerRadius * 0.9
                        color: "red"
                    }

                    foreground: Item {
                        Rectangle {
                            width: outerRadius * 0.2
                            height: width
                            radius: width / 2
                            color: "black"
                            anchors.centerIn: parent
                        }
                    }
                }
            }
            CircularGauge {
                id: gauge2
                value: navigationControl.rightMotorSpeed
                maximumValue: 160
                Layout.alignment: Qt.AlignHCenter

                style: CircularGaugeStyle {
                    tickmarkLabel: Text {
                        font.pixelSize: Math.max(6, outerRadius * 0.1)
                        text: styleData.value
                        color: styleData.value >= 120 ? "#e34c22" : "#000000"
                    }

                    needle: Rectangle {
                        y: outerRadius * 0.15
                        implicitWidth: outerRadius * 0.03
                        implicitHeight: outerRadius * 0.9
                        color: "red"
                    }

                    foreground: Item {
                        Rectangle {
                            width: outerRadius * 0.2
                            height: width
                            radius: width / 2
                            color: "black"
                            anchors.centerIn: parent
                        }
                    }
                }
            }
        }
        RowLayout {
            Slider {
                id: speedSlider1
                Layout.alignment: Qt.AlignHCenter

                from: 0
                to: 160
                stepSize: 1
                value: navigationControl.leftMotorSpeed

                onValueChanged: {
                    navigationControl.leftMotorSpeed = value;
                }
            }
            Slider {
                id: speedSlider2
                Layout.alignment: Qt.AlignHCenter

                from: 0
                to: 160
                stepSize: 1
                value: navigationControl.rightMotorSpeed

                onValueChanged: {
                    navigationControl.rightMotorSpeed = value;
                }
            }
        }

        Connections {
            target: navigationControl
            function onCurrentSpeedChanged() {
                gauge1.value = navigationControl.leftMotorSpeed;
                gauge2.value = navigationControl.rightMotorSpeed;
            }
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 10
            Button {
                text: "Avancer"
                onClicked: {
                    speedSlider1.value += 10;
                    speedSlider2.value += 10;
                }
            }

            Button {
                text: "Reculer"
                onClicked: {
                    speedSlider1.value -= 10;
                    speedSlider2.value -= 10;
                }
            }

            Button {
                text: "Gauche"
                onClicked: {
                    speedSlider1.value += 10;
                    speedSlider2.value -= 10;
                }
            }

            Button {
                text: "Droite"
                onClicked: {
                    speedSlider1.value -= 10;
                    speedSlider2.value += 10;
                }
            }
        }

        Text {
            id: speedText
            text: "Speed: " + navigationControl.currentSpeed
            font.pixelSize: 20
            color: "black"
            Layout.alignment: Qt.AlignHCenter
        }
    }
}
