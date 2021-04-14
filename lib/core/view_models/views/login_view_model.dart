import 'package:flutter/material.dart';

import '../../services/authentication_service.dart';

class LoginViewModel extends ChangeNotifier {
  AuthenticationService _authenticationService;
  bool _busy;

  LoginViewModel({
    @required AuthenticationService authenticationService,
  }) : _authenticationService = authenticationService;

  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  Future<bool> login(String userIdText) async {
    setBusy(true);
    int userId = int.tryParse(userIdText);
    bool success = await _authenticationService.login(userId);
    setBusy(false);
    return success;
  }
}
