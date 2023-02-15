
import 'dart:convert';

import 'package:auth/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class RegPage extends StatelessWidget {
  RegPage({Key? key}) : super(key: key);

  final TextEditingController _nameController= TextEditingController();
  final TextEditingController _emailController= TextEditingController();
  final TextEditingController _passwordController= TextEditingController();


  // final url = Uri.parse('http://192.168.3.6:3000/api/login');


  Future signUp(String name, String email, String password) async {

    final url = Uri.parse('http://192.168.3.6:3000/api/register');
    var res = await http.post(
        url,
        body: {
          "name": name,
          "email": email,
          "password": password
        }
    );

    return res.statusCode;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                            children: [
                              Text("Sign Up",textAlign: TextAlign.center,style: TextStyle(fontSize: 25),),
                              SizedBox(height: 10,),
                              TextField(
                                controller: _nameController,
                                decoration: InputDecoration(
                                    labelText: 'Name'
                                ),),
                              TextField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                    labelText: 'Email'
                                ),
                              ),
                              TextField(
                                controller: _passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                    labelText: 'Password'
                                ),


                              ),
                              SizedBox(height: 10,),


                              ElevatedButton(onPressed: ()async {
                                var name = _nameController.text;
                                var email = _emailController.text;
                                var password = _passwordController.text;

                                if(name.length < 4)
                                  displayDialog(context, "Invalid Username", "The username should be at least 4 characters long");
                                else if(password.length < 4)
                                  displayDialog(context, "Invalid Password", "The password should be at least 4 characters long");
                                else{
                                  var res = await signUp(name, email, password);
                                  if(res == 201){

                                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),);
                                    displayDialog(context, "Success", "user created. Log in now.");
                                  }


                                  else if(res == 409)
                                    displayDialog(context, "That username is already registered", "Please try to sign up using another username or log in if you already have an account.");

                                  else {
                                    displayDialog(context, "Error", "An unknown error occurred.");
                                  }
                                }
                              }, child: Text("SignUp"),),
                              SizedBox(height: 10,),
                              Text("or"),

                              TextButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),);
                              }, child: Text("Log In"))
                            ]
                        )
                    ),
                  ),
                ),
              ),
            ),
          ],
        )

    );
  }
}



void displayDialog(BuildContext context, String title, String text) =>
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
              title: Text(title),
              content: Text(text)
          ),
    );


/* var res = await http.post(
        Uri.parse('http://127.0.0.1:3000/api/login'),
        body: {
         // "name": name,
          "email": email,
          "password": password
        }
    );

    if(res.statusCode== 200) return res.body;
    return null;*/