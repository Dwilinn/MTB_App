import 'package:flutter/material.dart';

import 'package:mtb_app/view_model/Modification_View_Model.dart';

import 'package:supabase/supabase.dart';

class EcranModification extends StatefulWidget {
  const EcranModification({Key? key}) : super(key: key);

  @override
  State<EcranModification> createState() => _EcranModificationState();
}

class _EcranModificationState extends State<EcranModification> {
  final ModificationViewModel homeViewViewModel = ModificationViewModel();

  static String supabaseUrl = 'https://vktppzsdiaezltvllnst.supabase.co';
  static String supabaseKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZrdHBwenNkaWFlemx0dmxsbnN0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODYxMzM0NTgsImV4cCI6MjAwMTcwOTQ1OH0.3ARyrzhars3csUTebH8yb17dqaVeyAeSGLODZKEkbUc';
  final supabaseClient = SupabaseClient(supabaseUrl, supabaseKey);

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nomController = TextEditingController();
  TextEditingController _prenomController = TextEditingController();
  TextEditingController _sexeController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nomController.dispose();
    _prenomController.dispose();
    _sexeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    PostgrestResponse<dynamic> response =
        await supabaseClient.from('users').select().single().execute();
    if (true) {
      //response.error = null
      final data = response.data;
      _usernameController.text = data['pseudo'] ?? '';
      _ageController.text = data['age'] ?? '';
      _emailController.text = data['email'] ?? '';
      _passwordController.text = data['password'] ?? '';
      _nomController.text = data['nom'] ?? '';
      _prenomController.text = data['prenom'] ?? '';
      _sexeController.text = data['sexe'] ?? '';
    } else {
      // Une erreur s'est produite lors de la récupération des données de l'utilisateur
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Erreur'),
            // content: Text(response.error!.message),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modification de compte'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Pseudo',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Age',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Adresse email',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Mot de passe',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _nomController,
              decoration: const InputDecoration(
                labelText: 'Nom',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _prenomController,
              decoration: const InputDecoration(
                labelText: 'Prénom',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _sexeController,
              decoration: const InputDecoration(
                labelText: 'Sexe',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                // Récupérer les valeurs des champs
                String username = _usernameController.text;
                String age = _ageController.text;
                String email = _emailController.text;
                String password = _passwordController.text;
                String nom = _nomController.text;
                String prenom = _prenomController.text;
                String sexe = _sexeController.text;

                // Mettre à jour les informations de l'utilisateur dans Supabase
                final response = await supabaseClient
                    .from('users')
                    .update({
                      'pseudo': username,
                      'age': age,
                      'email': email,
                      'password': password,
                      'nom': nom,
                      'prenom': prenom,
                      'sexe': sexe,
                    })
                    .eq('id', 1)
                    .execute();

                if (response.status == null) {
                  // Les modifications ont été sauvegardées avec succès
                  // Afficher une boîte de dialogue ou naviguer vers une autre page
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Modifications sauvegardées'),
                        content: const Text(
                            'Vos modifications ont été sauvegardées avec succès.'),
                        actions: [
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  // Une erreur s'est produite lors de la mise à jour des informations
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Erreur'),
                        // content: Text(response.error!.message),
                        actions: [
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text('Sauvegarder mes modifications'),
            ),
          ],
        ),
      ),
    );
  }
}
