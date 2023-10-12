import 'dart:async';
import 'package:flutter/material.dart';

import 'articles_category_screen.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    _loadWidget();

  }

  _loadWidget() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, (){
      Navigator.of(context).pushReplacement(new MaterialPageRoute(
        builder: (context) => ArticlesCategory(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Image.asset("images/"),
          Text("Welcome To Word Articles")

        ],
      ),
    );
  }
}
