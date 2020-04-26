import 'package:flutter/material.dart';
import 'package:planner/signup.dart';
import 'dart:async';
import 'home.dart';

void main(){
  runApp(MaterialApp(
   debugShowCheckedModeBanner: false,
    home: MyApp(),
     
    ));
}
class MyApp extends StatefulWidget{
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  @override
 void initState(){
   super.initState();
   Future.delayed(
     Duration(seconds: 3),
     (){
       Navigator.push(
         context, 
         MaterialPageRoute(
           builder: (context) => LoginPage(),
         )
         
         );
     }
   );
 }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: FlutterLogo(
        size: 400,
        ),
        ),
        backgroundColor:Colors.deepPurple,
  );
  }
}





