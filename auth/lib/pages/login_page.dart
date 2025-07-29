import 'package:auth/auth/auth_service.dart';
import 'package:auth/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // get auth service
  final authService = AuthService();

  // text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // login button pressed
  void login() async {
      // prepare data
      final email = _emailController.text;
      final password = _passwordController.text;

      try {
    await authService.signInWithEmailPassword(email, password);
  }

  catch (e) {
    if (mounted) {
      ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Error: $e"),));
    }
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 50),
        children: [

          // email
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: "Email"),
          ),

          // password
          TextField(
            controller: _passwordController,
             decoration: const InputDecoration(labelText: "Password"),
          ),

          const SizedBox(height: 12,),

          // ElavatiedButton
          ElevatedButton(onPressed: login, child: const Text("Login"),),

          const SizedBox(height: 12,),

          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage(),)),
            child: const Center(
              child: Text("Don't have an account? Sign Up"),
            ),
            ),
        ],
      ),
    );
  }
}