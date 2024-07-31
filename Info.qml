import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.15
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4

Rectangle {
    id: leftScreen
    width: parent.width * 1 / 3
    anchors {
        left: parent.left
        right: rightScreen.left
        bottom: bottomBar.top
        top: parent.top
        margins: 20
    }
    radius: 20
    color: '#A1CD3C'
    Image {
        id: carRender
        source: "assets/navette.png"
        anchors.top: parent.top
        anchors.topMargin: 30
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width * 1.5

        fillMode: Image.PreserveAspectFit
    }
    CircularGauge {
        id: gauge
        //value: navigationControl.leftMotorSpeed
        maximumValue: 160
        Layout.alignment: Qt.AlignHCenter
        anchors {
            horizontalCenter: carRender.horizontalCenter
            top: carRender.bottom
            topMargin: 5
        }
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
            tickmark: Rectangle {
                width: outerRadius * 0.01
                height: outerRadius * 0.1
                color: "#000000" // Major tickmark color
            }

            minorTickmark: Rectangle {
                width: outerRadius * 0.005
                height: outerRadius * 0.05
                color: "#000000" // Minor tickmark color
            }
        }
    }
    TSlider{
        id:travelSlider
        height: 20
        labelVisible:false
        setHandleHeight:20
        checkedColor: "#2bbe6d"
        stepSize: 1
        //from:0
        //to: navigation.active ? navigation.currentInstruction.traveledDistance+ navigation.currentInstruction.remainingTravelDistance : 100
        //value: navigation.active ? navigation.currentInstruction.traveledDistance : 0
        width: parent.width * 0.8
        anchors{
            horizontalCenter: carRender.horizontalCenter
            top: gauge.bottom
            topMargin: 20
        }
    }


    RowLayout{
        id:travelInfo
        width:travelSlider.width
        spacing: 10
        anchors{
            horizontalCenter: carRender.horizontalCenter
            top: travelSlider.bottom
            topMargin: 15
        }
        IconButton{
            implicitHeight: 45
            implicitWidth: 45
            radius:16
            setIconColor :"#68acd9"
            setIconText: "\uf52f"
        }
        ColumnLayout{
            Label {
                //text: distance(navigation.currentInstruction.remainingTravelDistance )
                text: qsTr("0 M")
                Layout.alignment: Qt.AlignHCenter
                font.pixelSize: 20
                color: "white"
                font.family: "Montserrat"
                font.bold: Font.Bold
                font.weight: Font.Bold
            }
            Label {
                text: qsTr("Remaining")
                Layout.alignment: Qt.AlignHCenter
                font.pixelSize: 12
                color: "white"
            }
        }
        ColumnLayout{
            Label {
                text: qsTr("128 wh/km")
                Layout.alignment: Qt.AlignHCenter
                font.pixelSize: 20
                color: "white"
                font.family: "Montserrat"
                font.bold: Font.Bold
                font.weight: Font.Bold
            }
            Label {
                text: qsTr("Average")
                Layout.alignment: Qt.AlignHCenter
                font.pixelSize: 12
                color: "white"
            }
        }
        ColumnLayout{
            Label {
                text: qsTr("35.5 kWm")
                Layout.alignment: Qt.AlignHCenter
                font.pixelSize: 20
                color: "white"
                font.family: "Montserrat"
                font.bold: Font.Bold
                font.weight: Font.Bold
            }
            Label {
                text: qsTr("Full Capacity")
                Layout.alignment: Qt.AlignHCenter
                font.pixelSize: 12
                color: "white"
            }
        }
    }
    Image {
        id: timeIcon
        source: "assets/clock.png"
        MouseArea {
            anchors.fill: parent
        }

        anchors {
            left: parent.left
            top: parent.top
            margins: 10
        }
        width: parent.width / 30
        fillMode: Image.PreserveAspectFit
    }
    Text {
        id: dateTimeDisplay
        anchors {
            left: timeIcon.right
            leftMargin: 10
            bottom: timeIcon.bottom
        }
        font.pixelSize: 18
        font.bold: true
        color: 'black'
        text: systemHandler.currentTime
    }
    Image {
        id: dateIcon
        source: "assets/calendar.png"
        MouseArea {
            anchors.fill: parent
        }

        anchors {
            left: dateTimeDisplay.left
            bottom: timeIcon.bottom
            leftMargin: 90
        }
        width: parent.width / 30
        fillMode: Image.PreserveAspectFit
    }
    Text {
        id: dateDisplay
        anchors {
            left: dateIcon.right
            leftMargin: 10
            bottom: timeIcon.bottom
        }
        font.pixelSize: 18
        font.bold: true
        color: 'black'
        text: systemHandler.currentDate
    }
    Image {
        id: temperatureIcon
        source: "qrc:/assets/thermometer.png"
        MouseArea {
            anchors.fill: parent
        }

        anchors {
            left: dateDisplay.left
            bottom: timeIcon.bottom
            leftMargin: 100
        }
        width: parent.width / 30
        fillMode: Image.PreserveAspectFit
    }
    Text {
        id: outdoorTemperatureDisplay
        anchors {
            left: dateDisplay.right
            leftMargin: 40
            bottom: timeIcon.bottom
        }
        font.pixelSize: 18
        font.bold: true
        color: 'black'
        text: systemHandler.temperature.toFixed(1) + "°C"
    }
    Image {
        id: humidityIcon
        source: "assets/humidity.png"
        MouseArea {
            anchors.fill: parent
        }

        anchors {
            left: outdoorTemperatureDisplay.left
            bottom: timeIcon.bottom
            leftMargin: 60
        }
        width: parent.width / 30
        fillMode: Image.PreserveAspectFit
    }
    Text {
        id: outdoorHumidityDisplay
        anchors {
            left: outdoorTemperatureDisplay.right
            leftMargin: 40
            bottom: timeIcon.bottom
        }
        font.pixelSize: 18
        font.bold: true
        color: 'black'
        text: systemHandler.humidity.toFixed(1) + "%"
    }
















































    // Image {
    //     id: userIcon
    //     source: "assets/user.png"
    //     MouseArea {
    //         anchors.fill: parent
    //     }

    //     anchors {
    //         left: outdoorHumidityDisplay.left
    //         bottom: timeIcon.bottom
    //         leftMargin: 60
    //     }
    //     width: parent.width / 30
    //     fillMode: Image.PreserveAspectFit
    // }
    // Text {
    //     id: usernameDisplay
    //     anchors {
    //         left: outdoorHumidityDisplay.right
    //         leftMargin: 45
    //         bottom: timeIcon.bottom
    //     }
    //     font.pixelSize: 18
    //     font.bold: true
    //     color: 'black'
    //     text: systemHandler.username
    // }
}
