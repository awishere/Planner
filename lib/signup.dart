import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planner/home.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Center(child: Text("𝙎𝙞𝙜𝙣 𝙞𝙣",style: TextStyle(fontSize: 28.0),),) ,
  backgroundColor:Colors.deepPurple,
      ),
      
      body: Form(
          key: _formKey,
          
          child: Column(
            children: <Widget>[
              TextFormField(
           
                decoration: InputDecoration(
                    labelText: 'Email'
                ),
                onChanged: (input) => _email = input,
              ),
              TextFormField(
          
          
                decoration: InputDecoration(
                    labelText: 'Password'
                ),
                onChanged: (input) => _password = input,
                obscureText: true,
              ),
              RaisedButton(
                  child: Text('Sign in'),
                color: Colors.red,
                textColor: Colors.white,
                onPressed: () async{

              final user = await _auth.signInWithEmailAndPassword(email: _email, password: _password);
                print(_email);
                  if(user != null){
                    print("d");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeP()));
                  }

                },
              ),
            ],
          )
      ),
    );
  }

 
}