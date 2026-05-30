// ============================================================
// CONTRÔLEUR : EmissionController
// - Fait le lien entre le Modèle et la Vue
// - Contient la logique métier (charger les émissions, etc.)
// - NE contient AUCUN widget Flutter (pas de BuildContext,
//   pas de Navigator.push, pas de setState)
// ============================================================
import '../models/emission.dart';
import '../models/diffusion.dart';

class EmissionController {
  // ----------------------------------------------------------
  // Liste privée des émissions (données mockées)
  // Dans une vraie app, elles viendraient d'une API ou BD
  // ----------------------------------------------------------
  final List<Emission> _emissions = const [
    Emission(
      id: 'tag1',
      nom: 'Documentaires',
      chaineRadio: 'Radio 4',
      imagePath: 'assets/images/doc.jpg',
    ),
    Emission(
      id: 'tag2',
      nom: 'Tendances Mode',
      chaineRadio: 'Radio 3',
      imagePath: 'assets/images/mode.jpg',
    ),
    Emission(
      id: 'tag3',
      nom: 'Enquêtes Criminelles',
      chaineRadio: 'Radio 2',
      imagePath: 'assets/images/crime.jpg',
    ),
    Emission(
      id: 'tag4',
      nom: 'Match de Foot',
      chaineRadio: 'Radio 5',
      imagePath: 'assets/images/foot.jpg',
    ),
    Emission(
      id: 'tag5',
      nom: 'Streaming Météo',
      chaineRadio: 'Radio 1',
      imagePath: 'assets/images/meteo.jpg',
    ),
    Emission(
      id: 'tag6',
      nom: 'Que des news',
      chaineRadio: 'Radio 4',
      imagePath: 'assets/images/news.jpg',
    ),
  ];

  // ----------------------------------------------------------
  // getEmissions() : retourne la liste complète des émissions
  // Appelée par la Vue (HomePage) pour afficher la grille
  // ----------------------------------------------------------
  List<Emission> getEmissions() {
    return _emissions;
  }

  // ----------------------------------------------------------
  // getDiffusions() : retourne les diffusions d'une émission
  // Délègue la génération aléatoire au modèle Diffusion
  // Appelée par la Vue (DetailPage) pour afficher la liste
  // ----------------------------------------------------------
  List<Diffusion> getDiffusions(Emission emission) {
    return Diffusion.genererAleatoires(5);
  }

  // ----------------------------------------------------------
  // onEmissionSelected() : appelée quand l'utilisateur clique
  // sur une émission. Retourne l'émission choisie.
  // La navigation réelle est gérée par la Vue (pas ici).
  // ----------------------------------------------------------
  Emission onEmissionSelected(Emission emission) {
    return emission;
  }
}