import 'package:flutter/material.dart';

import 'AppDataBAse.dart';
import 'NoteModel.dart';

class DetalPage extends StatefulWidget {
 String titleDetail;
 String descDetail;
  DetalPage({required this.titleDetail, required this.descDetail});

  @override
  State<DetalPage> createState() => _DetalPageState();
}

class _DetalPageState extends State<DetalPage> {
  late AppDataBase myDB;
  List<NoteModel> arrNotes = [];
  @override
  void getNotes() async {
    arrNotes = await myDB.fetchNote();
    setState(() {});
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.edit)
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 90),
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.grey,
               border: Border.all(color: Colors.black),
                  //borderRadius: BorderRadius.circular(22),
                  shape:BoxShape.circle
                ),
                child: Center(
                  child: Text(widget.titleDetail),
                ),
              ),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.black),
                    //borderRadius: BorderRadius.circular(22),
                    shape:BoxShape.circle
                ),
                child: Center(
                  child: Text(widget.descDetail),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
