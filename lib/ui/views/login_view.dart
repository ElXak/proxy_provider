import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proxy_provider/core/constants/app_contstants.dart';
import 'package:proxy_provider/ui/widgets/login_header.dart';

import '../../core/view_models/views/login_view_model.dart';
import '../shared/app_colors.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>.value(
      value: LoginViewModel(authenticationService: Provider.of(context)),
      child: Consumer<LoginViewModel>(
        child: LoginHeader(controller: _controller),
        builder: (context, model, child) => Scaffold(
          backgroundColor: backgroundColor,
          body: Column(
            children: [
              child,
              model.busy
                  ? CircularProgressIndicator()
                  : OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white),
                      onPressed: () async {
                        bool loginSuccess = await model.login(_controller.text);
                        if (loginSuccess) {
                          Navigator.pushNamed(context, RoutePaths.Home);
                        }
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
