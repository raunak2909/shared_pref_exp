import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget{

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  SharedPreferences? prefs;
  String name = '';

  @override
  void initState(){
    super.initState();
    getNameFromPrefs();
  }

  void getNameFromPrefs() async {
    prefs = await SharedPreferences.getInstance();
    name = prefs!.getString('name') ?? "No Name Found";

    setState(() {

    });
  }

  /// ?? and ?:

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Pref'),
      ),
      body: Column(
        children: [
          name!="" ? Text('Stored Name: $name') : CircularProgressIndicator(),
          TextField(
            controller: nameController,
          ),
          ElevatedButton(onPressed: prefs!=null ? () async {

            ///store in prefs
            prefs!.setString("name", nameController.text.toString());

          } : null, child: Text('Save to Pref'))
        ],
      ),
    );
  }
}