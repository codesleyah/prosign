import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prosignal/helper/helperfunctions.dart';
import 'package:prosignal/pages/auth/register.dart';
import 'package:prosignal/pages/home.dart';
import 'package:prosignal/service/authservice.dart';
import 'package:prosignal/service/databaseservice.dart';
import 'package:prosignal/widgets/buttons/button.dart';
import 'package:prosignal/widgets/inputs/textbox.dart';
import 'package:prosignal/widgets/snackbar.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController paswordController = TextEditingController();
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isloading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
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
                        ButtonGlobal(text: "Login", onTap: loginUser),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Row(
                            children: [
                              Text(
                                "Forgot Password ?",
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 16),
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
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ));
  }

  loginUser() async {
    if (emailController.text.isNotEmpty && paswordController.text.isNotEmpty) {
      setState(() {
        isloading = true;
      });
      await AuthService()
          .loginUser(emailController.text, paswordController.text)
          .then((value) async {
        if (value == true) {
          QuerySnapshot user =
              await DatabaseService().getUserdata(emailController.text);
          await HelperFunctions.setUserLoggedInStatus(true);
          await HelperFunctions.setUserEmailSF(user.docs[0]['email']);
          await HelperFunctions.setUsernameSF(user.docs[0]['username']);
          await HelperFunctions.setUserIdSF(user.docs[0]['uid']);

          // ignore: use_build_context_synchronously
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
    } else if (emailController.text.isEmpty || paswordController.text.isEmpty) {
      showSnackbar(context, Colors.red, "All fields are required");
    }
  }
}
