// ============================================================
// VUE : DetailPage
// - Page de détail d'une émission
// - Reçoit une Emission et sa liste de Diffusion via constructeur
// - Les diffusions sont préparées par le contrôleur (pas ici)
// - NE contient AUCUNE logique métier
// ============================================================
import 'package:flutter/material.dart';
import '../models/emission.dart';
import '../models/diffusion.dart';

class DetailPage extends StatelessWidget {
  final Emission emission;           // L'émission à afficher
  final List<Diffusion> diffusions;  // Les diffusions (générées par le contrôleur)

  const DetailPage({
    super.key,
    required this.emission,
    required this.diffusions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ----------------------------------------------------------
      // APP BAR transparente par-dessus l'image
      // ----------------------------------------------------------
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(Icons.favorite_border, color: Colors.white),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --------------------------------------------------
          // IMAGE HERO : transition fluide depuis la grille
          // --------------------------------------------------
          SizedBox(
            height: 280,
            width: double.infinity,
            child: Hero(
              tag: emission.id, // Même tag que dans CarteEmission
              child: Image.asset(
                emission.imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // --------------------------------------------------
          // BANDEAU VIOLET : nom + chaîne radio
          // --------------------------------------------------
          Container(
            width: double.infinity,
            color: Colors.deepPurple,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  emission.nom,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  emission.chaineRadio,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // --------------------------------------------------
          // LISTE DES DIFFUSIONS
          // Reçues via le constructeur (générées par contrôleur)
          // --------------------------------------------------
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: diffusions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.volume_up, color: Colors.black54),
                  title: Text(
                    '${diffusions[index].nom} -    Date: ${diffusions[index].date}',
                    style: const TextStyle(fontSize: 14),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}