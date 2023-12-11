import 'package:mvvm_try/model/book_model.dart';
import 'package:mvvm_try/respository/book_repo.dart';

class PostViewModel {
  final _repo = BookRepo();

  Future<BookModel> fetchBookApi() async {
    final response = await _repo.fetchBookApi();
    return response;
  }

  Future<Work> fetchWorkApi() async {
    final response = await _repo.fetchWorkApi();
    return response;
  }
}
