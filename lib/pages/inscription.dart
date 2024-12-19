import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class InscriptionPage extends StatefulWidget {
  @override
  _InscriptionPageState createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  File? _imageFile;
  bool _privacyAccepted = false;

  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _motdepasseController = TextEditingController();
  final TextEditingController _confirmerMotdepasseController =
      TextEditingController();

  // Méthode pour prendre une photo ou choisir une image depuis la galerie
  Future<void> _pickImage() async {
    var cameraPermission = await Permission.camera.request();
    var storagePermission = await Permission.photos.request();

    if (cameraPermission.isGranted && storagePermission.isGranted) {
      final ImagePicker _picker = ImagePicker();
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Aucune image choisie.")),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Permissions caméra et stockage refusées.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image de fond fixe
          Positioned.fill(
            child: Image.asset(
              'assets/images/backgroundd.png', // Fond personnalisé
              fit: BoxFit.cover,
            ),
          ),
          // Formulaire défilable
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical:
                      40.0), // Ajouter un espacement en haut et sur les côtés
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 90, 62, 61)
                            .withOpacity(0.6),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  width: 350,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Création de compte',
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
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor:
                                const Color.fromARGB(255, 243, 171, 170),
                            child: _imageFile == null
                                ? const Icon(
                                    Icons.person,
                                    size: 50,
                                    color: Color.fromARGB(255, 157, 16, 70),
                                  )
                                : ClipOval(
                                    child: Image.file(
                                      _imageFile!,
                                      fit: BoxFit.cover,
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                          ),
                          Positioned(
                            right: -10,
                            bottom: -10,
                            child: IconButton(
                              icon: Icon(
                                Icons.camera_alt,
                                size: 28,
                                color: const Color.fromARGB(255, 88, 2, 39),
                              ),
                              onPressed: _pickImage,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      _buildTextField("Nom", _nomController),
                      const SizedBox(height: 15),
                      _buildTextField("Prénom", _prenomController),
                      const SizedBox(height: 15),
                      _buildTextField("Email", _emailController,
                          keyboardType: TextInputType.emailAddress),
                      const SizedBox(height: 15),
                      _buildTextField("Téléphone", _telephoneController,
                          keyboardType: TextInputType.phone),
                      const SizedBox(height: 15),
                      _buildTextField("Mot de Passe", _motdepasseController,
                          obscureText: true),
                      const SizedBox(height: 15),
                      _buildTextField("Confirmer le mot de passe",
                          _confirmerMotdepasseController,
                          obscureText: true),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Checkbox(
                            value: _privacyAccepted,
                            onChanged: (bool? value) {
                              setState(() {
                                _privacyAccepted = value ?? false;
                              });
                            },
                          ),
                          const Flexible(
                            child: Text(
                              'Accepter la politique de confidentialité',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_privacyAccepted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Compte créé avec succès!")),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    "Vous devez accepter la politique de confidentialité."),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFb80d57),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        child: const Text(
                          'Créer mon compte',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                          height: 20), // Ajout d'un espacement en bas
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text,
      bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF4f0002)),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF5CAC3).withOpacity(0.75),
            hintText: 'Entrez votre $label',
            hintStyle: const TextStyle(color: Color.fromARGB(150, 109, 66, 66)),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
      ],
    );
  }
}
