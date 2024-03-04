import 'package:flutter/material.dart';
import 'package:prosignal/pages/auth/login.dart';
import 'package:prosignal/pages/home.dart';
import 'package:prosignal/service/authservice.dart';
import 'package:prosignal/widgets/buttons/button.dart';
import 'package:prosignal/widgets/inputs/textbox.dart';
import 'package:prosignal/widgets/snackbar.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  AuthService authService = AuthService();
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isloading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
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
                        controller: usernameController,
                        text: "username",
                        textInputType: TextInputType.text,
                        obscure: false,
                        icon: Icons.person_2,
                      ),
                      const SizedBox(
                        height: 10,
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
                        controller: passwordController,
                        text: "password",
                        textInputType: TextInputType.emailAddress,
                        obscure: true,
                        icon: Icons.password,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ButtonGlobal(text: "Register", onTap: registerUser),
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
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ));
  }

  registerUser() async {
    if (usernameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      setState(() {
        isloading = true;
      });
      await authService
          .createNewUser(usernameController.text, emailController.text,
              passwordController.text)
          .then((value) {
        if (value == true) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const HomePage();
          }));
        } else {
          setState(() {
            isloading = false;
          });
          showSnackbar(context, Colors.red, value);
        }
      });
    } else if (usernameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      showSnackbar(context, Colors.red, "All fields are required");
    }
  }
}
