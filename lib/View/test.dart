import 'package:flutter/material.dart';

class AfterLoginScreen extends StatelessWidget {
  final String username; // Assuming username is passed after login

  AfterLoginScreen({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello, $username!',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your test functionality here
              },
              child: const Text('Test Button'),
            ),
          ],
        ),
      ),
    );
  }
}
