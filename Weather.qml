import QtQuick 2.15
import "./whether/components"
import WeatherInfo 1.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3


Item {
    Page{
        id: weatherWindow
        Layout.fillHeight: true
        Layout.fillWidth: true
        background: Rectangle{
            anchors.fill: parent
            color: "#73b2df"
            radius: 20
        }
        state: "loading"
        states: [
            State {
                name: "loading"
                PropertyChanges { target: mainWeatherInfo; opacity: 0 }
                PropertyChanges { target: wait; opacity: 1 }
            },
            State {
                name: "ready"
                PropertyChanges { target: mainWeatherInfo; opacity: 1 }
                PropertyChanges { target: wait; opacity: 0 }
            }
        ]
        AppModel {
            id: model
            onReadyChanged: {
            if (model.ready)
                weatherWindow.state = "ready"
            else
                weatherWindow.state = "loading"
            }
        }
        Item {
            id: wait
            anchors.fill: parent

            Text {
                text: "Loading weather data..."
                    anchors.centerIn: parent
                    font.pointSize: 18
                    }
                }
                BigForecastIcon {
                    id: mainWeatherInfo
                    anchors.fill: parent
                    radius: 20
                    weatherIcon: (model.hasValidWeather
                                          ? model.weather.weatherIcon
                                          : "01d")
                    topText: (model.hasValidWeather
                                      ? model.weather.temperature
                                      : "??")
                    minText: (model.hasValidWeather
                                      ? model.weather.minTemperature
                                      : "??")
                    bottomText: (model.hasValidWeather
                                         ? model.weather.weatherDescription
                                         : "No weather data")
                    dateText: (model.hasValidWeather ?
                                           model.weather.dayOfWeek : "??")

                    MouseArea {
                        height: 120
                        anchors.rightMargin: 0
                        anchors.bottomMargin: 49
                        anchors.leftMargin: 0
                        anchors.topMargin: -49
                        anchors.fill: parent
                        onClicked: {
                            model.refreshWeather()
                            }
                        }
                    }
}
}
