
import 'package:auth/auth/reg.dart';
import 'package:auth/view/home.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late String jwt;

  final Future <SharedPreferences> pref = SharedPreferences.getInstance();


  Future<void> loginwithEmail() async {
    try {
      var headers = {"Content-Type": "application/json"};

      var url = Uri.parse('http://192.168.3.6:3000/api/login');

      Map body={
        //'name':nameController.text,
        'email':emailController.text,
        'password':passwordController.text
      };
      print(body);

      http.Response  response = await http.post(url, body: jsonEncode(body), headers: headers);

       print(response.statusCode);

      if ( response.statusCode == 200 ){
        final json =jsonDecode(response.body);
         print(json);
         var pref= "Berear "+ json["token"];
        await GetStorage().write ("token", json["token"].toString() );
        print(jwt);


        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),);
        displayDialog(context, "Success", " Login succesfull");



/*
        if(json['token']!= 0){
          var token = json['Token'];
          print(token);
          final SharedPreferences? pref = await _pref;

          await pref?.setString('token', token);

          //nameController.clear();
          emailController.clear();
          passwordController.clear();
        }else{
          throw jsonDecode(response.body)['massage'] ?? "Unknown Error Occured";
        }*/
      }else{
        throw jsonDecode(response.body)['massage'] ?? "Unknown Error Occured";
      }
    }catch(e){
      Get.back();


      showDialog(
          context: Get.context!,
          builder:(context){
            return SimpleDialog(
              title: Text("Error"),
              contentPadding: EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          }


      );

    }
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
                color: Colors.amber,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    child: Column(
                      children: [

                       Text("Login",textAlign: TextAlign.center,style: TextStyle(fontSize: 25),),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(

                              hintText: "Enter your email",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: TextField(
                            controller: passwordController,
                            decoration: InputDecoration(

                              hintText: "Enter your Password",
                            ),
                          ),
                        ),
                        SizedBox(height: 5,),
                        ElevatedButton(onPressed: (){
                          loginwithEmail();
                        }, child: Text("Login")),
                        SizedBox(height: 10,),
                        Text("or"),

                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegPage()),);
                        }, child: Text("Sign Up"))


                      ],
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
