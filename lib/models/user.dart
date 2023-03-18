import 'package:flutter/material.dart';

class User {
   String? userName;
   String email;
   String password ;

  User({this.userName ,required this.email,required this.password});

}


enum LoginState { initial, loading, failed, succeeded }

class LoginBloc extends ChangeNotifier {
  //make singleton
  LoginBloc._privateConstructor();
  static final LoginBloc _instance = LoginBloc._privateConstructor();
  factory LoginBloc() {
    return _instance;
  }
  LoginState state = LoginState.initial;

  login(String username, String password) async {
    state = LoginState.loading;
    notifyListeners();
    //call login api
    Future.delayed(const Duration(seconds: 3), () {
      state = LoginState.succeeded;
      notifyListeners();
    });
  }
}
