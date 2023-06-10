import 'package:mtb_app/model/list_ressource_model.dart';

import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';
import '../ressources/app_urls.dart';

class HomeRepository {
  BaseApiServices apiServices = NetworkApiService();
  Future<ListResourceModel> homeScreenApi() async {
    dynamic response = await apiServices.getApiResponse(AppUrl.homeUrl);
    try {
      return response = ListResourceModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
