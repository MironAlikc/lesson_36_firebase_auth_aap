import 'package:flutter/material.dart';
import 'package:lesson_36_firebase_auth/firebase_services.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: const Icon(Icons.send),
              onPressed: () async {
                bool isAuth = await FirebaseServices().resentPassword(
                  email: controller.text,
                );
                if (isAuth) {
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Error'),
                    ),
                  );
                }
              },
            ),
            hintText: 'Email',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ),
    );
  }
}
