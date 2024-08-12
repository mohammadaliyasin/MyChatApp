import 'package:chat_app/Screens/loginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'service/auth/authGate.dart';
import 'service/auth/authServices.dart';

void main() async {
  // Ensure widgets binding is initialized before Firebase is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Start the application
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthServices>(
          create: (context) => AuthServices(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      debugShowCheckedModeBanner: false, // Hide debug banner
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true, // Use Material 3 design language
      ),
      home: const AuthGate(), // Start with the AuthGate to manage auth flow
    );
  }
}
