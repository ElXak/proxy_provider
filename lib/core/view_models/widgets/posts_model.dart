import 'package:flutter/material.dart';

import '../../models/post.dart';
import '../../services/api.dart';
import '../base_model.dart';

class PostsModel extends BaseModel {
  final Api _api;

  PostsModel({
    @required Api api,
  }) : _api = api;

  List<Post> posts;

  Future getPosts(int userId) async {
    setBusy(true);
    posts = await _api.getPostsForUser(userId);
    setBusy(false);
  }
}
