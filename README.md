# Recherche de Destination avec General Magic
## Description

Ce projet utilise le SDK Maps de General Magic pour implémenter une fonctionnalité de recherche textuelle de destinations dans une application Qt. Les utilisateurs peuvent saisir des termes de recherche pour trouver des localisations, afficher des suggestions basées sur la proximité, et choisir la destination exacte. Ce guide vous aidera à configurer et à utiliser la recherche textuelle avec le SDK General Magic dans votre application Qt.

## Contexte

Le SDK Maps de General Magic, développé en collaboration avec KDAB, offre une solution complète pour intégrer des cartes et des fonctionnalités de navigation dans les applications QML. Il prend en charge la couverture globale, les cartes OpenStreetMap à jour, et propose des services de navigation avec guidage vocal en plusieurs langues.

## Prérequis

Avant de commencer, assurez-vous que vous avez les éléments suivants installés :

1. **Qt Framework** : Pour le développement de l'interface utilisateur avec QML et C++ (Version 5.15 ou supérieure) . 
2. **General Magic SDK** : Pour la simulation de chemin et la gestion des itinéraires.
3. **Clé API Magic Lane** : Obtenez une clé API depuis le site de Magic Lane.
4. **Environnement de Développement**: Un IDE compatible avec Qt, tel que Qt Creator, est recommandé pour le développement.
## Installation

### 1. Installer Qt Framework

1. Téléchargez et installez Qt Creator depuis le [site officiel de Qt](https://www.qt.io/download).
2. Assurez-vous d'avoir les modules Qt Quick et Qt Location installés.

### 2. Installer General Magic SDK

1. Téléchargez le SDK General Magic depuis le [site officiel de General Magic](https://www.general-magic.com/download).
2. Suivez les instructions d'installation pour votre système d'exploitation.

### 3. Configurer votre Clé API :

Obtenez une clé API depuis le site de Magic Lane.

## Utilisation


### 1. Configuration de la Clé API

```cpp
#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    // Remplacez "YOUR_TOKEN" par votre clé API réelle
    engine.rootContext()->setContextProperty("__my_secret_token", "YOUR_TOKEN");

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    return app.exec();
}
```
### 2. Intégration de General Magic

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
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

```


## Réalisation
1. **Lancer l'application:** Compilez et lancez l'application pour tester la fonctionnalité de recherche textuelle.
2. **Tester la Recherche:**  Entrez divers termes dans le champ de recherche et vérifiez que les suggestions apparaissent correctement et que la carte se centre sur la localisation sélectionnée.
3. **Vérifier la Performance:** Assurez-vous que la recherche est rapide et que les résultats sont affichés sans retard significatif.

![rechDes](https://github.com/user-attachments/assets/96e66ab0-84f8-4f20-b73f-d8e479b18be7)


## Conclusion
La fonctionnalité de recherche textuelle améliore l'interaction utilisateur en permettant de trouver des destinations par texte libre. En suivant ce guide, vous pouvez intégrer cette fonctionnalité dans votre application de cartographie Qt en utilisant le SDK General Magic. Assurez-vous de tester soigneusement et d'adapter le code en fonction des besoins spécifiques de votre projet.

