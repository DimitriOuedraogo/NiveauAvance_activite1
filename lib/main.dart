// ============================================================
// MAIN.DART — Point d'entrée de la Version 2 (MVC)
// - Lance l'application avec MonApplication
// - MonApplication pointe vers HomePage (la vue principale)
// ============================================================
import 'package:flutter/material.dart';
import 'views/home_page.dart';

void main() {
  runApp(const MonApplication());
}

class MonApplication extends StatelessWidget {
  const MonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Streaming App MVC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const HomePage(), // Point d'entrée vers la Vue principale
    );
  }
}