import 'package:firebas_authentication/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await Provider.of<Auth>(context, listen: false)
                    .signOutAnonymous();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Container(
          child: Text("Home Page"),
        ),
      ),
    );
  }
}
