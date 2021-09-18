import 'package:firebas_authentication/widgets/my_raised_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                print("Çıkış Yapıldı");
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign In Page",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 30,
            ),
            MyRaisedButton(
              color: Colors.orangeAccent,
              child: Text("Sign in anonymously"),
              onPressed: () async {
                UserCredential userCredential =
                    await FirebaseAuth.instance.signInAnonymously();
                print(userCredential);
                print("Giriş yapıldı");
              },
            ),
            MyRaisedButton(
              color: Colors.yellow,
              child: Text("Sign in email/password"),
              onPressed: () {},
            ),
            MyRaisedButton(
              color: Colors.lightBlueAccent,
              child: Text("Sign in with google"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
