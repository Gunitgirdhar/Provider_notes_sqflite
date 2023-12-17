import 'package:flutter/material.dart';
import 'package:trying_notes/Data%20Showing.dart';

import 'AppDataBAse.dart';
import 'NoteModel.dart';

class AddingNotes extends StatefulWidget {
  const AddingNotes({Key? key}) : super(key: key);

  @override
  State<AddingNotes> createState() => _AddingNotesState();
}

class _AddingNotesState extends State<AddingNotes> {
  late AppDataBase myDB;
 // List<NoteModel> arrNotes=[];
  /* var titleController=TextEditingController();*/
  //var descController=TextEditingController();
  @override
  void initState() {
    super.initState();
    myDB=AppDataBase.db;
   // getNotes();
  }

 /* void getNotes()async{
    arrNotes= await myDB.fetchNote();
    setState(() {

    });
  }*/
  void Addnotes(String title,String desc)async {
    bool check=  await myDB.Addnote(NoteModel(title: title, desc: desc));
  /*  if(check){
      arrNotes= await myDB.fetchNote();
      setState(() {

      });
    }*/
  }
  var title_controller=TextEditingController();
  var desc_controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap:(){
                        Navigator.pop(context);
                      },

                      child: Icon(Icons.arrow_back)),
                  Icon(Icons.delete)
                ],
              ),
            ),
            TextField(
              controller: title_controller,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Title",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18)
                )
              ),
            ),
            SizedBox(height: 15,),

            TextField(
             controller: desc_controller,
              maxLines: 10,
              decoration: InputDecoration(
                  hintText: "desc",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18)
                  )
              ),
            ),
            ElevatedButton(onPressed: (){
              var titleTransfer=title_controller.text.toString();
              var descTransfer=desc_controller.text.toString();
              Addnotes(titleTransfer, descTransfer);
             // Navigator.push(context, MaterialPageRoute(builder: (context) => DataShowing(),));
            }, child: Text("save"))
          ],
        ),
      ),
    );
  }
}
