import 'package:chat_app/Screens/loginPage.dart';

import 'package:flutter/material.dart';

import '../../screens/signUpPage.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //Initially show the login page
  bool showLoginPage = true;

  //toogle between the login and register page

  void tooglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: tooglePages,);
    } else {
      return SignUpPage(onTap: tooglePages,);
    }
  }
}
