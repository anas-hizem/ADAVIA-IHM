# Avancement du Projet : Réception et Affichage de Données Ultrasoniques

## Description

Le projet se concentre sur l'intégration et l'affichage des données provenant de capteurs ultrasoniques dans une application Qt. Les capteurs ultrasoniques mesurent la distance à des objets et transmettent ces informations en temps réel. Le but est de lire ces données avec une carte Arduino Mega 2560, puis de les afficher de manière claire et intuitive dans l'interface utilisateur de l'application Qt.
## Objectifs

1. **Lire les Données des Capteurs Ultrasoniques** : Développer le code nécessaire pour lire les distances mesurées par les capteurs ultrasoniques à l'aide de l'Arduino.
2. **Transmettre les Données à l'Application Qt** : Établir une communication série entre l'Arduino et l'application Qt pour envoyer les données de distance.
3. **Afficher les Données en Temps Réel** : Créer une interface graphique dans Qt Quick pour afficher les distances mesurées par les capteurs ultrasoniques en temps réel.

## Prérequis

### Matériel

- **Arduino Mega 2560** : Microcontrôleur pour lire les données des capteurs ultrasoniques et envoyer les données via le port série
- **Capteurs ultrasoniques HC-SR04 (6 unités)** : Six capteurs ultrasoniques pour mesurer les distances à différents points autour du véhicule.
- **Câbles de connexion** : Pour relier les capteurs à l'Arduino et l'Arduino à l'ordinateur
- **Ordinateur** : Avec Arduino IDE pour le développement et Qt Creator pour la création de l'application.

### Logiciel

- Arduino IDE
- Qt Creator
- Bibliothèques Qt nécessaires

## Utilisation

1. **Préparation de l'Arduino** :
   - Connectez les capteurs ultrasoniques à la carte Arduino en suivant les instructions spécifiques pour le branchement des pins.
   - Téléversez le code Arduino fourni sur la carte pour commencer à lire les données des capteurs.

2. **Configuration de Qt** :
   - Configurez la connexion série entre l'Arduino et l'application Qt.
   - Intégrez le module de réception des données série dans votre application Qt.

3. **Démarrage de l'Application** :
   - Lancez l'application Qt pour afficher les données en temps réel.
   - Surveillez les distances mesurées par les capteurs via l'interface utilisateur.

## Réalisation

Le projet a été réalisé en plusieurs étapes clés :

1. **Développement du Code Arduino** :
   - Programmation pour lire les distances des capteurs et les envoyer via le port série.

2. **Développement de l'Interface Qt** :
   - Création de l'interface utilisateur pour afficher les distances.
   - Mise en place de la communication série pour recevoir les données en temps réel.

3. **Intégration des Données** :
   - Lecture des données des capteurs à partir du port série.
   - Affichage des distances sur l'interface utilisateur avec des indicateurs visuels pour les alertes d'obstacles.

## Prototype

![IMG_20240726_135615_634](https://github.com/user-attachments/assets/0be39602-cd07-4f56-b385-4aecf26e3912)

![Screenshot from 2024-07-29 15-47-33](https://github.com/user-attachments/assets/183218a1-2022-4f16-afe8-946e32f6ba43)


## Tests

Les tests réalisés incluent :

- **Vérification des Connexions** :
  - Validation des connexions des capteurs et de la communication série.
  
- **Validation des Données** :
  - Vérification que les distances mesurées sont correctement transmises et affichées.

- **Tests de l'Interface Utilisateur** :
  - Assurer que l'interface utilisateur réagit correctement aux changements de données et affiche les alertes d'obstacles comme prévu.

## Perspectives

Le projet pourrait évoluer vers les perspectives suivantes :

- **Amélioration des Alertes** :
  - Ajouter des alertes visuelles et sonores pour des distances critiques.

- **Optimisation de l'Interface** :
  - Améliorer l'interface utilisateur pour une meilleure lisibilité et réactivité.

- **Intégration avec d'autres Systèmes** :
  - Connecter le système de capteurs à d'autres parties de l'application ou à des systèmes externes pour une analyse plus complète.
