import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/auth/authServices.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //sign out user
  void signOut() {
    //get auth service
    final authService = Provider.of<AuthServices>(context, listen: false);
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
        actions: [
          IconButton(
            onPressed: signOut,
            icon: Icon(Icons.logout_outlined),
          ),
        ],
      ),
    );
  }
}
