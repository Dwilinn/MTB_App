import 'package:mtb_app/data/network/base_api_services.dart';
import 'package:mtb_app/data/network/network_api_services.dart';
import '../ressources/app_urls.dart';

class AuthRepository {
  //This apiServices give access of this NetworkApiServices class
  BaseApiServices apiServices = NetworkApiService();
  Future<dynamic> loginApi(dynamic data) async {
    dynamic response = await apiServices.postApiResponse(AppUrl.loginUrl, data);
    try {
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> registrationApi(dynamic data) async {
    dynamic response =
        await apiServices.postApiResponse(AppUrl.registerUrl, data);
    try {
      return response;
    } catch (e) {
      throw e;
    }
  }
}
