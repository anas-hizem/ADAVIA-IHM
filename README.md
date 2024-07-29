# Avancement du Projet : Réception et Affichage de Données Ultrasoniques

## Description

Ce projet a pour but d'intégrer des capteurs ultrasoniques à une application Qt pour visualiser en temps réel les distances mesurées par les capteurs. Les données sont recueillies par une carte Arduino Mega 2560 et transmises à l'application via une communication série.

## Prérequis

### Matériel

- Arduino Mega 2560
- Capteurs ultrasoniques HC-SR04 (6 unités)
- Câbles de connexion
- Ordinateur avec ports USB

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
