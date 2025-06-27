import 'package:flutter/material.dart';
import 'todo_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? error;

  final dummyUsers = {
    'owner@gmail.com': 'owner123',
    'student@gmail.com': 'student123',
  };

  void _login() {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (dummyUsers.containsKey(email) && dummyUsers[email] == password) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TodoScreen(currentUser: email),
        ),
      );
    } else {
      setState(() {
        error = 'Invalid credentials';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 10,
        title: const Text('LOGIN')),
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          width: 300,
          height: 400,
           decoration: BoxDecoration(
                border: Border.all(
                color: Colors.blue, // Blue border color
                  width: 2.0,          // Border thickness
                   ),
                    borderRadius: BorderRadius.circular(12),
              ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('LOGIN',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold, ),)]),
                      SizedBox(height: 20,),
                TextField(
                  controller: emailController,
                  decoration:  InputDecoration(labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                     borderRadius:  BorderRadius.circular(8),

                  )),
                ),
                SizedBox(height: 18,),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password',
                  prefixIcon: Icon(Icons.remove_red_eye_outlined),
                  border: OutlineInputBorder(
                     borderRadius:  BorderRadius.circular(8),

                  )),
                ),
                if (error != null) Text(error!, style: const TextStyle(color: Colors.red)),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _login,
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}