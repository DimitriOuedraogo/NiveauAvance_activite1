// ============================================================
// MODÈLE : Emission
// - Contient uniquement les données d'une émission
// - AUCUN import Flutter (pas de material.dart)
// - Respecte la règle MVC : le modèle est indépendant de l'UI
// ============================================================

class Emission {
  final String id;          // Identifiant unique (utilisé pour le tag Hero)
  final String nom;         // Nom de l'émission
  final String chaineRadio; // Nom de la chaîne radio
  final String imagePath;   // Chemin vers l'image de l'émission

  // Constructeur : tous les champs sont obligatoires
  const Emission({
    required this.id,
    required this.nom,
    required this.chaineRadio,
    required this.imagePath,
  });
}