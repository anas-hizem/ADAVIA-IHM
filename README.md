<<<<<<< HEAD
# Recherche de Destination avec General Magic
## Description

Ce projet utilise le SDK Maps de General Magic pour implémenter une fonctionnalité de recherche textuelle de destinations dans une application Qt. Les utilisateurs peuvent saisir des termes de recherche pour trouver des localisations, afficher des suggestions basées sur la proximité, et choisir la destination exacte. Ce guide vous aidera à configurer et à utiliser la recherche textuelle avec le SDK General Magic dans votre application Qt.
=======
information
            // Image {
            //     id: carRender
            //     source: "assets/navette.png"
            //     anchors.centerIn: parent
            //     width: parent.width * 1.8
            //     fillMode: Image.PreserveAspectFit
            // }
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
            //     width: parent.width / 30
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
>>>>>>> 3d8999c (Readme change)

            //     anchors {
            //         left: dateTimeDisplay.left
            //         bottom: timeIcon.bottom
            //         leftMargin: 90
            //     }
            //     width: parent.width / 30
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
            //     width: parent.width / 30
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
            //     width: parent.width / 30
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
            // Image {
            //     id: batteryImage
            //     width: 40
            //     height: 40
            //     fillMode: Image.PreserveAspectFit
            //     anchors {
            //         right: parent.right
            //         top: parent.top
            //         margins: 10
            //     }
            //     source: {
            //         if (batteryLevel > 90)
            //             return "assets/battery-full-solid.svg";
            //         else if (batteryLevel > 75)
            //             return "assets/battery-three-quarters-solid.svg";
            //         else if (batteryLevel > 50)
            //             return "assets/battery-half-solid.svg";
            //         else if (batteryLevel > 25)
            //             return "assets/battery-quarter-solid.svg";
            //         else
            //             return "assets/battery-empty-solid.svg";
            //     }
            // }
            // Slider {
            //     id: batterySlider
            //     width: 100  // Largeur souhaitée
            //     height: 10  // Hauteur souhaitée
            //     anchors {
            //         right: parent.right
            //         top: batteryImage.bottom
            //         topMargin: 5
            //     }
            //     from: 0
            //     to: 100
            //     stepSize: 1
            //     value: batteryLevel // Initialisation avec la valeur de batteryLevel
            //     onValueChanged: {
            //         batteryLevel = value; // Met à jour la propriété batteryLevel lorsque la valeur du slider change
            //     }
            // }
            
            
map area

