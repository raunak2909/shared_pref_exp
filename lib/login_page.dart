import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: ()async{
            ///successfully logged in

            var prefs = await SharedPreferences.getInstance();

            prefs.setString("uid", "wsvbyw1742");

              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));


          },
          child: Text('Login'),
        ),
      ),
    );
  }
}
