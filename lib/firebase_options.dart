import 'package:flutter/material.dart';
import 'package:vendini/pages/panier.dart';
import 'package:vendini/pages/connexion.dart'; // Importez correctement le fichier connexion.dart
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // Assurez-vous d'appeler WidgetsFlutterBinding.ensureInitialized() avant d'initialiser Firebase
  WidgetsFlutterBinding.ensureInitialized();

  // Initialisation de Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Lancer l'application après l'initialisation de Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page principale')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Lorsque le bouton est pressé, on navigue vers la page de panier
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PanierPage()),
            );
          },
          child: Text('Aller à la page suivante'),
        ),
      ),
    );
  }
}
