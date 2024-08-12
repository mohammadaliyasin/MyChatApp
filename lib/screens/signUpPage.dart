import 'package:chat_app/Components/myButton.dart';
import 'package:chat_app/Screens/loginPage.dart';
import 'package:chat_app/components/myTextField.dart';
import 'package:chat_app/service/auth/authServices.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  final void Function()? onTap;
  const SignUpPage({super.key, required this.onTap});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //textController
  final confirmPassword = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  //signUp user
  void signUp() async{
  if(password.text != confirmPassword.text){
          ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Password don\'t match!',
          ),
        ),
      );
   //get authservice
   final authService = Provider.of<AuthServices>(context, listen: false);

    try {
      await authService.signUpWithEmailAndPassword(email.text, password.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
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
                  //logo
                  const Icon(
                    Icons.message_outlined,
                    size: 80,
                    color: Color(0xff023e8a),
                  ),

                  const SizedBox(
                    height: 25,
                  ),
                  //message
                  const Text(
                    'Let\'s create a account for you!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff023e8a),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  //email textfield
                  MyTextField(
                      controller: email, hintText: 'Email', obscureText: false),
                  const SizedBox(
                    height: 10,
                  ),
                  //password textfield
                  MyTextField(
                      controller: password,
                      hintText: 'Password',
                      obscureText: true),
                  const SizedBox(
                    height: 10,
                  ),
                  //Confirm password textfield
                  MyTextField(
                      controller: confirmPassword,
                      hintText: 'Confirm Password',
                      obscureText: false),

                  const SizedBox(
                    height: 25,
                  ),

                  //Button
                  const MyButton(text: 'Sign Up'),

                  const SizedBox(
                    height: 25,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already a member?',
                        style: TextStyle(color: Color(0xff023e8a)),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Login Now',
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
