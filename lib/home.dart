import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("data"),
      ),
    );
  }
}


class HomeP extends StatefulWidget {
  @override
  _HomePState createState() => _HomePState();
}

class _HomePState extends State<HomeP> {
    List<String> item = List();
    String input ="";
createPlan(){
  DocumentReference documentReference= Firestore.instance.collection("MyPlan").document(input);
 Map<String, String> item ={
   "plantitle": input
 };
 documentReference.setData(item).whenComplete((){
   print("$input created");
 });
}
deletePlan(hello){
  DocumentReference documentReference= Firestore.instance.collection("MyPlan").document(hello);
  documentReference.delete().whenComplete((){
    print("delete");
  });
}


@override
Widget build(BuildContext context){
  return Scaffold(

appBar: AppBar(
  title: Center(child: Text("𝒫𝓁𝒶𝓃𝓃𝑒𝓇",style: TextStyle(fontSize: 28.0),),) ,
  backgroundColor:Colors.deepPurple,
), 
floatingActionButton: FloatingActionButton(
  backgroundColor:Colors.red,
  onPressed: () {
    showDialog(
      context:context, 
      builder: (BuildContext context){
        return AlertDialog(
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
title: Text("Add To Planner"),
content: TextField(onChanged: (String value){
  input=value;
}
,),
actions: <Widget>[
  FlatButton(
    onPressed: (){
  
      createPlan();
      Navigator.of(context).pop();
    },
    child: Text("Add"),
  )
],
        );
 });
  },
  child: Icon(
    Icons.add,
    color: Colors.white,
  ),
),
body: StreamBuilder(stream: Firestore.instance.collection("MyPlan").snapshots(),builder: (context, snapshots){
  
return ListView.builder(
  shrinkWrap: true,
  
  itemCount: snapshots.data.documents.length,
  itemBuilder:(context,index){    
    DocumentSnapshot documentSnapshot = snapshots.data.documents[index];
    return Dismissible(
      onDismissed: (direction){
        deletePlan(documentSnapshot["plantitle"]);
      },
      key: Key(index.toString()),
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(8)),
          child: ListTile(
            title: Text(documentSnapshot["plantitle"]),
            trailing: IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: (){
             deletePlan(documentSnapshot["plantitle"]);
              },
            ),
          )
        ));
  });
},)
 
    );
  }   
   
  
}
