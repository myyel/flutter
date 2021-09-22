import 'package:email_validator/email_validator.dart';
import 'package:firebas_authentication/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum FormStatus { signIn, register }

class EmailSignInPage extends StatefulWidget {
  const EmailSignInPage({Key? key}) : super(key: key);

  @override
  _EmailSignInPageState createState() => _EmailSignInPageState();
}

class _EmailSignInPageState extends State<EmailSignInPage> {
  FormStatus _formStatus = FormStatus.signIn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _formStatus == FormStatus.signIn
            ? buildSignInForm()
            : buildRegisterInForm(),
      ),
    );
  }

  Widget buildSignInForm() {
    final _signInKey = GlobalKey<FormState>();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _signInKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Lütfen giriş yapınız",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (input) {
                if (!EmailValidator.validate(input!)) {
                  return "Geçerli bir email adresi giriniz";
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                hintText: "E-Mail",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (input) {
                if (input!.length < 6) {
                  return "en az 6 karakter giriniz";
                } else {
                  return null;
                }
              },
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                hintText: "Şifre",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                print(_signInKey.currentState!.validate());
              },
              child: Text("Giriş"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _formStatus = FormStatus.register;
                });
              },
              child: Text("Yeni kayıt için tıklayınız"),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRegisterInForm() {
    final _registerKey = GlobalKey<FormState>();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _passwordConfirmController =
        TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _registerKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Kayıt Formu",
              style: TextStyle(fontSize: 25),
            ),
            TextFormField(
              controller: _emailController,
              validator: (input) {
                if (!EmailValidator.validate(input!)) {
                  return "Geçerli bir email adresi giriniz";
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                hintText: "E-Mail",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _passwordController,
              validator: (input) {
                if (input!.length < 6) {
                  return "en az 6 karakter giriniz";
                } else {
                  return null;
                }
              },
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                hintText: "Şifre",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _passwordConfirmController,
              validator: (value) {
                if (value != _passwordController.text) {
                  return "Şifreler uyuşmuyor";
                } else {
                  return null;
                }
              },
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                hintText: "Şifre Onay",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                if (_registerKey.currentState!.validate()) {
                  final user = await Provider.of<Auth>(context, listen: false)
                      .createUserWithEmailAndPassword(
                          _emailController.text, _passwordController.text);

                  if (user != null && !user.emailVerified) {
                    await user.sendEmailVerification();
                  }
                  await _showMyDialog();
                  setState(() {
                    _formStatus = FormStatus.signIn;
                  });
                }
              },
              child: Text("Kayıt ol"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _formStatus = FormStatus.signIn;
                });
              },
              child: Text("Zaten üye misiniz?"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Onay Gerekiyor'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Merhaba Lültfen mailinizi kontrol ediniz'),
                Text('Onay linkini tıklayıp tekrar giriş yapmalısınız'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Anladım'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
