import 'package:firebas_authentication/views/home_page.dart';
import 'package:firebas_authentication/views/sign_in_page.dart';
import 'package:flutter/material.dart';

class OnboardWidget extends StatefulWidget {
  @override
  _OnboardWidgetState createState() => _OnboardWidgetState();
}

class _OnboardWidgetState extends State<OnboardWidget> {
  bool _isLogged = false;

  @override
  Widget build(BuildContext context) {
    return _isLogged ? HomePage() : SignInPage();
  }
}
