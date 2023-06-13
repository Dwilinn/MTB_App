import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';

const supabaseUrl = 'https://vktppzsdiaezltvllnst.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZrdHBwenNkaWFlemx0dmxsbnN0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODYxMzM0NTgsImV4cCI6MjAwMTcwOTQ1OH0.3ARyrzhars3csUTebH8yb17dqaVeyAeSGLODZKEkbUc';

class EcranArticlesEquipements extends StatefulWidget {
  const EcranArticlesEquipements({Key? key}) : super(key: key);

  @override
  State<EcranArticlesEquipements> createState() => _EcranArticlesEquipementsState();
}

class _EcranArticlesEquipementsState extends State<EcranArticlesEquipements> {
  final SupabaseClient supabaseClient = SupabaseClient(supabaseUrl, supabaseKey);
  List<Map<String, dynamic>> equipementList = [];

  @override
  void initState() {
    super.initState();
    fetchEquipementData();
  }

  void fetchEquipementData() async {
    final response = await supabaseClient.from('equipements').select().execute();

    if (response.error != null) {
      // Gestion des erreurs ici
      print(response.error);
    } else {
      setState(() {
        equipementList = List<Map<String, dynamic>>.from(response.data ?? []);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final userSharedPreferences = Provider.of<UserViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Equipements'),
      ),
      body: ListView.builder(
        itemCount: equipementList.length,
        itemBuilder: (context, index) {
          final equipement = equipementList[index];
          final equipementName = equipement['equipement'];
          final tarif = equipement['tarif'];

          return ListTile(
            title: Text(equipementName),
            trailing: Text('$tarif €'),
          );
        },
      ),
    );
  }
}