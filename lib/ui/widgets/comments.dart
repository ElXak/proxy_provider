import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proxy_provider/ui/views/base_view.dart';

import '../../core/models/comment.dart';
import '../../core/view_models/widgets/comments_model.dart';
import '../shared/app_colors.dart';
import '../shared/ui_helpers.dart';

class Comments extends StatelessWidget {
  final int postId;
  Comments(this.postId);

  @override
  Widget build(BuildContext context) {
    return BaseView<CommentsModel>(
      onModelReady: (model) => model.getComments(postId),
      model: CommentsModel(api: Provider.of(context)),
      builder: (context, model, child) => model.busy
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Expanded(
              child: ListView.builder(
                  itemCount: model.comments.length,
                  itemBuilder: (context, index) => CommentItem(
                        model.comments[index],
                      ))),
    );
  }
}

/// Renders a single comment given a comment model
class CommentItem extends StatelessWidget {
  final Comment comment;
  const CommentItem(this.comment);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: commentColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            comment.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          UIHelper.verticalSpaceSmall,
          Text(comment.body),
        ],
      ),
    );
  }
}
