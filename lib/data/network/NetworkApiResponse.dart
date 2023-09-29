import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mvvm_try/data/app_exeption.dart';
import 'package:mvvm_try/data/network/BaseApiResponse.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
    } on SocketException {
      throw FetDataExecption('No Internet Exeption');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(
            Uri.parse(url),
            body: data,
          )
          .timeout(
            const Duration(seconds: 10),
          );
    } on SocketException {
      throw FetDataExecption('No Internet Exeption');
    }
    return responseJson;
  }

  dynamic resturnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responsejson = jsonEncode(response.body.toString());
        return responsejson;
      case 400:
        throw BadRequestExecption(response.body.toString());
      case 404:
        throw UnauthorizeExecption(response.body.toString());

      default:
        throw FetDataExecption(
          'Error Occoured While Communication with server' +
              'with status code' +
              response.statusCode.toString(),
        );
    }
  }
}
