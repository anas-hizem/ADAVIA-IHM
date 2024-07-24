# Intégration des Conditions Météorologiques dans l'Interface ADAVIA

## Description

Cette documentation couvre l'intégration des conditions météorologiques dans l'interface utilisateur du projet ADAVIA, une navette autonome. L'objectif est de fournir des informations météorologiques en temps réel, telles que la température et l'humidité, directement sur le tableau de bord principal. L'intégration utilise l'API OpenWeatherMap pour récupérer les données météorologiques.

## Prérequis

Avant d'utiliser cette fonctionnalité, assurez-vous d'avoir :

- **Qt Framework** : Qt 5.15 ou version ultérieure
- **Qt Creator** : IDE pour le développement avec Qt
- **API OpenWeatherMap** : Clé API valide pour accéder aux données météorologiques
- **Connaissances en QML et C++** : Pour comprendre et modifier les composants

## Fonctionnalités

- **Affichage des Données Météorologiques :**
  - Température actuelle
  - Humidité
  - Description des conditions météorologiques
  - Icônes représentant les conditions météorologiques

- **Gestion de l'État de Chargement :**
  - Affichage d'un message de chargement pendant la récupération des données
  - Affichage des informations météorologiques une fois les données prêtes

- **Changement de Ville :**
  - Sélection et changement de la ville pour récupérer les données météorologiques pour différentes localités
  - Utilisation du GPS pour déterminer la localisation actuelle

## Utilisation

Pour intégrer et utiliser les conditions météorologiques dans votre projet :

1. **Configuration de l'API :**
   - Obtenez une clé API d'OpenWeatherMap et configurez-la dans le modèle de données `AppModel`.

2. **Intégration dans le Projet :**
   - Incluez le fichier QML de météo dans votre interface utilisateur.
   - Assurez-vous que les composants `WeatherInfo` et les icônes météorologiques sont correctement référencés.

3. **Tests :**
   - Vérifiez que les données météorologiques s'affichent correctement et que les interactions (comme le changement de ville) fonctionnent comme prévu.

## Composants Clés

- **`weatherArea` :** Conteneur principal pour l'affichage des informations météorologiques.
  - États de chargement et prêt pour la gestion des données.
- **`AppModel` :** Modèle de données pour la récupération et la gestion des données météorologiques.
- **`BigForecastIcon` :** Affiche les conditions météorologiques actuelles avec une grande icône.
- **`ForecastIcon` :** Affiche les prévisions météorologiques pour les prochains jours.

## Réalisation

1. **Développement du Composant Météo :**
   - Création du `Rectangle` principal pour afficher les données météorologiques.
   - Implémentation des états de chargement et prêt pour gérer les données en attente.
   - Utilisation des composants `BigForecastIcon` et `ForecastIcon` pour afficher les informations météorologiques actuelles et les prévisions.

2. **Intégration de l'API :**
   - Connexion à l'API OpenWeatherMap pour récupérer les données météorologiques.
   - Mise en place de la logique pour la mise à jour des données en fonction de la ville sélectionnée ou de la localisation GPS.

3. **Test et Validation :**
   - Tests pour vérifier que les données sont récupérées correctement et que l'affichage est conforme aux attentes.
   - Validation des interactions utilisateur pour s'assurer que les fonctionnalités de changement de ville et de rafraîchissement fonctionnent comme prévu.




## Prochaines Étapes

1. **Optimisation de l'Interface :**
   - Améliorer l'apparence visuelle des icônes et des affichages pour une meilleure intégration avec le design global de l'interface.

2. **Ajout de Fonctionnalités :**
   - Intégrer des fonctionnalités supplémentaires comme la prévision horaire ou des alertes météorologiques.

3. **Tests Étendus :**
   - Effectuer des tests sur différents appareils et configurations pour garantir une performance et une fiabilité optimales.

4. **Documentation et Déploiement :**
   - Compléter la documentation pour inclure les nouvelles fonctionnalités.
   - Préparer le déploiement de la fonctionnalité dans l'interface finale de la navette autonome.

