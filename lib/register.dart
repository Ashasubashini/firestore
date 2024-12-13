import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _auth = FirebaseAuth.instance;


  String username = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(80),
        child: Column(
          children: [
            Text("add a new product"),
            SizedBox(height: 20),
            TextField(
              onChanged: (value){
                username = value;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Email"
              ),
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (value){
                password = value;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Email"
              ),
            ),
            SizedBox(height: 20),
            MaterialButton(
              child: Text("Register user",
              style: TextStyle(color: Colors.white)),
              onPressed: () async {

                try {
                  var user = await _auth.createUserWithEmailAndPassword(email: username, password: password
                  );
                  if(user != null) {

                  }

                }catch(exception){
                  print('user not created');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

