import 'package:flutter/material.dart';
import 'package:kuis_123210005/screen/top_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String password = "";
  String message = "";

  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: emailController,
              enabled: true,
              decoration: InputDecoration(hintText: "Email"),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: passController,
              enabled: true,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.sizeOf(context).width,
              child: OutlinedButton(
                  onPressed: () {
                    if (emailController.text != null &&
                        passController.text != null) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return TopPage();
                      }));
                    } else {
                      setState(() {
                        message = "Silakan masukkan email dan password";
                      });
                    }

                    SnackBar snackBar = SnackBar(content: Text(message));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Text("LOGIN"))),
          // Text(message)
        ],
      ),
    );
  }
}
