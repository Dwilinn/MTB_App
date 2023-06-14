import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:supabase/supabase.dart';
import '../repository/home_repository.dart';

const supabaseUrl = 'https://vktppzsdiaezltvllnst.supabase.co';
const supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZrdHBwenNkaWFlemx0dmxsbnN0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODYxMzM0NTgsImV4cCI6MjAwMTcwOTQ1OH0.3ARyrzhars3csUTebH8yb17dqaVeyAeSGLODZKEkbUc';

class AcceuilViewModel with ChangeNotifier {
  final myRepo = HomeRepository();

  final SupabaseClient supabaseClient =
      SupabaseClient(supabaseUrl, supabaseKey);
  List<Map<String, dynamic>> mapList = [];

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  late GoogleMapController controller;
  late PanelController _pc;

  late BitmapDescriptor markerIcon;

  Future<void> _onPanelCreated(PanelController _pc) async {
    this._pc = _pc;
  }

  void _onMapCreated(GoogleMapController controller) {
    this.controller = controller;
  }

  Future<void> addCustomIcon() async {
    BitmapDescriptor.fromAssetImage(const ImageConfiguration(),
            "lib/ressources/Assets/map/epingler.png")
        .then(
      (icon) {
        markerIcon = icon;
      },
    );
  }

  Future<void> fetchMapData() async {
    final response = await supabaseClient.from('map').select().execute();

    if (response.error != null) {
      print(response.error);
    } else {
      notifyListeners();
      mapList = List<Map<String, dynamic>>.from(response.data ?? []);
      _addMarkers(mapList);
    }
  }

  void _addMarkers(List<Map<String, dynamic>> markerListe) {
    for (final point in markerListe) {
      String id = 'markerId$point[\'id\']';
      final MarkerId markerId = MarkerId(id);
      final Marker marker = Marker(
        markerId: markerId,
        position: LatLng(
          point['lattitude'],
          point['longitude'],
        ),
        icon: markerIcon,
        draggable: false,
        onTap: () {
          _pc.open();
        },
      );
      markers[markerId] = marker;
    }
  }
}
