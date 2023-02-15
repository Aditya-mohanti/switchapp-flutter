import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:switchapp/studentpage.dart';
import 'passwordpage.dart';
import 'package:firebase_core/firebase_core.dart';

class Passwordpage extends StatefulWidget {
  const Passwordpage({Key? key}) : super(key: key);

  @override
  State<Passwordpage> createState() => _PasswordpageState();
}

class _PasswordpageState extends State<Passwordpage> {
  var useremailController=TextEditingController();
  var userpasswordController=TextEditingController();
  var userwebsiteController=TextEditingController();
  late DatabaseReference dbRef;

  @override
  void initState(){
    super.initState();
    dbRef=FirebaseDatabase.instance.ref().child('Students');
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        elevation: 0.0,
        title: Text('Add Password'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Colors.purpleAccent.shade100,
                Colors.pinkAccent,
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.blueAccent.shade100,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Colors.pink.shade100,
              Colors.blueAccent.shade100,
            ]
          )
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: userwebsiteController,
              decoration: InputDecoration(
                hintText: 'Enter website',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                  borderSide: BorderSide(
                    color: Colors.purpleAccent ,
                    width: 2,
                  ) ,
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: BorderSide(
                    color: Colors.black45,
                    width: 2,
                  ),
                ),
                prefixIcon: Icon(Icons.edit),

              ),
            ),
            Container(height: 11,),

            TextField(
              controller: useremailController,
              decoration: InputDecoration(
                hintText: 'Enter email',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: BorderSide(
                    color: Colors.black45,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                  borderSide: BorderSide(
                    color: Colors.deepOrange ,
                    width: 2,
                  ) ,
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: BorderSide(
                    color: Colors.black45,
                    width: 2,
                  ),
                ),
                prefixIcon: Icon(Icons.email),

              ),
            ),
            Container(height: 11),
            TextField(
              controller: userpasswordController,
              obscureText: true,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                hintText: 'Enter Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: BorderSide(
                    color:Colors.deepOrange,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.remove_red_eye),
                  onPressed: (){

                  },
                ),
                prefixIcon: Icon(Icons.password),
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  Map<String,String>students={
                    'Enter Website':userwebsiteController.text,
                    'Enter Email':useremailController.text,
                    'Enter Password':userpasswordController.text,
              };
              dbRef.push().set(students);
            }, child: Text(
                'AddPassword'
            ))
          ],
        ),
      ),
    );
  }
}

