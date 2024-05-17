import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SafeArea(
        child: Center(
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: decoration(
                    "Username",
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: decoration(
                    "Password",
                  ),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return const AlertDialog(
                          content: SizedBox(
                            height: 100,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: const Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

InputDecoration decoration(
  String label,
) {
  return InputDecoration(
    border: const OutlineInputBorder(),
    labelText: label,
  );
}
