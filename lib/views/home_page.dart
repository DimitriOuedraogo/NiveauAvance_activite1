// ============================================================
// VUE : HomePage
// - Page d'accueil de l'application
// - Utilise EmissionController pour obtenir les données
// - Gère la navigation vers DetailPage
// - Contient l'AppBar + GrilleEmissions + BottomNavigationBar
// ============================================================
import 'package:flutter/material.dart';
import '../controllers/emission_controller.dart';
import '../models/emission.dart';
import 'grille_emissions.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ----------------------------------------------------------
  // Le contrôleur est instancié dans la Vue
  // Il sera passé aux sous-vues via callbacks
  // ----------------------------------------------------------
  final EmissionController _controller = EmissionController();
  int _selectedIndex = 0; // Index de la BottomNavigationBar

  // ----------------------------------------------------------
  // Méthode de navigation : appelée quand l'utilisateur
  // clique sur une émission dans la grille.
  // 1. On demande au contrôleur l'émission sélectionnée
  // 2. On demande au contrôleur les diffusions associées
  // 3. La Vue navigue vers DetailPage (c'est son rôle !)
  // ----------------------------------------------------------
  void _naviguerVersDetail(Emission emission) {
    final emissionSelectionnee = _controller.onEmissionSelected(emission);
    final diffusions = _controller.getDiffusions(emissionSelectionnee);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(
          emission: emissionSelectionnee,
          diffusions: diffusions,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // On récupère la liste des émissions depuis le contrôleur
    final emissions = _controller.getEmissions();

    return Scaffold(
      // ----------------------------------------------------------
      // APP BAR amber
      // ----------------------------------------------------------
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: const Icon(Icons.search, color: Colors.white),
        title: const Text(
          'Vos émissions en streaming',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(Icons.menu, color: Colors.white),
          ),
        ],
      ),

      // ----------------------------------------------------------
      // BODY : GrilleEmissions reçoit la liste + le callback
      // ----------------------------------------------------------
      body: Center(
        child: GrilleEmissions(
          emissions: emissions,
          onTap: _naviguerVersDetail, // La grille remonte les clics ici
        ),
      ),

      // ----------------------------------------------------------
      // BOTTOM NAVIGATION BAR
      // ----------------------------------------------------------
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Recherche',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}