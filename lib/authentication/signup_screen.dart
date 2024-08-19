
import "package:expensemanager/authentication/login_screen.dart";
import "package:expensemanager/authentication/widgets/custom_authentication_button.dart";
import "package:expensemanager/authentication/widgets/texteditor.dart";
import "package:expensemanager/providers/auth_provider.dart";
import "package:expensemanager/utils/constant.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:shared_preferences/shared_preferences.dart";

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State createState() => _SignupScreenState();
}

class _SignupScreenState extends State {
  //Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =TextEditingController();


  @override
  Widget build(BuildContext context) {

    var Authprovider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        child: Container(
          height: 800,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 60,
              ),
              // Image contaner
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
                  "Create Your Account",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              ///Name text Field
              textDailogBox(nameController, "Name"),
              const SizedBox(
                height: 20,
              ),

              ///UserName TextField
              textDailogBox(usernameController, "Username"),
              const SizedBox(
                height: 20,
              ),

              ///Password TextField
              textDailogBox(passwordController, "Password"),
              const SizedBox(
                height: 20,
              ),

              ///Confirm password
              textDailogBox(confirmpasswordController, "Confirm Password"),
              const SizedBox(
                height: 20,
              ),
              /// Singn Up button
              GestureDetector(
                onTap: () {
                  Authprovider.signUp( context,
                                    nameController.text.toString().trim(),
                                    usernameController.text.toString().trim(),
                                    passwordController.text.toString().trim()
                                    );
                },
                child:(Authprovider.loading)?const CircularProgressIndicator(color: Color.fromRGBO(14, 161, 125, 1),):customAuthButtton("Sign Up"),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  //Text button for login or sign up for user
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ));
                    },
                    child: const Text(
                      "Sign In",
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
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
