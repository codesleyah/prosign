import 'package:flutter/material.dart';
import 'package:prosignal/pages/auth/login.dart';
import 'package:prosignal/pages/home.dart';
import 'package:prosignal/widgets/buttons/button.dart';
import 'package:prosignal/widgets/inputs/textbox.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController paswordController = TextEditingController();

    return Scaffold(
        body: Center(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "images/logo.png",
              height: 150,
            ),
            TextBox(
              controller: emailController,
              text: "email",
              textInputType: TextInputType.emailAddress,
              obscure: false,
              icon: Icons.email,
            ),
            const SizedBox(
              height: 10,
            ),
            TextBox(
              controller: paswordController,
              text: "password",
              textInputType: TextInputType.emailAddress,
              obscure: true,
              icon: Icons.password,
            ),
            const SizedBox(
              height: 10,
            ),
            ButtonGlobal(
              text: "Register",
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const HomePage();
                }));
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Have an Account ?",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return const Login();
                    }));
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
