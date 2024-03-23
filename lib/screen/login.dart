import 'package:flutter/material.dart';
import 'package:kuis_123210005/screen/top_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String errorMessage = "";
  String emailError = "";
  String passError = "";

  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: emailController,
              enabled: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                  hintText: "Email",
                  labelText: "Email",
                  errorText: emailError.isEmpty ? null : errorMessage),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: passController,
              enabled: true,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),
                  hintText: "Password",
                  labelText: "Password",
                  errorText: passError.isEmpty ? null : errorMessage),
            ),
          ),
          Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.sizeOf(context).width,
              child: OutlinedButton(
                  onPressed: () {
                    if (emailController.text.isEmpty ||
                        passController.text.isEmpty) {
                      setState(() {
                        errorMessage = "Silakan masukkan password dan email";
                      });
                    } else {
                      if (!emailController.text.contains("@")) {
                        setState(() {
                          errorMessage = "Masukkan email dengan benar";
                        });
                      } else if (passController.text.length < 8) {
                        setState(() {
                          errorMessage = "Password kurang dari 8 karakter";
                        });

                      } else {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return TopPage();
                        }));
                      }
                    }

                    SnackBar snackBar = SnackBar(content: Text(errorMessage));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Text("LOGIN"))),
          // Text(message)
        ],
      ),
    );
  }
}
