import 'package:chat_app/Components/myButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/myTextField.dart';
import '../service/auth/authServices.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //textController
  final email = TextEditingController();
  final password = TextEditingController();

  void signin() async {
    // Validate input fields
    if (email.text.isEmpty || password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please fill in both fields'),
        ),
      );
      return;
    }

    // Get auth services
    final authService = Provider.of<AuthServices>(context, listen: false);

    try {
      // Sign in with email and password
      print('Attempting to sign in with email: ${email.text}');
      await authService.signInWithEmailAndPassword(email.text, password.text);
      print('Sign in successful');
    } catch (e) {
      print('Sign in error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 208, 242, 249),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  // logo
                  const Icon(
                    Icons.message_outlined,
                    size: 80,
                    color: Color(0xff023e8a),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  // message
                  const Text(
                    'Welcome back you\'ve missed!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff023e8a),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  // email textfield
                  MyTextField(
                      controller: email, hintText: 'Email', obscureText: false),
                  const SizedBox(
                    height: 10,
                  ),
                  // password textfield
                  MyTextField(
                      controller: password,
                      hintText: 'Password',
                      obscureText: true),
                  const SizedBox(
                    height: 25,
                  ),
                  // Button
                  MyButton(
                    text: 'Sign in',
                    onTap: signin,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Not a member?',
                        style: TextStyle(color: Color(0xff023e8a)),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Register Now',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff023e8a)),
                        ),
                      ),
                    ],
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
