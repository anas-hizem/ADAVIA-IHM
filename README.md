# Interface de Streaming de Caméra

## Description

Ce projet vise à développer une interface de streaming de caméra pour un système de surveillance ou un véhicule autonome. L'interface affiche les flux vidéo en direct de quatre caméras (avant, arrière, et deux miroirs latéraux) et permet à l'utilisateur de sélectionner la caméra dont il souhaite voir le flux. En plus du flux vidéo, des contrôles de réglage pour la luminosité, le contraste, et le zoom sont également inclus.

## Prérequis

1. **Environnement de Développement**
   - Qt Creator ou un autre éditeur compatible avec Qt/QML.
   - Qt 6.x ou version ultérieure installée.

2. **Composants Matériels**
   - Caméras compatibles avec le système (avant, arrière, et miroirs latéraux).
   - Connecteurs et câbles nécessaires pour la connexion des caméras au système.

3. **Bibliothèques et Frameworks**
   - Qt Multimedia pour la gestion des flux vidéo.
   - Qt Quick pour le développement de l'interface utilisateur.

4. **Compétences**
   - Connaissance de Qt/QML et de la programmation en C++.
   - Compréhension des concepts de streaming vidéo.

## Composants Clés

1. **Image de la Navette**
   - Affiche les positions des caméras sur une image de vue de dessus de la navette.

2. **Flux Vidéo**
   - Éléments pour afficher les flux vidéo en direct des caméras sélectionnées.

3. **Sélecteur de Caméra**
   - Interface pour sélectionner la caméra dont le flux vidéo sera affiché.

4. **Contrôles de Réglage**
   - Boutons pour ajuster la luminosité, le contraste et le zoom des flux vidéo.

## Utilisation

1. **Lancer l'application**
   - Démarrez l'application via Qt Creator ou l'exécutable approprié.

2. **Sélectionner une Caméra**
   - Cliquez sur l'image représentant une caméra pour afficher son flux vidéo dans la zone de visualisation.
   - 
3. **Afficher les Flux Vidéo**
   - Le flux vidéo de la caméra sélectionnée sera affiché en temps réel dans la zone dédiée.
   - 
4. **Ajuster les Réglages**
   - Utilisez les contrôles de réglage pour modifier la luminosité, le contraste et le zoom du flux vidéo sélectionné.



## Réalisation

1. **Développement de l'Interface**
   - Création des éléments QML pour afficher l'image de la navette et les positions des caméras.
   - Intégration des flux vidéo en direct en utilisant Qt Multimedia.

2. **Implémentation des Contrôles**
   - Développement des contrôles pour ajuster la luminosité, le contraste, et le zoom des flux vidéo.
   - Ajout des fonctions de sélection de caméra et de mise à jour dynamique de l'affichage.

3. **Tests**
   - Vérification de l'affichage des flux vidéo en temps réel.
   - Tests des contrôles de réglage pour s'assurer qu'ils fonctionnent correctement avec les flux vidéo.

![Capture d’écran du 2024-07-24 18-57-19](https://github.com/user-attachments/assets/c60e1b1b-da15-4be4-8930-56d53cce93f3)


## Perspectives

1. **Interaction Matérielle**
   - Assurez-vous que le matériel des caméras est correctement configuré et intégré au système.
   - Évaluez les performances des flux vidéo en fonction de la qualité et de la latence des caméras.

2. **Réception et Envoi des Données**
   - Implémentez les mécanismes nécessaires pour recevoir les données des caméras et envoyer les commandes de réglage.
   - Vérifiez la synchronisation des flux vidéo avec les commandes de réglage pour une expérience utilisateur fluide.




