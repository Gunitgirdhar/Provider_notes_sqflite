import 'package:flutter/material.dart';
//error line 46 and cant delete item
import 'package:trying_notes/AddingNotes.dart';
import 'package:trying_notes/DetailDescription.dart';

import 'AppDataBAse.dart';
import 'NoteModel.dart';

class DataShowing extends StatefulWidget {
  @override
  State<DataShowing> createState() => _DataShowingState();
}

class _DataShowingState extends State<DataShowing> {
  late AppDataBase myDB;
  List<NoteModel> arrNotes = [];

  /* var titleController=TextEditingController();*/
  //var descController=TextEditingController();
  @override
  void initState() {
    super.initState();
    myDB = AppDataBase.db;
    getNotes();
  }

  void getNotes() async {
    arrNotes = await myDB.fetchNote();
    setState(() {});
  }


  /* void Addnotes(String title,String desc)async {
    bool check=  await myDB.Addnote(NoteModel(title: title, desc: desc));
    if(check){
      arrNotes= await myDB.fetchNote();
      setState(() {

      });
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: arrNotes.length > 0 ? gridViewBuilder() : Scaffold(
              body: Center(
                child: Container(
                  child: Text("There is no notes added"),
                ),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddingNotes(),
          ),
          );},
          child: Icon(Icons.add),
        ),
            ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddingNotes(),
                ));
          },
          child: Icon(Icons.add)),
    );
  }

  Widget gridViewBuilder() {
    return GridView.builder(
      itemCount: arrNotes.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetalPage(
                      titleDetail: arrNotes[index].title,
                      descDetail: arrNotes[index].desc),
                ));
          },
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Colors.black)),
              height: 100,
              width: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      arrNotes[index].title,
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  InkWell(
                      onTap: ()async{
                        await myDB.deleteNote(arrNotes[index].note_id!);
                        getNotes();
                      },
                      child: Icon(Icons.delete)),
                ],
              )),
        );
      },
    );
  }
}
