import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_pref_exp/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SharedPreferences? prefs;
  @override
  void initState() {
    super.initState();

    navigateToNextPage();

  }

  void navigateToNextPage() async{

    prefs = await SharedPreferences.getInstance();

    String? check = prefs!.getString("uid");

    Widget nextPage = LoginPage();

    if(check!=null && check!=""){
      nextPage = HomePage();
    }

    Timer(Duration(seconds: 4), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => nextPage));
    });


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlutterLogo(size: 40,),
          Text('Classico', style: TextStyle(fontSize: 34),)
        ],
      ),
    );
  }
}
