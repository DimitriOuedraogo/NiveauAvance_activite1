// ============================================================
// VUE : GrilleEmissions
// - Affiche la grille réactive de CarteEmission
// - Reçoit la liste d'émissions ET un callback onTap
// - NE connaît pas le contrôleur directement
// - Délègue le onTap à chaque CarteEmission
// ============================================================
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../models/emission.dart';
import 'carte_emission.dart';

class GrilleEmissions extends StatelessWidget {
  final List<Emission> emissions;                  // Liste fournie par HomePage
  final void Function(Emission) onTap;             // Callback : que faire au clic ?

  const GrilleEmissions({
    super.key,
    required this.emissions,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridList(
      desiredItemWidth: 160,  // Largeur souhaitée par élément
      minSpacing: 8,          // Espacement minimum entre éléments
      // Pour chaque émission, on crée une CarteEmission
      // On passe le callback onTap pour remonter l'action
      children: emissions
          .map((emission) => CarteEmission(
                emission: emission,
                onTap: () => onTap(emission),
              ))
          .toList(),
    );
  }
}