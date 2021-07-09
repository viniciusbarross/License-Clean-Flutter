import 'package:flutter/cupertino.dart';

class LoginController extends ChangeNotifier {
  bool _logado = false;
  LoginController(
    this._logado,
  );

  bool getLogado() {
    notifyListeners();
    return _logado;
  }
}
