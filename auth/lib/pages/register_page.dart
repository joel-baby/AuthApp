import 'package:auth/auth/auth_service.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  // get auth service
  final authService = AuthService();

  // text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // sign up button pressed
  void signUp() async {
    // prepare data
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context)
        .showSnackBar( const SnackBar(content: Text("Password don't match")));
        return;
    }

    try {
      await authService.signUpWithEmailPassword(email, password);

      Navigator.pop(context);
    } catch (e) {
      if (mounted) {
         ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Error: $e")));
      } 
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
       body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12,vertical: 50),
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
             obscureText: true,
          ),

          // confirm password
          TextField(
            controller: _confirmPasswordController,
             decoration: const InputDecoration(labelText: "Confirm Password"),
          ),

          const SizedBox(height: 12,),

          // ElavatiedButton
          ElevatedButton(onPressed: signUp, child: const Text("Sign Up"),),

        ],
      ),
    );
  }
}