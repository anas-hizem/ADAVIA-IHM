import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtLocation 5.11
import QtPositioning 5.11
import QtQuick.Window 2.0
import QtGraphicalEffects 1.15
import GeneralMagic 2.0

import QtMultimedia 5.0
import Qt.labs.folderlistmodel 2.1


Item {
    id: root
    property int batteryLevel: 50
    property double endingLatitude: 35.82539
    property double endingLongitude: 10.63699




    Rectangle {
        id: bottomBar
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        color: 'black'
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
    Rectangle {
        id: rightScreen
        width: parent.width * 2 / 3
        anchors {
            top: parent.top
            bottom: bottomBar.top
            right: parent.right
        }
        //rectangle map
        // Rectangle {
        //     id: champs1
        //     width: rightScreen.width
        //     height: rightScreen.height * 2/3
        //     color: "#87CEEB"
        //     anchors.top: bottomBar.bottom
        //     radius: 20

        //     //GeneralMagic
        //                 property var updater: ServicesManager.contentUpdater(ContentItem.Type.RoadMap)
        //                 Component.onCompleted:
        //                 {
        //                     ServicesManager.settings.allowInternetConnection = true
        //                     ServicesManager.settings.token = __my_secret_token
        //                     updater.autoApplyWhenReady = true
        //                     updater.update()
        //                 }
        //                 // Now Add two Points 1 = StartingPoint And 2 = Ending Point
        //                 RoutingService
        //                 {
        //                     id:routingService
        //                     type:Route.Type.Fastest
        //                     transportMode: Route.TransportMode.Car
        //                     waypoints: LandmarkList
        //                     {
        //                         Landmark
        //                         {
        //                             name:"Starting Point"
        //                             coordinates: Coordinates
        //                             {
        //                                 latitude: 35.764252
        //                                 longitude: 10.811289
        //                             }
        //                         }
        //                         Landmark
        //                         {
        //                             name:"Ending Point"
        //                             coordinates: Coordinates
        //                             {
        //                                 latitude: 35.82539
        //                                 longitude: 10.63699
        //                             }
        //                         }
        //                     }
        //                     onFinished:
        //                     {
        //                         geomapview.routeCollection.set(routeList)
        //                         geomapview.centerOnRouteList(routeList);
        //                     }
        //                 }
        //                 // Now Let's Add NavigationService For Find The Path or Route And Compute The Data Like Distance And time
        //                 NavigationService
        //                 {
        //                     id:navigationService
        //                     route: geomapview.routeCollection.mainRoute
        //                     simulation: true

        //                     onActiveChanged:
        //                     {
        //                         if (active)
        //                         {
        //                             geomapview.startFollowingPosition()
        //                             geomapview.routeCollection.clear(true)
        //                             geomapview.routeCollection.add(route)
        //                         }
        //                     }
        //                     onDestinationReached: geomapview.routeCollection.clear()
        //                     onNavigationRouteUpdated: {
        //                         geomapview.routeCollection.clear()
        //                         geomapview.routeCollection.add(route)
        //                     }
        //                 }
        //                 // Let's Add MapView
        //                    MapView
        //                    {
        //                        id:geomapview
        //                        anchors.fill: parent
        //                        viewAngle: 35
        //                        cursorVisibility: false

        //                        onRouteSelected:
        //                        {
        //                            routeCollection.mainRoute = route
        //                            centerOnRoute(route)
        //                            console.log("Selected Route Is : " + route.summary)
        //                        }
        //                    }

        //                 Image {
        //                     id: timeIcon
        //                     source: "assets/clock.png"
        //                     MouseArea {
        //                         anchors.fill: parent
        //                     }

        //                     anchors {
        //                         left: parent.left
        //                         top: parent.top
        //                         margins: 10
        //                     }
        //                     width: parent.width / 40
        //                     fillMode: Image.PreserveAspectFit
        //                 }

        //                 Text {
        //                     id: dateTimeDisplay
        //                     anchors {
        //                         left: timeIcon.right
        //                         leftMargin: 10
        //                         bottom: timeIcon.bottom
        //                     }
        //                     font.pixelSize: 18
        //                     font.bold: true
        //                     color: 'black'
        //                     text: systemHandler.currentTime
        //                 }
        //                 Image {
        //                     id: dateIcon
        //                     source: "assets/calendar.png"
        //                     MouseArea {
        //                         anchors.fill: parent
        //                     }

        //                     anchors {
        //                         left: dateTimeDisplay.left
        //                         bottom: timeIcon.bottom
        //                         leftMargin: 90
        //                     }
        //                     width: parent.width / 40
        //                     fillMode: Image.PreserveAspectFit
        //                 }
        //                 Text {
        //                     id: dateDisplay
        //                     anchors {
        //                         left: dateIcon.right
        //                         leftMargin: 10
        //                         bottom: timeIcon.bottom
        //                     }
        //                     font.pixelSize: 18
        //                     font.bold: true
        //                     color: 'black'
        //                     text: systemHandler.currentDate
        //                 }
        //                 Image {
        //                     id: temperatureIcon
        //                     source: "qrc:/assets/thermometer.png"
        //                     MouseArea {
        //                         anchors.fill: parent
        //                     }

        //                     anchors {
        //                         left: dateDisplay.left
        //                         bottom: timeIcon.bottom
        //                         leftMargin: 100
        //                     }
        //                     width: parent.width / 40
        //                     fillMode: Image.PreserveAspectFit
        //                 }
        //                 Text {
        //                     id: outdoorTemperatureDisplay
        //                     anchors {
        //                         left: dateDisplay.right
        //                         leftMargin: 40
        //                         bottom: timeIcon.bottom
        //                     }
        //                     font.pixelSize: 18
        //                     font.bold: true
        //                     color: 'black'
        //                     text: systemHandler.temperature.toFixed(1) + "°C"
        //                 }
        //                 Image {
        //                     id: humidityIcon
        //                     source: "assets/humidity.png"
        //                     MouseArea {
        //                         anchors.fill: parent
        //                     }

        //                     anchors {
        //                         left: outdoorTemperatureDisplay.left
        //                         bottom: timeIcon.bottom
        //                         leftMargin: 60
        //                     }
        //                     width: parent.width / 40
        //                     fillMode: Image.PreserveAspectFit
        //                 }
        //                 Text {
        //                     id: outdoorHumidityDisplay
        //                     anchors {
        //                         left: outdoorTemperatureDisplay.right
        //                         leftMargin: 40
        //                         bottom: timeIcon.bottom
        //                     }
        //                     font.pixelSize: 18
        //                     font.bold: true
        //                     color: 'black'
        //                     text: systemHandler.humidity.toFixed(1) + "%"
        //                 }
        //                 Image {
        //                     id: userIcon
        //                     source: "assets/user.png"
        //                     MouseArea {
        //                         anchors.fill: parent
        //                     }

        //                     anchors {
        //                         left: outdoorHumidityDisplay.left
        //                         bottom: timeIcon.bottom
        //                         leftMargin: 60
        //                     }
        //                     width: parent.width / 40
        //                     fillMode: Image.PreserveAspectFit
        //                 }
        //                 Text {
        //                     id: usernameDisplay
        //                     anchors {
        //                         left: outdoorHumidityDisplay.right
        //                         leftMargin: 45
        //                         bottom: timeIcon.bottom
        //                     }
        //                     font.pixelSize: 18
        //                     font.bold: true
        //                     color: 'black'
        //                     text: systemHandler.username
        //                 }

        //                 //searching box

        //                 Rectangle {
        //                     id: navSearchBox
        //                     radius: 5
        //                     color: '#f0f0f0'
        //                     width: parent.width * 1/3
        //                     height: parent.height * 1/12
        //                     anchors {
        //                         left: timeIcon.left
        //                         top: usernameDisplay.bottom
        //                         topMargin: 15
        //                     }
        //                     Image {
        //                         id: searchIcon
        //                         source: "assets/search.png"
        //                         anchors {
        //                             left: parent.left
        //                             leftMargin: 25
        //                             verticalCenter: parent.verticalCenter
        //                         }
        //                         height: parent.height * .45
        //                         fillMode: Image.PreserveAspectFit
        //                     }
        //                     Text {
        //                         id: navigationPlaceholderText
        //                         visible: navigateTextInput.text === ""
        //                         text: qsTr("Navigate")
        //                         color: 'black'
        //                         anchors {
        //                             verticalCenter: parent.verticalCenter
        //                             left: searchIcon.right
        //                             leftMargin: 20
        //                         }
        //                     }
        //                     TextInput {
        //                         id: navigateTextInput
        //                         clip :true
        //                         anchors {
        //                             verticalCenter: parent.verticalCenter
        //                             left: searchIcon.right
        //                             leftMargin: 20
        //                             right: parent.right
        //                             rightMargin: 10
        //                         }
        //                         font.pixelSize: 15
        //                     }
        //                 }
        //                 ColumnLayout {
        //                     z: 2
        //                     spacing: 20
        //                     anchors.right: parent.right
        //                     anchors.rightMargin: 10
        //                     anchors.verticalCenter: parent.verticalCenter


        //                     Rectangle {
        //                         implicitHeight: 50
        //                         implicitWidth: 50
        //                         radius: 20
        //                         color: "#FFFFFF"

        //                         Image {
        //                             source: "assets/gear.png"
        //                             width: parent.width * 0.5
        //                             height: parent.height * 0.5
        //                             fillMode: Image.PreserveAspectFit
        //                             MouseArea {
        //                                 anchors.fill: parent
        //                             }
        //                             anchors.centerIn: parent

        //                         }
        //                     }

        //                     Rectangle {
        //                         implicitHeight: 50
        //                         implicitWidth: 50
        //                         radius: 20
        //                         color: "#FFFFFF"
        //                         Image {
        //                             source: "assets/navigation.png"
        //                             width: parent.width * 0.5
        //                             height: parent.height * 0.5
        //                             fillMode: Image.PreserveAspectFit
        //                             MouseArea {
        //                                 anchors.fill: parent
        //                                 onClicked: {
        //                                     navigationService.active = !navigationService.active
        //                                 }
        //                             }
        //                             anchors.centerIn: parent
        //                         }

        //                     }

        //                     Rectangle {
        //                         implicitHeight: 50
        //                         implicitWidth: 50
        //                         radius: 20
        //                         color: "#FFFFFF"

        //                         Image {
        //                             id: location
        //                             source: "assets/location.png"
        //                             width: parent.width * 0.5
        //                             height: parent.height * 0.5
        //                             fillMode: Image.PreserveAspectFit
        //                             MouseArea {
        //                                 anchors.fill: parent
        //                                 enabled: ServicesManager.settings.connected && !navigationService.active
        //                                 onClicked: routingService.update()
        //                             }
        //                             anchors.centerIn: parent

        //                         }
        //                     }
        //                 }

        // }
        Rectangle {
            id: champs2
            width: rightScreen.width / 2
            height: rightScreen.height * 1/3
            color: "#FFD700"
            anchors.right: rightScreen.right
            anchors.bottom: rightScreen.bottom
            radius: 20
        }
        Rectangle {
            id: champs3
            width: rightScreen.width / 2
            height: rightScreen.height * 1/3
            color: "#FFA07A"
            anchors.left: rightScreen.left
            anchors.bottom: rightScreen.bottom
            radius: 20

            MediaPlayer {
                id: player
            }

            Item {
                id: playLogic
                property int index: -1
                property MediaPlayer mediaPlayer: player
                property FolderListModel items: FolderListModel {
                    folder: "music"
                    nameFilters: ["*.mp3"]
                }

                function init(){
                    if(mediaPlayer.playbackState===1){
                        mediaPlayer.pause();
                    }else if(mediaPlayer.playbackState===2){
                        mediaPlayer.play();
                    }else{
                        setIndex(0);
                    }
                }

                function setIndex(i)
                {
                    index = i;

                    if (index < 0 || index >= items.count)
                    {
                        index = -1;
                        mediaPlayer.source = "";
                    }
                    else{
                        mediaPlayer.source = items.get(index,"filePath");
                        mediaPlayer.play();
                    }
                }

                function next(){
                    setIndex(index + 1);
                }

                function previous(){
                    setIndex(index - 1);
                }

                function msToTime(duration) {
                    var seconds = parseInt((duration/1000)%60);
                    var minutes = parseInt((duration/(1000*60))%60);

                    minutes = (minutes < 10) ? "0" + minutes : minutes;
                    seconds = (seconds < 10) ? "0" + seconds : seconds;

                    return minutes + ":" + seconds;
                }

                Connections {
                    target: playLogic.mediaPlayer

                    onPaused: {
                        playPause.source = "assets/play.png";
                    }

                    onPlaying: {
                         playPause.source = "assets/pause.png";
                    }

                    onStopped: {
                        playPause.source = "assets/play.png";
                        if (playLogic.mediaPlayer.status == MediaPlayer.EndOfMedia)
                            playLogic.next();
                    }

                    onError: {
                        console.log(error+" error string is "+errorString);
                    }

                    onMediaObjectChanged: {
                        if (playLogic.mediaPlayer.mediaObject)
                            playLogic.mediaPlayer.mediaObject.notifyInterval = 50;
                    }
                }
            }


            ColumnLayout{
                id: container
                width: champs3.implicitWidth - 80
                height: champs3.implicitHeight - 60

                RowLayout {
                    id: wrapper
                    anchors.fill: parent

                    Rectangle {
                        id: leftWapper
                        height: 80
                        width: 80
                        radius: 7

                        BorderImage {
                            id: coverBorder
                            source: "assets/cover_overlay.png"
                            anchors.fill: parent
                            anchors.margins: 4
                            border { left: 10; top: 10; right: 10; bottom: 10 }
                            horizontalTileMode: BorderImage.Stretch
                            verticalTileMode: BorderImage.Stretch

                            Image {
                                id: coverPic
                                source: player.metaData.coverArtUrlLarge ? player.metaData.coverArtUrlLarge : "assets/cover.png"
                                anchors.fill: coverBorder
                                anchors.margins: 2
                            }
                        }

                    }

                    ColumnLayout {
                        id: rightWapper
                        Layout.fillWidth: true
                        Layout.fillHeight: true

                        RowLayout {
                            id: upperWrap
                            Layout.fillWidth: true
                            Layout.preferredHeight: 100
                            Layout.leftMargin: 20
                            spacing: 25

                            Image {
                                id: prevTrack
                                source: "assets/rewind.png"
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.leftMargin: 20
                                state: "none"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: playLogic.previous()
                                    onPressed: prevTrack.state = "pressed"
                                    onReleased: prevTrack.state = "none"
                                }
                                states: State {
                                    name: "pressed"
                                    when: mouseArea.pressed
                                    PropertyChanges { target: prevTrack; scale: 0.8 }
                                }
                                transitions: Transition {
                                    NumberAnimation { properties: "scale"; duration: 100; easing.type: Easing.InOutQuad }
                                }
                            }

                            Rectangle{
                                width: 30
                                anchors.verticalCenter: parent.verticalCenter
                                Image {
                                    id: playPause
                                    source: "assets/play.png"
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    state: "none"
                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: playLogic.init();
                                        onPressed: playPause.state = "pressed"
                                        onReleased: playPause.state = "none"
                                    }
                                    states: State {
                                        name: "pressed"
                                        when: mouseArea.pressed
                                        PropertyChanges { target: playPause; scale: 0.8 }
                                    }
                                    transitions: Transition {
                                        NumberAnimation { properties: "scale"; duration: 100; easing.type: Easing.InOutQuad }
                                    }
                                }
                            }

                            Image {
                                id: nextTrack
                                source: "assets/forward.png"
                                anchors.verticalCenter: parent.verticalCenter
                                state: "none"

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: playLogic.next()
                                    onPressed: nextTrack.state = "pressed"
                                    onReleased: nextTrack.state = "none"
                                }
                                states: State {
                                    name: "pressed"
                                    when: mouseArea.pressed
                                    PropertyChanges { target: nextTrack; scale: 0.8 }
                                }
                                transitions: Transition {
                                    NumberAnimation { properties: "scale"; duration: 100; easing.type: Easing.InOutQuad }
                                }
                            }

                            Item {
                                Layout.fillWidth: true

                                ColumnLayout {
                                    anchors.verticalCenter: parent.verticalCenter
                                    Layout.fillWidth: true

                                    Text {
                                        id: trackTitle
                                        text: player.metaData.title ? player.metaData.title : "Song title unavailable"
                                        color: "#eeeeee"
                                        font.family: appFont.name
                                        font.pointSize: 12
                                        font.bold: true
                                        style: Text.Raised
                                        styleColor: "#111111"
                                        wrapMode: Text.Wrap
                                    }
                                    Text {
                                        id: trackAlbum
                                        text: player.metaData.albumTitle ? player.metaData.albumTitle : "Song title unavailable"
                                        color: "steelblue"
                                        font.family: appFont.name
                                        font.pointSize: 12
                                        font.bold: true
                                        style: Text.Raised
                                        styleColor: "#111111"
                                        wrapMode: Text.Wrap
                                    }
                                }
                            }

                            Image {
                                id: shareTrack
                                source: "assets/share.png"
                                anchors.verticalCenter: parent.verticalCenter
                                state: "none"

                                MouseArea {
                                    anchors.fill: parent
                                    onPressed: shareTrack.state = "pressed"
                                    onReleased: shareTrack.state = "none"
                                }
                                states: State {
                                    name: "pressed"
                                    when: mouseArea.pressed
                                    PropertyChanges { target: shareTrack; scale: 0.8 }
                                }
                                transitions: Transition {
                                    NumberAnimation { properties: "scale"; duration: 100; easing.type: Easing.InOutQuad }
                                }
                            }
                        }

                        RowLayout {
                            id: lowerWrap
                            Layout.fillWidth: true
                            Layout.preferredHeight: 40
                            Layout.leftMargin: 20
                            spacing: 15

                            Text {
                                id: currentTime
                                text: playLogic.msToTime(player.position)
                                font.family: appFont.name
                                color: "#dedede"
                                font.pointSize: 18
                            }

                            SliderBar{
                                Layout.fillWidth: true
                                audioPlayer: player
                                bgImg: "assets/slider_background.png"
                                bufferImg: "assets/slider_value_right.png"
                                progressImg: "assets/slider_value_left.png"
                                knobImg: "assets/slider_knob.png"
                            }

                            Text {
                                id: totalTime
                                text: playLogic.msToTime(player.duration)
                                font.family: appFont.name
                                color: "#dedede"
                                font.pointSize: 18
                            }
                        }

                    }

                }

            }
        }
    }


    // Rectangle {
    //         id: leftScreen
    //         anchors {
    //             left: parent.left
    //             right: rightScreen.left
    //             bottom: bottomBar.top
    //             top: parent.top
    //         }
    //         color: 'green'


    //         Image {
    //             id: carRender
    //             source: "assets/navette.png"
    //             anchors.centerIn: parent
    //             width: parent.width * 1.8
    //             fillMode: Image.PreserveAspectFit
    //         }

    //         Image {
    //             id: lockIcon
    //             source: systemHandler.carlocker ? "assets/lock.png" : "assets/unlock.png"
    //             anchors {
    //                 left: parent.left
    //                 top: parent.top
    //                 margins: 20
    //             }
    //             width: parent.width / 15
    //             fillMode: Image.PreserveAspectFit

    //             MouseArea {
    //                 anchors.fill: parent
    //                 onClicked: systemHandler.setCarlocker(!systemHandler.carlocker)
    //             }
    //         }

    //         Image {
    //             id: batteryImage
    //             width: 50
    //             height: 50
    //             fillMode: Image.PreserveAspectFit
    //             anchors {
    //                 right: parent.right
    //                 top: parent.top
    //                 margins: 10
    //             }
    //             source: {
    //                 if (batteryLevel > 90)
    //                     return "assets/battery-full-solid.svg";
    //                 else if (batteryLevel > 75)
    //                     return "assets/battery-three-quarters-solid.svg";
    //                 else if (batteryLevel > 50)
    //                     return "assets/battery-half-solid.svg";
    //                 else if (batteryLevel > 25)
    //                     return "assets/battery-quarter-solid.svg";
    //                 else
    //                     return "assets/battery-empty-solid.svg";
    //             }
    //         }
    //         // Slider pour simuler le niveau de batterie
    //         Slider {
    //             id: batterySlider
    //             width: 100  // Largeur souhaitée
    //             height: 10  // Hauteur souhaitée
    //             anchors {
    //                 right: parent.right
    //                 top: batteryImage.bottom
    //                 topMargin: 10 // Marge supplémentaire entre batteryImage et batterySlider
    //             }
    //             from: 0
    //             to: 100
    //             stepSize: 1
    //             value: batteryLevel // Initialisation avec la valeur de batteryLevel
    //             onValueChanged: {
    //                 batteryLevel = value; // Met à jour la propriété batteryLevel lorsque la valeur du slider change
    //             }
    //         }
    // }
}
