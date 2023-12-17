import 'package:flutter/material.dart';
import 'package:trying_notes/AddingNotes.dart';
import 'package:trying_notes/Data%20Showing.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: ElevatedButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => DataShowing(),));
        },
        child: Text("Tap"),
      ),
    );
  }
}
