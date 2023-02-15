

import 'package:auth/auth/login.dart';
import 'package:auth/view/home.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {

  final Is_login = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(

      builder: (context, snapshot) {
        if (Is_login==true) {
          return HomePage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}