import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mvvm_try/model/book_model.dart';

class BookRepo {
  Future<BookModel> fetchBookApi() async {
    String Url =
        'https://openlibrary.org/people/mekBot/books/currently-reading.json';

    final response = await http.get(Uri.parse(Url));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return BookModel.fromJson(body);
    }
    throw Exception("Error");
  }

  Future<Work> fetchWorkApi() async {
    String Url =
        'https://openlibrary.org/people/mekBot/books/currently-reading.json';

    final response = await http.get(Uri.parse(Url));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return Work.fromJson(body);
    }
    throw Exception("Error");
  }
}
