# Streaming App — Version MVC

## Description
Application Flutter d'émissions de streaming organisée selon l'architecture **MVC (Modèle - Vue - Contrôleur)**.

---

## Structure du projet

```
lib/
├── main.dart                          
├── models/
│   ├── emission.dart                
│   └── diffusion.dart                
├── controllers/
│   └── emission_controller.dart       
└── views/
    ├── home_page.dart                
    ├── grille_emissions.dart          
    ├── carte_emission.dart           
    └── detail_page.dart            
```

---

## Répartition des responsabilités MVC

### Modèle (`models/`)
- Contient uniquement les **classes de données** : `Emission` et `Diffusion`
- **Aucun import Flutter** (`material.dart` interdit)
- `Diffusion.genererAleatoires()` contient la logique de génération des données

### Vue (`views/`)
- Contient tous les **widgets d'affichage**
- Ne contient **aucune logique métier**
- Reçoit les données via les **paramètres du constructeur**
- Les interactions utilisateur sont remontées via des **callbacks**

###  Contrôleur (`controllers/`)
- Fait le **lien** entre Modèle et Vue
- Expose `getEmissions()`, `getDiffusions()`, `onEmissionSelected()`
- **Pas de widgets**, pas de `Navigator.push` directement
- La navigation reste la responsabilité de la Vue

---

## Schéma des échanges MVC

```
Utilisateur
    │
    ▼ (tap sur une émission)
[VUE — CarteEmission]
    │ callback onTap()
    ▼
[VUE — GrilleEmissions]
    │ callback onTap(emission)
    ▼
[VUE — HomePage]
    │ appelle _controller.onEmissionSelected()
    │ appelle _controller.getDiffusions()
    ▼
[CONTRÔLEUR — EmissionController]
    │ lit les données
    ▼
[MODÈLE — Emission / Diffusion]
    │ retourne les données
    ▼
[CONTRÔLEUR] retourne à HomePage
    │
    ▼ Navigator.push(DetailPage)
[VUE — DetailPage]
```

---

## Comment exécuter l'application

### Prérequis
- Flutter SDK installé
- Un émulateur Android/iOS ou un appareil physique

### Étapes

1. **ouvrir le projet**
2. **Ajouter les images** dans `assets/images/` :
   - `doc.jpg`, `mode.jpg`, `crime.jpg`, `foot.jpg`, `meteo.jpg`, `news.jpg`
3. **Déclarer les assets** dans `pubspec.yaml` :
   ```yaml
   flutter:
     assets:
       - assets/images/
   ```
4. **Installer les dépendances** :
   ```bash
   flutter pub add responsive_grid
   flutter pub get
   ```
5. **Lancer l'application** :
   ```bash
   flutter run
   ```

---

## Fonctionnalités
- Grille réactive d'émissions (titre, chaîne, image)
- Navigation vers un écran de détail avec animation Hero
- Écran de détail : image, nom, chaîne, liste de diffusions aléatoires
- Barre de navigation inférieure (Accueil, Recherche, Profil)
