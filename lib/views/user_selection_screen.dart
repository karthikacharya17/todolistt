import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/task_view_model.dart';
import 'task_list_view.dart';

class UserSelectionScreen extends StatefulWidget {
  const UserSelectionScreen({super.key});

  @override
  State<UserSelectionScreen> createState() => _UserSelectionScreenState();
}

class _UserSelectionScreenState extends State<UserSelectionScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  String? _error;

  void _login(BuildContext context) {
    final email = _email.text.trim();
    final password = _password.text.trim();

    if (email == 'owner@email.com' && password == 'owner123') {
      Provider.of<TaskViewModel>(context, listen: false).setUser("OWNER");
      Navigator.push(context, MaterialPageRoute(builder: (_) => const TaskListView()));
    } else if (email == 'student@email.com' && password == 'student123') {
      Provider.of<TaskViewModel>(context, listen: false).setUser("STUDENT");
      Navigator.push(context, MaterialPageRoute(builder: (_) => const TaskListView()));
    } else {
      setState(() {
        _error = "Invalid credentials";
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
        title: const Text("LOGIN",style: TextStyle(fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 19, 24, 27),
        fontFamily: 'IndieFlower'),
        )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('LOGIN',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,fontFamily: 'Roboto', ),)]),
                    SizedBox(height: 20,),
                TextField(controller: _email,
                
                decoration:  InputDecoration(labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                fillColor: Colors.white12,
                border: OutlineInputBorder(
                  borderRadius:  BorderRadius.circular(8),

                )
                
                )),
                SizedBox(height: 18,),
                TextField(
                  controller: _password,
                  decoration:  InputDecoration(labelText: 'Password',
                  prefixIcon: Icon(Icons.remove_red_eye_outlined),
                  border: OutlineInputBorder(
                     borderRadius:  BorderRadius.circular(8),

                  )),
                  obscureText: true,
                ),
                if (_error != null) Text(_error!, style: const TextStyle(color: Colors.red)),
                const SizedBox(height: 20),
                OutlinedButton(onPressed: () => _login(context), child: const Text("Login",style: TextStyle(
                  color: Color.fromARGB(255, 31, 26, 26)
                ),)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
