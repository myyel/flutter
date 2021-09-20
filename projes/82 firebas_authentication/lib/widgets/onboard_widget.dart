import 'package:firebas_authentication/services/auth.dart';
import 'package:firebas_authentication/views/home_page.dart';
import 'package:firebas_authentication/views/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardWidget extends StatefulWidget {
  @override
  _OnboardWidgetState createState() => _OnboardWidgetState();
}

class _OnboardWidgetState extends State<OnboardWidget> {
  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<Auth>(context, listen: false);

    return StreamBuilder<User?>(
      stream: _auth.authStatus(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return snapshot.data != null ? HomePage() : SignInPage();
        } else {
          return SizedBox(
            height: 300,
            width: 300,
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
