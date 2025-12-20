# i_trade

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Application Flutter permettant de créer et gérer des listes d’envies. Le projet utilise une architecture MVC organisée avec un dossier core pour centraliser les ressources communes. Ce README intègre la documentation du projet, le guide de contribution, les templates de PR/Issues, et les conventions Git.

🏗️ Architecture du projet
L'application suit le pattern Model-View-Controller (MVC) enrichi par un dossier core pour l'injection des dépendances et la centralisation des utilitaires.

1. Structure des dossiers
lib/ ├── models/ # Structures de données (WishlistItem, User, JSON serialization) ├── views/ # UI : Pages, écrans, widgets (sans logique métier) ├── controllers/ # Logique métier : actions → modèles → services ├── services/ # API REST, base locale, fichiers, abstraction des données └── core/ # Contenu transversal ├── theme/ # Thèmes : couleurs, typographies ├── constants/ # Textes, URLs, clés statiques └── utils/ # Helpers, Formatters, Validators, Logger

Structure détaillée
models/

Représentations des objets (WishlistItem, User…)

Sérialisation JSON

Structure de données stable

views/

Interfaces utilisateur (pages, widgets)

Interaction avec les contrôleurs

Aucun traitement métier

controllers/

Gèrent les états et les actions

Manipulent les modèles

Appellent les services

Exposent des méthodes pour les vues

services/

Gestion des données

Appels HTTP / APIs

Local storage (Hive / SQLite)

Stockage & cache

core/

Thème global

Constantes générales

Fonctions utilitaires
