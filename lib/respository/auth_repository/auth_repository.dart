import 'package:mvvm_try/data/network/BaseApiResponse.dart';
import 'package:mvvm_try/data/network/NetworkApiResponse.dart';
import 'package:mvvm_try/res/app_url.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    } catch (e) {
      throw (e);
    }
  }

  Future<dynamic> regApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.registerEndPoint, data);
      return response;
    } catch (e) {
      throw (e);
    }
  }
}
