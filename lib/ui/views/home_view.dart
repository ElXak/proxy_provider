import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/models/user.dart';
import '../shared/app_colors.dart';
import '../shared/text_styles.dart';
import '../shared/ui_helpers.dart';
import '../widgets/posts.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UIHelper.verticalSpaceLarge,
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Welcome ${Provider.of<User>(context).name}',
              style: headerStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              'Here are all your posts',
              style: subHeaderStyle,
            ),
          ),
          UIHelper.verticalSpaceSmall,
          Expanded(
            child: Posts(),
          ),
        ],
      ),
    );
  }
}
