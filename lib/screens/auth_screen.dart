import 'package:flutter/material.dart';
import 'package:lesson_36_firebase_auth/firebase_services.dart';
import 'package:lesson_36_firebase_auth/screens/home_screen.dart';
import 'package:lesson_36_firebase_auth/screens/registr_screen.dart';
import 'package:lesson_36_firebase_auth/screens/reset_password_page.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerEmail = TextEditingController();
    final controllerPassword = TextEditingController();
    //final auth = FirebaseServices(); // экземпляр класса
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: controllerEmail,
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: controllerPassword,
              decoration: InputDecoration(
                hintText: 'Passowrd',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () async {
                  bool isAuthorized = await FirebaseServices().authByEmail(
                    email: controllerEmail.text,
                    password: controllerPassword.text,
                  );
                  if (isAuthorized) {
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  } else {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Error'),
                      ),
                    );
                  }
                },
                child: const Text(
                  'Auth',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ResetPasswordPage(),
                  ),
                );
              },
              child: const Text('Forgot password'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegistrScreen(),
                  ),
                );
              },
              child: const Text('Registration'),
            ),
          ],
        ),
      ),
    );
  }
}
