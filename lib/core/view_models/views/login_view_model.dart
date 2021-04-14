import 'package:flutter/material.dart';

import '../../services/authentication_service.dart';
import '../base_model.dart';

class LoginViewModel extends BaseModel {
  AuthenticationService _authenticationService;

  LoginViewModel({
    @required AuthenticationService authenticationService,
  }) : _authenticationService = authenticationService;

  Future<bool> login(String userIdText) async {
    setBusy(true);
    int userId = int.tryParse(userIdText);
    bool success = await _authenticationService.login(userId);
    setBusy(false);
    return success;
  }
}
