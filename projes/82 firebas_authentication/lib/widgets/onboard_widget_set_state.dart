import 'package:firebas_authentication/views/home_page.dart';
import 'package:firebas_authentication/views/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OnboardWidget extends StatefulWidget {
  @override
  _OnboardWidgetState createState() => _OnboardWidgetState();
}

class _OnboardWidgetState extends State<OnboardWidget> {
  late bool _isLogged;

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        _isLogged = false;
      } else {
        _isLogged = true;
      }

      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isLogged == null
        ? Center(child: CircularProgressIndicator())
        : _isLogged
            ? HomePage()
            : SignInPage();
  }
}
