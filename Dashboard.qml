import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtLocation 5.11
import QtPositioning 5.11
import GeneralMagic 2.0


Item {
    id: root
    property int batteryLevel: 50
    property double endingLatitude: 35.82539
    property double endingLongitude: 10.63699
    function distance(meters)
    {
        return meters >= 1000 ? (meters / 1000.).toFixed(3) + " Km" :  meters.toFixed(0) + " m";
    }


    NavBar {
        id: bottomBar
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
    }

    Rectangle {
        id: rightScreen
        width: parent.width * 2/3
        anchors {
            top: parent.top
            bottom: bottomBar.top
            right: parent.right
        }
        //rectangle map
        Rectangle {
            id: champs1
            width: rightScreen.width
            height: rightScreen.height * 3/4
            color: "#87CEEB"
            anchors.top: bottomBar.bottom
            radius: 20

            //GeneralMagic
            property var updater: ServicesManager.contentUpdater(ContentItem.Type.RoadMap)
            Component.onCompleted:
            {
                ServicesManager.settings.allowInternetConnection = true
                ServicesManager.settings.token = __my_secret_token
                updater.autoApplyWhenReady = true
                updater.update()
            }
            // Now Add two Points 1 = StartingPoint And 2 = Ending Point
            RoutingService
            {
                id:routingService
                type:Route.Type.Fastest
                transportMode: Route.TransportMode.Car
                waypoints: LandmarkList
                {
                    Landmark
                    {
                        name:"Starting Point"
                        coordinates: Coordinates
                        {
                            latitude: 35.764252
                            longitude: 10.811289
                        }
                    }
                    Landmark
                    {
                        name:"Ending Point"
                        coordinates: Coordinates
                        {
                            latitude: 35.82539
                            longitude: 10.63699
                        }
                    }
                }
                onFinished:
                {
                    geomapview.routeCollection.set(routeList)
                    geomapview.centerOnRouteList(routeList);
                }
            }
            // Now Let's Add NavigationService For Find The Path or Route And Compute The Data Like Distance And time
            NavigationService
            {
                id:navigationService
                route: geomapview.routeCollection.mainRoute
                simulation: true

                onActiveChanged:
                {
                    if (active)
                    {
                        geomapview.startFollowingPosition()
                        geomapview.routeCollection.clear(true)
                        geomapview.routeCollection.add(route)
                    }
                }
                onWaypointReached: console.log("WaypointReached :" + waypoint.name);
                onDestinationReached: geomapview.routeCollection.clear();
                onNavigationError: {
                    geomapview.routeCollection.clear();
                }
                onNavigationRouteUpdated: {
                    geomapview.routeCollection.add(route, true);
                    geomapview.routeCollection.clear(true);
                }
            }
            // Let's Add MapView
            MapView
            {
                id:geomapview
                anchors.fill: parent
                viewAngle: 35
                cursorVisibility: false
                buildingsVisibility: geomapview.BuildingsVisibility.Hide
                detailsQualityLevel: geomapview.DetailsQualityLevel.High
                onRouteSelected:
                {
                    routeCollection.mainRoute = route
                    centerOnRoute(route)
                    console.log("Selected Route Is : " + route.summary)
                }
                Rectangle{
                    z:5
                    visible: navigationService.active
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 20
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    implicitHeight: 140
                    implicitWidth: 420
                    radius: 20
                    color: "#439df3"

                    RowLayout{
                        width: parent.width
                        spacing: 0
                        anchors.centerIn: parent
                        Item{
                            Layout.alignment: Qt.AlignLeft
                            Layout.preferredWidth: parent.width * 0.33
                            Layout.fillHeight: true
                            RowLayout{
                                anchors.centerIn: parent
                                spacing: 20
                                DynamicIconView {
                                    width: 100
                                    height: 100
                                    arrowInner: "White"
                                    arrowOuter: "White"
                                    slotInner: "Grey"
                                    slotOuter: arrowOuter
                                    iconSource: navigationService.currentInstruction.nextTurnDynamicIcon
                                }

                                Rectangle{
                                    width: 1
                                    height: 100
                                    color: "#5cb1ff"
                                }
                            }
                        }
                        ColumnLayout{
                            Layout.fillWidth: true
                            spacing: 5
                            Label {
                                Layout.alignment: Qt.AlignLeft
                                font.pixelSize: 24
                                color: "white"
                                text: distance(navigationService.currentInstruction.distanceToNextTurn)
                            }
                            Label {
                                Layout.alignment: Qt.AlignLeft
                                color: "white"
                                Layout.fillWidth: true
                                font.pixelSize: 18
                                text: navigationService.currentInstruction.nextStreetName
                            }
                        }
                    }
                }
                Rectangle{
                    z:5
                    visible: navigationService.active
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 20
                    anchors.right: parent.right
                    anchors.rightMargin: 20
                    implicitHeight: 140
                    implicitWidth: 500
                    radius: 20
                    color: "#363640"

                    ColumnLayout{
                        spacing: 5
                        anchors.margins: 5
                        anchors.centerIn: parent
                        Layout.fillWidth: true
                        RowLayout{
                            spacing: 50
                            Label {
                                text: navigationService.currentInstruction.nextStreetName
                                Layout.alignment: Qt.AlignLeft
                                font.pixelSize: 24
                                color: "white"
                                font.family: "Montserrat"
                                font.bold: Font.Normal
                            }
                            Item{
                                Layout.fillWidth: true
                            }

                            Label {
                                text: {
                                    var currentTime = new Date();
                                    var timeToAdd = new Date();

                                    // Set the time interval to add (hours, minutes, seconds)
                                    timeToAdd.setHours(1);       // 1 hour
                                    timeToAdd.setMinutes(30);    // 30 minutes
                                    timeToAdd.setSeconds(15);    // 15 seconds

                                    // Add the time interval to the current time
                                    currentTime.setMilliseconds(currentTime.getMilliseconds() + timeToAdd.getTime());

                                    // Format the result to display as HH:mm:ss
                                    var hours = currentTime.getHours().toString().padStart(2, "0");
                                    var minutes = currentTime.getMinutes().toString().padStart(2, "0");
                                    var seconds = currentTime.getSeconds().toString().padStart(2, "0");

                                    return hours + ":" + minutes + ":" + seconds;
                                }
                                Layout.alignment: Qt.AlignRight
                                color: "white"
                                font.pixelSize: 18
                                font.family: "Montserrat"
                                font.bold: Font.Normal
                            }
                        }
                        RowLayout{
                            spacing: 50
                            Label {
                                text: distance(navigationService.currentInstruction.traveledDistance)
                                Layout.alignment: Qt.AlignLeft
                                font.pixelSize: 18
                                color: "white"
                                font.family: "Montserrat"
                                font.bold: Font.Normal
                            }
                            Item{
                                Layout.fillWidth: true
                            }

                            Label {
                                text: qsTr("Estimated Arrival")
                                Layout.alignment: Qt.AlignRight
                                color: "white"
                                font.family: "Montserrat"
                                font.bold: Font.Normal
                                font.pixelSize: 18
                            }
                        }
                        RowLayout{
                            spacing: 50
                            Label {
                                Layout.alignment: Qt.AlignLeft
                                font.pixelSize: 18
                                color: "white"
                                font.family: "Montserrat"
                                font.bold: Font.Normal
                                text: distance(navigationService.currentInstruction.remainingTravelDistance)
                            }

                            Slider{
                                from:0
                                to: navigationService.currentInstruction.traveledDistance+ navigationService.currentInstruction.remainingTravelDistance
                                value: navigationService.currentInstruction.traveledDistance
                                Layout.alignment: Qt.AlignHCenter
                                Layout.fillWidth: true
                            }

                            Label {
                                Layout.alignment: Qt.AlignRight
                                color: "white"
                                font.family: "Montserrat"
                                font.bold: Font.Normal
                                font.pixelSize: 18
                                text: convertSecondsToTime(navigationService.currentInstruction.remainingTravelTime) //navigationService.currentInstruction.nextSpeedLimitVariation()
                                function convertSecondsToTime(seconds) {
                                    var hours = Math.floor(seconds / 3600);
                                    var remainingSeconds = seconds % 3600;
                                    var minutes = Math.floor(remainingSeconds / 60);
                                    var remainingMinutes = remainingSeconds % 60;

                                    var hoursStr = hours < 10 ? "0" + hours : hours;
                                    var minutesStr = minutes < 10 ? "0" + minutes : minutes;
                                    var secondsStr = remainingMinutes < 10 ? "0" + remainingMinutes : remainingMinutes;
                                    return hoursStr + ":" + minutesStr + ":" + secondsStr;
                                }
                            }
                        }
                    }
                }
            }
            // Image {
            //     id: timeIcon
            //     source: "assets/clock.png"
            //     MouseArea {
            //         anchors.fill: parent
            //     }

            //     anchors {
            //         left: parent.left
            //         top: parent.top
            //         margins: 10
            //     }
            //     width: parent.width / 40
            //     fillMode: Image.PreserveAspectFit
            // }

            // Text {
            //     id: dateTimeDisplay
            //     anchors {
            //         left: timeIcon.right
            //         leftMargin: 10
            //         bottom: timeIcon.bottom
            //     }
            //     font.pixelSize: 18
            //     font.bold: true
            //     color: 'black'
            //     text: systemHandler.currentTime
            // }
            // Image {
            //     id: dateIcon
            //     source: "assets/calendar.png"
            //     MouseArea {
            //         anchors.fill: parent
            //     }

            //     anchors {
            //         left: dateTimeDisplay.left
            //         bottom: timeIcon.bottom
            //         leftMargin: 90
            //     }
            //     width: parent.width / 40
            //     fillMode: Image.PreserveAspectFit
            // }
            // Text {
            //     id: dateDisplay
            //     anchors {
            //         left: dateIcon.right
            //         leftMargin: 10
            //         bottom: timeIcon.bottom
            //     }
            //     font.pixelSize: 18
            //     font.bold: true
            //     color: 'black'
            //     text: systemHandler.currentDate
            // }
            // Image {
            //     id: temperatureIcon
            //     source: "qrc:/assets/thermometer.png"
            //     MouseArea {
            //         anchors.fill: parent
            //     }

            //     anchors {
            //         left: dateDisplay.left
            //         bottom: timeIcon.bottom
            //         leftMargin: 100
            //     }
            //     width: parent.width / 40
            //     fillMode: Image.PreserveAspectFit
            // }
            // Text {
            //     id: outdoorTemperatureDisplay
            //     anchors {
            //         left: dateDisplay.right
            //         leftMargin: 40
            //         bottom: timeIcon.bottom
            //     }
            //     font.pixelSize: 18
            //     font.bold: true
            //     color: 'black'
            //     text: systemHandler.temperature.toFixed(1) + "°C"
            // }
            // Image {
            //     id: humidityIcon
            //     source: "assets/humidity.png"
            //     MouseArea {
            //         anchors.fill: parent
            //     }

            //     anchors {
            //         left: outdoorTemperatureDisplay.left
            //         bottom: timeIcon.bottom
            //         leftMargin: 60
            //     }
            //     width: parent.width / 40
            //     fillMode: Image.PreserveAspectFit
            // }
            // Text {
            //     id: outdoorHumidityDisplay
            //     anchors {
            //         left: outdoorTemperatureDisplay.right
            //         leftMargin: 40
            //         bottom: timeIcon.bottom
            //     }
            //     font.pixelSize: 18
            //     font.bold: true
            //     color: 'black'
            //     text: systemHandler.humidity.toFixed(1) + "%"
            // }
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
            //     width: parent.width / 40
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

            //searching box

            Rectangle {
                id: navSearchBox
                radius: 5
                color: '#f0f0f0'
                width: parent.width * 1/3
                height: parent.height * 1/12
                anchors {
                    left: timeIcon.left
                    top: usernameDisplay.bottom
                    topMargin: 15
                }
                Image {
                    id: searchIcon
                    source: "assets/search.png"
                    anchors {
                        left: parent.left
                        leftMargin: 25
                        verticalCenter: parent.verticalCenter
                    }
                    height: parent.height * .45
                    fillMode: Image.PreserveAspectFit
                }
                Text {
                    id: navigationPlaceholderText
                    visible: navigateTextInput.text === ""
                    text: qsTr("Navigate")
                    color: 'black'
                    anchors {
                        verticalCenter: parent.verticalCenter
                        left: searchIcon.right
                        leftMargin: 20
                    }
                }
                TextInput {
                    id: navigateTextInput
                    clip :true
                    anchors {
                        verticalCenter: parent.verticalCenter
                        left: searchIcon.right
                        leftMargin: 20
                        right: parent.right
                        rightMargin: 10
                    }
                    font.pixelSize: 15
                }
            }
            ColumnLayout {
                z: 2
                spacing: 20
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.verticalCenter: parent.verticalCenter


                // Rectangle {
                //     implicitHeight: 50
                //     implicitWidth: 50
                //     radius: 20
                //     color: "#FFFFFF"

                //     Image {
                //         source: "assets/gear.png"
                //         width: parent.width * 0.5
                //         height: parent.height * 0.5
                //         fillMode: Image.PreserveAspectFit
                //         MouseArea {
                //             anchors.fill: parent
                //         }
                //         anchors.centerIn: parent

                //     }
                // }


                Rectangle{
                    id:zoomInOut
                    implicitHeight: 130
                    implicitWidth: 55
                    radius: 16
                    color: Theme.buttonColor
                    Rectangle{
                        z:2
                        width: zoomInOut.width - 15
                        color: "grey"
                        height: 1
                        anchors.centerIn: parent
                    }

                    ColumnLayout{
                        z:1
                        anchors.centerIn: parent
                        spacing: 20
                        Rectangle {
                            implicitHeight: 50
                            implicitWidth: 50
                            radius: 20
                            color: "#FFFFFF"
                            Image{
                                width: parent.width * 0.5
                                height: parent.height * 0.5
                                anchors.centerIn: parent
                                source: "assets/plus.png"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        geomapview.zoomIn()
                                    }
                                }
                            }

                        }
                        Rectangle {
                            implicitHeight: 50
                            implicitWidth: 50
                            radius: 20
                            color: "#FFFFFF"
                            Image{
                                width: parent.width * 0.5
                                height: parent.height * 0.5
                                source: "assets/moins.png"
                                anchors.centerIn: parent
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        geomapview.zoomOut()
                                    }
                                }
                            }
                        }
                    }
                }

                Rectangle {
                    implicitHeight: 50
                    implicitWidth: 50
                    radius: 20
                    color: "#FFFFFF"
                    Image {
                        source: "assets/navigation.png"
                        width: parent.width * 0.5
                        height: parent.height * 0.5
                        fillMode: Image.PreserveAspectFit
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                navigationService.active = !navigationService.active
                            }
                        }
                        anchors.centerIn: parent
                    }

                }

                Rectangle {
                    implicitHeight: 50
                    implicitWidth: 50
                    radius: 20
                    color: "#FFFFFF"

                    Image {
                        id: location
                        source: "assets/location.png"
                        width: parent.width * 0.5
                        height: parent.height * 0.5
                        fillMode: Image.PreserveAspectFit
                        MouseArea {
                            anchors.fill: parent
                        }
                        anchors.centerIn: parent
                }
            }
            Rectangle {
                implicitHeight: 50
                implicitWidth: 50
                radius: 20
                color: "#FFFFFF"
                Image {
                    id: path
                    source: "assets/path.png"
                    width: parent.width * 0.5
                    height: parent.height * 0.5
                    fillMode: Image.PreserveAspectFit
                    MouseArea {
                        anchors.fill: parent
                        enabled: ServicesManager.settings.connected && !navigationService.active
                        onClicked: routingService.update()
                    }
                    anchors.centerIn: parent
                    }
                }
            }
        }
        //weather area
        Rectangle {
            id: champs2
            width: rightScreen.width / 2
            height: rightScreen.height * 1/4
            color: "#FFD700"
            anchors.right: rightScreen.right
            anchors.bottom: rightScreen.bottom
            radius: 20
            // Weather {
            //     id: weather
            // }

        }

        //music area
        Rectangle {
            id: champs3
            width: rightScreen.width / 2
            height: rightScreen.height * 1/4
            anchors.left: rightScreen.left
            anchors.bottom: rightScreen.bottom
            color: "#FFA07A"
            radius: 20

            MusicPlayer {
                id: musicPlayer
            }
        }
    }

    Rectangle {
            id: leftScreen
            width: parent.width * 1/3

            anchors {
                left: parent.left
                right: rightScreen.left
                bottom: bottomBar.top
                top: parent.top
            }
            color: 'green'

            Image {
                id: carRender
                source: "assets/navette.png"
                anchors.centerIn: parent
                width: parent.width * 1.8
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: lockIcon
                source: systemHandler.carlocker ? "assets/lock.png" : "assets/unlock.png"
                anchors {
                    left: parent.left
                    top: parent.top
                    margins: 20
                }
                width: parent.width / 15
                fillMode: Image.PreserveAspectFit

                MouseArea {
                    anchors.fill: parent
                    onClicked: systemHandler.setCarlocker(!systemHandler.carlocker)
                }
            }
            Image {
                id: batteryImage
                width: 50
                height: 50
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
            // Slider pour simuler le niveau de batterie
            Slider {
                id: batterySlider
                width: 100  // Largeur souhaitée
                height: 10  // Hauteur souhaitée
                anchors {
                    right: parent.right
                    top: batteryImage.bottom
                    topMargin: 10 // Marge supplémentaire entre batteryImage et batterySlider
                }
                from: 0
                to: 100
                stepSize: 1
                value: batteryLevel // Initialisation avec la valeur de batteryLevel
                onValueChanged: {
                    batteryLevel = value; // Met à jour la propriété batteryLevel lorsque la valeur du slider change
                }
            }
        }

    }
