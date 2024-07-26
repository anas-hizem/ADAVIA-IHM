# Développement de l'Interface de Détection Ultrasonique

## a. Description
L'interface de détection ultrasonique est conçue pour afficher en temps réel les distances mesurées par les capteurs ultrasoniques installés sur une navette autonome. Cette interface fournit une visualisation intuitive des distances aux obstacles pour améliorer la navigation et la sécurité du véhicule.

## b. Contexte
Ce projet fait partie du développement d'un système d'interface homme-machine (IHM) pour la gestion d'une navette autonome. L'interface de détection ultrasonique est un composant clé pour la navigation en temps réel, permettant aux opérateurs et aux systèmes automatisés de prendre des décisions basées sur les données des capteurs ultrasoniques.

## c. Prérequis
- **Qt** (version 5.15 ou supérieure)
- **Qt Quick** (pour la création d'interfaces utilisateur modernes)
- **QML** (pour la définition de l'interface utilisateur)
- **C++** (pour la gestion des données des capteurs)
- **Capteurs ultrasoniques** (connectés à la navette)

## d. Composants Clés
1. **UltrasonSensor.qml**: Composant QML principal pour afficher les données des capteurs.
2. **Canvas**: Utilisé pour dessiner les ondes ultrasoniques autour des capteurs.
3. **Repeater**: Pour créer plusieurs instances de capteurs avec des positions et angles spécifiques.
4. **Connections**: Pour lier les changements de propriétés C++ aux éléments QML.
5. **Text**: Pour afficher les valeurs des distances et autres informations de débogage.

## e. Utilisation
Pour utiliser l'interface de détection ultrasonique, il suffit d'intégrer le fichier `UltrasonSensor.qml` dans votre projet Qt Quick et de s'assurer que les valeurs des capteurs sont mises à jour correctement à partir du backend C++. Les valeurs des capteurs doivent être connectées aux propriétés QML correspondantes pour que les distances et les ondes soient affichées en temps réel.

## f. Réalisation
### 1. Création de l'interface
- **Image de la navette**: Ajoutée pour un contexte visuel.
- **Capteurs ultrasoniques**: Placés autour de la navette avec des positions et des angles spécifiques.
- **Dessins des ondes**: Utilisation de `Canvas` pour dessiner les ondes ultrasoniques en fonction des distances mesurées.

### 2. Débogage et affichage des valeurs
- **Éléments Text**: Ajoutés pour afficher les distances et les angles de chaque capteur.
- **Console logs**: Utilisés pour vérifier les valeurs des propriétés et les calculs des ondes.

### 3. Intégration C++
- **Propriétés QML**: Connectées aux signaux C++ pour mettre à jour les valeurs des distances en temps réel.
- **Mise à jour des ondes**: Fonction de mise à jour du `Canvas` pour redessiner les ondes en fonction des nouvelles distances.


![Capture d’écran du 2024-07-25 18-23-41](https://github.com/user-attachments/assets/25fb2bae-0ab4-409e-8921-b6a8488e990b)

## g. Prochaine Étape
### Interaction Matérielle et Réception des Données des Capteurs
1. **Intégration Matérielle**: Connecter les capteurs ultrasoniques réels à la navette autonome et s'assurer qu'ils envoient les données correctes au système.
2. **Gestion des Données**: Développer un module en C++ pour lire les données des capteurs ultrasoniques et les envoyer à l'interface QML.
3. **Amélioration de l'Interface**: Affiner l'affichage des ondes et des alertes visuelles et sonores pour une meilleure visualisation des obstacles.

Avec ces étapes, l'interface de détection ultrasonique sera prête à être testée dans un environnement réel et à fournir des informations précieuses pour la navigation autonome.
