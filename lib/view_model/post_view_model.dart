import 'package:mvvm_try/model/post_model.dart';
import 'package:mvvm_try/respository/post_repo.dart';

class PostViewModel {
  final _postRepo = PostRepo();
  Future<PostModel> fetchPostModel() async {
    final respose = await _postRepo.fetchPostModel();
    return respose;
  }
}
