
import 'dart:convert';

import 'package:auth/auth/login.dart';
import 'package:auth/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      checkAccessToken();
    }
    );

    super.initState();
  }


  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Center(
              child: Container(
                  height: 100,
                  width: 100,

                  child: Image.network(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Circle-icons-tools.svg/1024px-Circle-icons-tools.svg.png")),
            )


          ],
        )
    );
  }

  void checkAccessToken() async {
    var token = await GetStorage().read("token");
    print(token);
    if (token != null) {
      Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()),);
    } else {
      Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()),);
    }
  }
}
