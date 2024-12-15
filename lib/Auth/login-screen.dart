// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hasadak_1/Auth/signup-screen.dart';
import 'package:hasadak_1/Backend/firebase_functions.dart';
import 'package:hasadak_1/home-screen.dart';
import 'package:hasadak_1/photos/images.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = 'login page';

  LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF6EDE8A),
              Color(0xFF4AD66D),
              Color(0xFF155D27),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey, // Form Key for validation
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 100), // Adding some spacing at the top

                  // Logo or Image at the top
                  Image.asset(Photos.login, height: 200),

                  const SizedBox(
                      height: 30), // Spacing between image and text fields

                  // Email TextFormField
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: "Enter your email",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 15, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color(0xff0000000),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 30),

                  // Password TextFormField
                  TextFormField(
                    controller: passwordController,
                    obscureText: true, // Hide password
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: "Enter your password",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 15, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color(0xff000000),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 50),

                  // Login Button
                  ElevatedButton(
                    onPressed: () {
                      // Navigator.pushReplacementNamed(
                      //     context, HomeScreen.routeName);
                      FirebaseFunctions.Login(onSuccess: () async {
                        // user.initUser();
                        await Future.delayed(Duration(milliseconds: 500));
                        Navigator.pushReplacementNamed(
                            context, HomeScreen.routeName);
                      }, onError: (e) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Error"),
                            content: Text(e.toString()),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }, emailController.text, passwordController.text);
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff10451D),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Sign Up Prompt
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, SignUpPage.routeName);
                    },
                    child: Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        text: "Don't have an account? ",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 15, color: Color(0xff000000)),
                        children: const [
                          TextSpan(
                            text: "Sign up",
                            style: TextStyle(
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
