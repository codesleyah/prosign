import 'package:flutter/material.dart';
import 'package:prosignal/pages/auth/register.dart';
import 'package:prosignal/pages/home.dart';
import 'package:prosignal/widgets/buttons/button.dart';
import 'package:prosignal/widgets/inputs/textbox.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController paswordController = TextEditingController();

    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(20.0),
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
            text: "Login",
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const HomePage();
              }));
            },
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {},
            child: const Row(
              children: [
                Text(
                  "Forgot Password ?",
                  style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "New User ?",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return const Register();
                  }));
                },
                child: const Text(
                  "Register",
                  style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
