# Simulation de Chemin avec General Magic
## Description

Ce projet utilise le SDK Maps de General Magic pour implémenter une fonctionnalité de simulation de chemin dans une application Qt. Grâce à ce SDK, vous pouvez afficher des cartes interactives, tracer des itinéraires, et simuler la navigation avec des instructions vocales et des prévisions d'arrivée. Ce guide vous permettra de configurer et d'utiliser les fonctionnalités de simulation de chemin du SDK dans votre propre application Qt.

## Contexte

Le SDK Maps de General Magic, développé en collaboration avec KDAB, offre une solution complète pour intégrer des cartes et des fonctionnalités de navigation dans les applications QML. Il prend en charge la couverture globale, les cartes OpenStreetMap à jour, et propose des services de navigation avec guidage vocal en plusieurs langues.

## Prérequis

Avant de commencer, assurez-vous que vous avez les éléments suivants installés :

1. **Qt Framework** : Pour le développement de l'interface utilisateur avec QML et C++ (Version 5.15 ou supérieure) . 
2. **General Magic SDK** : Pour la simulation de chemin et la gestion des itinéraires.
3. **Clé API Magic Lane** : Obtenez une clé API depuis le site de Magic Lane.
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

1. **Configuration de la Clé API** :
  ```pro
QT += quick
CONFIG += c++11

# Ajoutez les chemins du SDK General Magic
INCLUDEPATH += /chemin/vers/general-magic-sdk/include
LIBS += -L/chemin/vers/general-magic-sdk/lib -lgeneral-magic

```


2. **Code QML de Base pour Afficher une Carte** :

   ```qml

   import QtQuick 2.12
   import QtQuick.Window 2.12
   import GeneralMagic 2.0

    Window {
        visible: true
        width: 640; height: 480
        title: qsTr("Simple Map")
    
        MapView {
            id: mapView
            anchors.fill: parent
            viewAngle: 0
            gesturesEnabled: true
        }
    
        Component.onCompleted: {
            ServicesManager.settings.token = __my_secret_token;
            ServicesManager.settings.mapLanguage = CommonSettings.NativeLanguage;
            ServicesManager.settings.allowInternetConnection = true;
            ServicesManager.contentUpdater(ContentItem.Type.RoadMap).autoApplyWhenReady = true;
            ServicesManager.contentUpdater(ContentItem.Type.RoadMap).update();
            ServicesManager.logLevel = ServicesManager.Error;
        }
    }
        }

   ```


### 3. Simulation de Chemin

**Démarrez la simulation dans votre interface QML** :
  ```qml
Button
{
    enabled: mapView.preferences.routeCollection.mainRoute.valid
    text: navigation.active ? "Stop simulation" : "Start simulation"
    onClicked: navigation.active = !navigation.active
}
  ```

## Dépannage

- **Problèmes de Configuration** : Assurez-vous que les chemins d'accès aux bibliothèques et aux en-têtes sont correctement configurés.
- **Erreurs de Compilation** : Vérifiez que toutes les dépendances sont correctement installées et que les versions sont compatibles.
- **Problèmes d'API** : Assurez-vous que votre clé API est valide et que les quotas d'utilisation ne sont pas dépassés.

## Conclusion

Cette documentation fournit des instructions détaillées pour l'intégration et l'utilisation de General Magic dans votre projet ADAVIA IHM pour la simulation de chemin. En suivant ces étapes, vous pouvez configurer et utiliser General Magic pour créer des itinéraires interactifs et fournir des instructions de navigation précises à la navette autonome.

Pour toute question ou assistance supplémentaire, veuillez consulter la documentation officielle de General Magic ou contacter le support technique.

