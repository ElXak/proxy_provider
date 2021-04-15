import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_constants.dart';
import '../../core/view_models/views/login_view_model.dart';
import '../../logger.dart';
import '../shared/app_colors.dart';
import '../widgets/login_header.dart';
import 'base_view.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final log = getLogger('HomeView');
/*
  final Logger log = Logger(
    // printer: PrettyPrinter(
    //     methodCount: 0,
    //     errorMethodCount: 3,
    //     lineLength: 50,
    //     colors: true,
    //     printEmojis: true,
    //     printTime: false),
    printer: SimpleLogPrinter('HomeView'),
  );
*/

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      model: LoginViewModel(authenticationService: Provider.of(context)),
      child: LoginHeader(controller: _controller),
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            child,
            model.busy
                ? CircularProgressIndicator()
                : OutlinedButton(
                    style:
                        OutlinedButton.styleFrom(backgroundColor: Colors.white),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            log.v('This is verbose');
            log.d('This is a debug message');
            log.i('This is info, should be used for public calls');
            log.w('This might become a problem');
            log.e('Something bad has happened');
          },
        ),
      ),
    );
  }
}
