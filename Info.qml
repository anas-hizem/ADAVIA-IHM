import QtQuick 2.15
import QtQuick.Controls 2.15


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
        anchors.centerIn: parent
        width: parent.width * 1.8
        fillMode: Image.PreserveAspectFit
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
    Image {
        id: userIcon
        source: "assets/user.png"
        MouseArea {
            anchors.fill: parent
        }

        anchors {
            left: outdoorHumidityDisplay.left
            bottom: timeIcon.bottom
            leftMargin: 60
        }
        width: parent.width / 30
        fillMode: Image.PreserveAspectFit
    }
    Text {
        id: usernameDisplay
        anchors {
            left: outdoorHumidityDisplay.right
            leftMargin: 45
            bottom: timeIcon.bottom
        }
        font.pixelSize: 18
        font.bold: true
        color: 'black'
        text: systemHandler.username
    }
}
