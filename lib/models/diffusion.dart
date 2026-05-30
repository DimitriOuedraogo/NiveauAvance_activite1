// ============================================================
// MODÈLE : Diffusion
// - Représente une diffusion (épisode) d'une émission
// - AUCUN import Flutter
// - Contient la logique de génération aléatoire des diffusions
// ============================================================
import 'dart:math';

class Diffusion {
  final String nom;   // Ex: "Diffusion 1"
  final String date;  // Ex: "2023-06-15"

  const Diffusion({
    required this.nom,
    required this.date,
  });

  // ----------------------------------------------------------
  // Méthode statique : génère une liste de N diffusions
  // aléatoires pour une émission donnée.
  // Appelée par le contrôleur, PAS par les vues.
  // ----------------------------------------------------------
  static List<Diffusion> genererAleatoires(int nombre) {
    final random = Random();
    final List<Diffusion> diffusions = [];

    // On génère `nombre` diffusions avec des dates aléatoires
    for (int i = 1; i <= nombre; i++) {
      int mois = random.nextInt(12) + 1;
      int jour = random.nextInt(28) + 1;
      diffusions.add(Diffusion(
        nom: 'Diffusion $i',
        date:
            '2023-${mois.toString().padLeft(2, '0')}-${jour.toString().padLeft(2, '0')}',
      ));
    }
    return diffusions;
  }
}