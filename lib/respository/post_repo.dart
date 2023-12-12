import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:mvvm_try/model/post_model.dart';

class PostRepo {
  Future<PostModel> fetchPostModel() async {
    String Url = 'https://jsonplaceholder.typicode.com/posts';

    final response = await http.get(Uri.parse(Url));
    log('$response');

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return PostModel.fromJson(body);
    }
    throw Exception('Error');
  }
}
