
import 'package:auth/auth/login.dart';
import 'package:auth/main_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SharedPreferences prefs = SharedPreferences.getInstance() as SharedPreferences;



  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 3), () => Navigator.push(context, MaterialPageRoute(builder: (context)=> WidgetTree())));

    return Scaffold(
     body:Column(
       mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         
         Center(
           child: Container(
             height: 100,
               width: 100,

               child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Circle-icons-tools.svg/1024px-Circle-icons-tools.svg.png")),
         )


       ],
     )
    );
  }
}
