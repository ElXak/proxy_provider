import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_constants.dart';
import '../../core/models/user.dart';
import '../../core/view_models/widgets/posts_model.dart';
import '../views/base_widget.dart';
import 'post_list_item.dart';

class Posts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<PostsModel>(
      model: PostsModel(api: Provider.of(context)),
      onModelReady: (model) => model.getPosts(Provider.of<User>(context).id),
      builder: (context, model, child) => model.busy
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: model.posts.length,
              itemBuilder: (context, index) => PostListItem(
                post: model.posts[index],
                onTap: () => Navigator.pushNamed(context, RoutePaths.Post,
                    arguments: model.posts[index]),
              ),
            ),
    );
  }
}
