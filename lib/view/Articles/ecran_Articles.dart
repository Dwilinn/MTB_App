import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';

import 'package:mtb_app/view_model/Articles_View_Model.dart';

// Remplacez ces informations par vos propres clés d'API Supabase
const supabaseUrl = 'https://vktppzsdiaezltvllnst.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZrdHBwenNkaWFlemx0dmxsbnN0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODYxMzM0NTgsImV4cCI6MjAwMTcwOTQ1OH0.3ARyrzhars3csUTebH8yb17dqaVeyAeSGLODZKEkbUc';

class EcranArticles extends StatefulWidget {
  const EcranArticles({Key? key}) : super(key: key);

  @override
  State<EcranArticles> createState() => _EcranArticlesState();
}

class _EcranArticlesState extends State<EcranArticles> {
  final ArticlesViewModel homeViewViewModel = ArticlesViewModel();
  final SupabaseClient supabaseClient = SupabaseClient(supabaseUrl, supabaseKey);
  List<Map<String, dynamic>> bikeList = [];

  @override
  void initState() {
    super.initState();
    fetchBikeData();
  }

  void fetchBikeData() async {
    final response = await supabaseClient.from('bike').select().execute();

    if (response.error != null) {
      // Gestion des erreurs ici
      print(response.error);
    } else {
      setState(() {
        bikeList = List<Map<String, dynamic>>.from(response.data ?? []);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final userSharedPreferences = Provider.of<UserViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Articles'),
      ),
      body: ListView.builder(
        itemCount: bikeList.length,
        itemBuilder: (context, index) {
          final bike = bikeList[index];
          final bikeName = bike['bike'];
          final tarif = bike['tarif'];

          return ListTile(
            title: Text(bikeName),
            trailing: Text('$tarif €'),
          );
        },
      ),
    );
  }
}
