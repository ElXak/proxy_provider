import 'package:flutter/material.dart';

import '../../models/comment.dart';
import '../../services/api.dart';
import '../base_model.dart';

class CommentsModel extends BaseModel {
  final Api _api;

  CommentsModel({
    @required Api api,
  }) : _api = api;

  List<Comment> comments;

  Future getComments(int postId) async {
    setBusy(true);
    comments = await _api.getCommentsForPost(postId);
    setBusy(false);
  }

  @override
  void dispose() {
    print('I have been disposed!');
    super.dispose();
  }
}
