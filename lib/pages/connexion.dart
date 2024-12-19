import 'package:flutter/material.dart';
import 'package:vendini/pages/inscription.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/backgroundd.png', // Assurez-vous que cette image existe
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.only(
                  top: 350.0), // Déplacer le conteneur vers le bas
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.6),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color:
                        const Color.fromARGB(255, 90, 62, 61).withOpacity(0.6),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: const Offset(0, 5), // Ombre vers le bas
                  ),
                ],
              ),
              width: 350,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Connectez-Vous',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFb80d57),
                      shadows: [
                        Shadow(
                          color: Color.fromARGB(255, 39, 0, 14),
                          offset: Offset(0, 0.5),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email :',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4f0002),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFF5CAC3).withOpacity(0.75),
                      hintText: 'Entrez votre email',
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(150, 109, 66, 66)),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF4f0002)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Mot de passe :',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4f0002),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFF5CAC3).withOpacity(0.75),
                      hintText: 'Entrez votre mot de passe',
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(150, 109, 66, 66)),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF4f0002)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      // Vérifiez les entrées ici
                      print('Email: ${_emailController.text}');
                      print('Mot de passe: ${_passwordController.text}');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFb80d57),
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Se Connecter',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Vous n'avez pas un compte ? ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4f0002),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Redirection vers l'écran d'inscription
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    InscriptionPage()), // Correction ici
                          );
                        },
                        child: const Text(
                          'Créer un',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFb80d57),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
