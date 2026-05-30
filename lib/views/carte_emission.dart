// ============================================================
// VUE : CarteEmission
// - Widget purement visuel pour afficher UNE émission
// - Reçoit une Emission et une fonction onTap via constructeur
// - NE contient AUCUNE logique métier
// - La navigation est déclenchée via le callback onTap
//   (c'est la vue parente qui décide quoi faire)
// ============================================================
import 'package:flutter/material.dart';
import '../models/emission.dart';

class CarteEmission extends StatelessWidget {
  final Emission emission;       // Données de l'émission à afficher
  final VoidCallback onTap;      // Callback : appelé au clic (par la vue parente)

  const CarteEmission({
    super.key,
    required this.emission,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Décoration : coins arrondis + ombre
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: GestureDetector(
          // onTap remonte l'action à la vue parente (GrilleEmissions)
          // qui elle-même la remonte à HomePage, qui appelle le contrôleur
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --------------------------------------------------
              // IMAGE avec animation Hero (transition fluide)
              // Le tag unique = emission.id
              // --------------------------------------------------
              Hero(
                tag: emission.id,
                child: Image.asset(
                  emission.imagePath,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              // --------------------------------------------------
              // INFOS : nom + chaîne radio
              // --------------------------------------------------
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      emission.nom,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      emission.chaineRadio,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}