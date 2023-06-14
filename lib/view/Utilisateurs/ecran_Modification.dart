import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';

const supabaseUrl = 'https://vktppzsdiaezltvllnst.supabase.co';
const supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZrdHBwenNkaWFlemx0dmxsbnN0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODYxMzM0NTgsImV4cCI6MjAwMTcwOTQ1OH0.3ARyrzhars3csUTebH8yb17dqaVeyAeSGLODZKEkbUc';
final supabaseClient = SupabaseClient(supabaseUrl, supabaseKey);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modification de compte',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AccountModificationPage(),
    );
  }
}

class AccountModificationPage extends StatefulWidget {
  @override
  _AccountModificationPageState createState() =>
      _AccountModificationPageState();
}

class _AccountModificationPageState extends State<AccountModificationPage> {
  late Future<Map<String, dynamic>>? _userDataFuture;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nomController = TextEditingController();
  TextEditingController _prenomController = TextEditingController();
  TextEditingController _sexeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Récupérer les informations de l'utilisateur depuis la base de données
    _userDataFuture = fetchUserData();
  }

late String userId = '1';

Future<Map<String, dynamic>> fetchUserData() async {
  PostgrestResponse<dynamic> response =
      await supabaseClient.from('users').select().eq('id', userId).single().execute();
  if (response.error == null) {
    final data = response.data;
    _usernameController.text = data['pseudo'] ?? '';
    _ageController.text = data['age']?.toString() ?? '';
    _emailController.text = data['email'] ?? '';
    _passwordController.text = data['password'] ?? '';
    _nomController.text = data['nom'] ?? '';
    _prenomController.text = data['prenom'] ?? '';
    _sexeController.text = data['sexe'] ?? '';
    return data;
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erreur'),
          content: Text(response.error!.message),
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
    return {};
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modification de compte'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _userDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Une erreur s\'est produite: ${snapshot.error}'),
            );
          }

          final userData = snapshot.data;

          return Padding(
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
                          'age': int.tryParse(age),
                          'email': email,
                          'password': password,
                          'nom': nom,
                          'prenom': prenom,
                          'sexe': sexe,
                        })
                        .eq('id', userData?['id'])
                        .execute();

                    if (response.error == null) {
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
                            content: Text(response.error!.message),
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
          );
        },
      ),
    );
  }
}