<<<<<<< HEAD
1. **Qt Framework** : Pour le développement de l'interface utilisateur avec QML et C++ (Version 5.15 ou supérieure) . 
2. **General Magic SDK** : Pour la simulation de chemin et la gestion des itinéraires.
3. **Clé API Magic Lane** : Obtenez une clé API depuis le site de Magic Lane.
4. **Environnement de Développement**: Un IDE compatible avec Qt, tel que Qt Creator, est recommandé pour le développement.
## Installation
=======
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
                id: routingService
                type: Route.Type.Fastest
                transportMode: Route.TransportMode.Car
                waypoints: LandmarkList {
                    Landmark {
                        name: "Starting Point"
                        coordinates: Coordinates {
                            latitude: 35.764252
                            longitude: 10.811289
                        }
                    }
                    Landmark {
                        name: "Ending Point"
                        coordinates: destinationCoordinates
                    }
                }
                onFinished: {
                    geomapview.routeCollection.set(routeList)
                    geomapview.centerOnRouteList(routeList)
                }
            }
            // Now Let's Add NavigationService For Find The Path or Route And Compute The Data Like Distance And time
            NavigationService
            {
                id:navigationService
                route: geomapview.routeCollection.mainRoute
                simulation: true
>>>>>>> 3d8999c (Readme change)

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
                onRouteSelected:
                {
                    routeCollection.mainRoute = route
                    centerOnRoute(route)
                    console.log("Selected Route Is : " + route.summary)
                }
                ColumnLayout {
                            anchors.fill: parent
                            anchors.topMargin: 15
                            anchors.leftMargin: 15
                            anchors.rightMargin: 400
                            anchors.bottomMargin: 30

                    TextField {
                        id: searchBar
                        Layout.fillWidth: true
                        placeholderText: qsTr("Where would you like to go?")
                        onTextChanged: searchTimer.restart()
                        onEditingFinished: searchService.searchNow()
                    }
                    Rectangle {
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        color: Qt.rgba(0,0,0,0.5)
                        visible: searchBar.focus
                        ListView {
                            id: searchList
                            anchors.fill: parent
                            clip: true
                            model: searchService
                            function distance(meters)
                            {
                                return meters >= 1000 ? (meters / 1000.).toFixed(3) + " Km" :  meters.toFixed(0) + " m";
                            }
                            delegate: Item {
                                height: row.height
                                RowLayout {
                                    id: row
                                    IconView {
                                        iconSource: landmark.icon
                                        Layout.maximumHeight: row.height
                                        Layout.maximumWidth: row.height
                                        width: height
                                        height: row.height
                                    }
                                    ColumnLayout {
                                        Layout.fillHeight: true
                                        Layout.fillWidth: true
                                        Text {
                                            Layout.fillWidth: true
                                            text: landmark.name + " (" + searchList.distance(landmark.coordinates.distance(searchService.referencePoint)) + ")"
                                            color: "white"
                                            font.pixelSize: 16
                                            wrapMode: Text.WrapAnywhere
                                        }
                                        Text {
                                            Layout.fillWidth: true
                                            text: landmark.description
                                            color: "white"
                                            font.pixelSize: 14
                                            font.italic: true
                                            wrapMode: Text.WrapAnywhere
                                        }
                                    }
                                }
                                MouseArea {
                                    anchors.fill: row
                                    onClicked: {
                                        destinationCoordinates = searchService.get(index).coordinates;
                                        console.log("Destination coordinates:", destinationCoordinates);
                                        geomapview.centerOnCoordinates(searchService.get(index).coordinates, -1);
                                        searchBar.focus = true;
                                    }
                                }
                            }
                        }
                    }
                    Item {
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }
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

<<<<<<< HEAD

### 1. Configuration de la Clé API
=======
                                    // Add the time interval to the current time
                                    currentTime.setMilliseconds(currentTime.getMilliseconds() + timeToAdd.getTime());
>>>>>>> 3d8999c (Readme change)

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

<<<<<<< HEAD
```qml
import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12
import GeneralMagic 2.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Free Text Search Example")

    property var updater: ServicesManager.contentUpdater(ContentItem.Type.RoadMap)
    Component.onCompleted: {
        ServicesManager.settings.token = __my_secret_token; // Remplacez par votre clé API
        ServicesManager.logLevel = ServicesManager.Error;
        ServicesManager.settings.allowInternetConnection = true;
        updater.autoApplyWhenReady = true;
        updater.update();
    }

    Timer {
        id: searchTimer
        interval: 500
        onTriggered: {
            searchService.searchNow();
        }
    }

    SearchService {
        id: searchService
        filter: searchBar.text
        searchMapPOIs: true
        searchAddresses: true
        limit: 10

        function searchNow() {
            searchTimer.stop();
            cancel();
            referencePoint = mapView.cursorWgsPosition();
            search();
        }
    }

    MapView {
        id: mapView
        anchors.fill: parent
        gesturesEnabled: true

        Component.onCompleted: mapView.centerOnCoordinates(ServicesManager.createCoordinates(45.465361, 9.184940), 67);

        ColumnLayout {
            anchors.fill: parent
            anchors.topMargin: 15
            anchors.leftMargin: 15
            anchors.rightMargin: 15
            anchors.bottomMargin: 30

            TextField {
                id: searchBar
                Layout.fillWidth: true
                placeholderText: qsTr("Where would you like to go?")
                onTextChanged: searchTimer.restart()
                onEditingFinished: searchService.searchNow()
            }

            Rectangle {
                Layout.fillHeight: true
                Layout.fillWidth: true
                color: Qt.rgba(0,0,0,0.5)
                visible: searchBar.focus
                ListView {
                    id: searchList
                    anchors.fill: parent
                    clip: true
                    model: searchService
                    function distance(meters)
                    {
                        return meters >= 1000 ? (meters / 1000.).toFixed(3) + " Km" :  meters.toFixed(0) + " m";
                    }
                    delegate: Item {
                        height: row.height
                        RowLayout {
                            id: row
                            IconView {
                                iconSource: landmark.icon
                                Layout.maximumHeight: row.height
                                Layout.maximumWidth: row.height
                                width: height
                                height: row.height
                            }
                            ColumnLayout {
                                Layout.fillHeight: true
                                Layout.fillWidth: true
                                Text {
                                    Layout.fillWidth: true
                                    text: landmark.name + " (" + searchList.distance(landmark.coordinates.distance(searchService.referencePoint)) + ")"
                                    color: "white"
                                    font.pixelSize: 16
                                    wrapMode: Text.WrapAnywhere
                                }
                                Text {
                                    Layout.fillWidth: true
                                    text: landmark.description
                                    color: "white"
                                    font.pixelSize: 14
                                    font.italic: true
                                    wrapMode: Text.WrapAnywhere
=======
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
>>>>>>> 3d8999c (Readme change)
                                }
                            }
                        }
                    }
                }
            }
<<<<<<< HEAD
        }
    }
}
=======
>>>>>>> 3d8999c (Readme change)

            Timer {
                id: searchTimer
                interval: 500
                onTriggered: {
                    searchService.searchNow();
                }
            }
            SearchService {
                id: searchService
                filter: searchBar.text
                searchMapPOIs: true
                searchAddresses: true
                limit: 10

                function searchNow() {
                    searchTimer.stop();
                    cancel();
                    referencePoint = geomapview.cursorWgsPosition();
                    search();
                }

<<<<<<< HEAD
## Réalisation
1. **Lancer l'application:** Compilez et lancez l'application pour tester la fonctionnalité de recherche textuelle.
2. **Tester la Recherche:**  Entrez divers termes dans le champ de recherche et vérifiez que les suggestions apparaissent correctement et que la carte se centre sur la localisation sélectionnée.
3. **Vérifier la Performance:** Assurez-vous que la recherche est rapide et que les résultats sont affichés sans retard significatif.

![rechDes](https://github.com/user-attachments/assets/96e66ab0-84f8-4f20-b73f-d8e479b18be7)


## Conclusion
La fonctionnalité de recherche textuelle améliore l'interaction utilisateur en permettant de trouver des destinations par texte libre. En suivant ce guide, vous pouvez intégrer cette fonctionnalité dans votre application de cartographie Qt en utilisant le SDK General Magic. Assurez-vous de tester soigneusement et d'adapter le code en fonction des besoins spécifiques de votre projet.
=======
            }
            ColumnLayout {
                z: 2
                spacing: 20
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.verticalCenter: parent.verticalCenter

                Rectangle{
                    id:zoomInOut
                    implicitHeight: 130
                    implicitWidth: 55
                    radius: 16
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
>>>>>>> 3d8999c (Readme change)

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
                            onClicked: {
                                zoomToLocation(35.82539, 10.63699, 100);
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
                        id: path
                        source: "assets/path.png"
                        width: parent.width * 0.5
                        height: parent.height * 0.5
                        fillMode: Image.PreserveAspectFit
                        MouseArea {
                            anchors.fill: parent
                            enabled: ServicesManager.settings.connected && !navigationService.active && destinationCoordinates !== null
                            onClicked: {
                                if (destinationCoordinates !== null) {
                                    routingService.update(); // Mise à jour du service de routage
                                } else {
                                    console.log("Destination coordinates are null.");
                                }
                            }
                        }
                        anchors.centerIn: parent
                    }
                }
            }
