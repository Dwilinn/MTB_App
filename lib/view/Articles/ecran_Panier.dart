import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';

import 'ecran_Succes.dart';

const supabaseUrl = 'https://vktppzsdiaezltvllnst.supabase.co';
const supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZrdHBwenNkaWFlemx0dmxsbnN0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODYxMzM0NTgsImV4cCI6MjAwMTcwOTQ1OH0.3ARyrzhars3csUTebH8yb17dqaVeyAeSGLODZKEkbUc';

class EcranPanier extends StatefulWidget {
  const EcranPanier({Key? key}) : super(key: key);

  @override
  State<EcranPanier> createState() => _EcranPanierState();
}

class _EcranPanierState extends State<EcranPanier> {
  final SupabaseClient supabaseClient = SupabaseClient(supabaseUrl, supabaseKey);
  List<Map<String, dynamic>> panierList = [];
  double totalTarifs = 0.0;

  @override
  void initState() {
    super.initState();
    fetchPanierData();
  }

  void fetchPanierData() async {
    final response = await supabaseClient.from('panier').select().execute();

    if (response.error != null) {
      // Gestion des erreurs ici
      print(response.error);
    } else {
      final panierData = response.data ?? [];
      setState(() {
        panierList = List<Map<String, dynamic>>.from(panierData);
        totalTarifs = calculateTotalTarifs(panierList);
      });
    }
  }

double calculateTotalTarifs(List<Map<String, dynamic>> panierList) {
  double total = 0.0;
  for (final panier in panierList) {
    final tarif = (panier['tarif'] as int?)?.toDouble();
    if (tarif != null) {
      total += tarif;
    }
  }
  return total;
}


 void viderPanier() async {
  final deleteResponse = await supabaseClient
      .from('panier')
      .delete()
      .filter('id', 'gt', 0)
      .execute();

  if (deleteResponse.error != null) {
    print(deleteResponse.error);
  } else {
    setState(() {
      panierList.clear();
    });
    print('Panier vidé avec succès');
    totalTarifs = 0;
  }
}

  void validerPanier() {
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SuccessPage()),
    );
    viderPanier();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panier'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: panierList.length,
              itemBuilder: (context, index) {
                final panier = panierList[index];
                final tarif = panier['tarif'] as int;
                return ListTile(
                  title: Text(panier['type']),
                  trailing: Text('$tarif €'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total des tarifs : $totalTarifs €',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: viderPanier,
                child: Text('Vider Panier'),
              ),
              ElevatedButton(
                onPressed: validerPanier,
                child: Text('Valider'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
