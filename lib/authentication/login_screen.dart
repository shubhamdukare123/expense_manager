import 'package:expensemanager/authentication/widgets/custom_authentication_button.dart';
import 'package:expensemanager/authentication/widgets/texteditor.dart';
import 'package:expensemanager/providers/auth_provider.dart';
import 'package:expensemanager/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State createState() => _LoginScreenState();
}

class _LoginScreenState extends State {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {

   var authprovider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        child: Container(
          height: 800,
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.all(20),
                child: Center(
                  child: Image.asset(
                    logo,
                    height: 85,
                    width: 90,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Login Your Account",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              //Username  Text Filed
              textDailogBox(usernameController,"UserName"),
              const SizedBox(
                height: 20,
              ),
              textDailogBox(passwordController,"Password"),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  //if(passwordController.text.toString().isNotEmpty && usernameController.text.toString().isNotEmpty){
                  authprovider.signIn(context, usernameController.text.toString().trim(),passwordController.text.toString().trim());
                  //}
                },
                child: (authprovider.loading)?const CircularProgressIndicator(color:Color.fromRGBO(14, 161, 125, 1),):customAuthButtton("Sign In"),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don’t have an account? ",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  //dont have account then sign up or make account
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupScreen()));
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(14, 161, 125, 1),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
