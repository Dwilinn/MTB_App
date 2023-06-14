import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';

const supabaseUrl = 'https://vktppzsdiaezltvllnst.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZrdHBwenNkaWFlemx0dmxsbnN0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODYxMzM0NTgsImV4cCI6MjAwMTcwOTQ1OH0.3ARyrzhars3csUTebH8yb17dqaVeyAeSGLODZKEkbUc';

class EcranArticlesTarif extends StatefulWidget {
  const EcranArticlesTarif({Key? key}) : super(key: key);

  @override
  State<EcranArticlesTarif> createState() => _EcranArticlesTarifState();
}

class _EcranArticlesTarifState extends State<EcranArticlesTarif> {
  final SupabaseClient supabaseClient = SupabaseClient(supabaseUrl, supabaseKey);
  List<Map<String, dynamic>> forfaitsList = [];

  @override
  void initState() {
    super.initState();
    fetchTarifData();
  }

  void fetchTarifData() async {
    final response = await supabaseClient.from('forfaits').select().execute();

    if (response.error != null) {
      // Gestion des erreurs ici
      print(response.error);
    } else {
      setState(() {
        forfaitsList = List<Map<String, dynamic>>.from(response.data ?? []);
      });
    }
  }

  Future<void> addToPanier(Map<String, dynamic> forfait) async {
    final insertResponse = await supabaseClient
        .from('panier')
        .insert([
          {
            'id_articles': forfait['id'],
            'type': forfait['forfait_choisi'],
            'tarif': forfait['tarif']
          }
        ])
        .execute();

    if (insertResponse.error != null) {
      // Gestion des erreurs ici
      print(insertResponse.error);
    } else {
      // Succès de l'ajout au panier
      print('Article ajouté au panier avec succès');
    }
  }

  @override
  Widget build(BuildContext context) {
    // final userSharedPreferences = Provider.of<UserViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tarifs'),
      ),
      body: ListView.builder(
        itemCount: forfaitsList.length,
        itemBuilder: (context, index) {
          final forfait = forfaitsList[index];
          final forfaitName = forfait['forfait_choisi'];
          final tarif = forfait['tarif'];

          return ListTile(
            title: Text(forfaitName),
            trailing: Text('$tarif €'),
            onTap: () {
              addToPanier(forfait);
            },
          );
        },
      ),
    );
  }
}
