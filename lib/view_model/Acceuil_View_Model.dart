import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mtb_app/utils/routes/routes_name.dart';

import '../repository/home_repository.dart';

class AcceuilViewModel with ChangeNotifier {
  final myRepo = HomeRepository();

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> drawerSet(BuildContext context) async {
    setLoading(true);
    setLoading(false);
    Navigator.pushNamed(context, RoutesName.categories);
  }
}
