import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'addpassword.dart';

class UpdateRecord extends StatefulWidget {

  const UpdateRecord({Key? key, required this.studentKey}) : super(key: key);

  final String studentKey;

  @override
  State<UpdateRecord> createState() => _UpdateRecordState();
}

class _UpdateRecordState extends State<UpdateRecord> {

  final  userwebsiteController = TextEditingController();
  final  useremailController= TextEditingController();
  final  userpasswordController =TextEditingController();

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Students');
    getStudentData();
  }

  void getStudentData() async {
    DataSnapshot snapshot = await dbRef.child(widget.studentKey).get();

    Map student = snapshot.value as Map;

    userwebsiteController.text = student['Enter Website'];
    useremailController.text = student['Enter Email'];
    userpasswordController.text = student['Enter Password '];

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Updating record'),
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
      body:  Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: <Color>[
                      Colors.pink.shade100,
                      Colors.blueAccent.shade100,
                    ]
                )
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                TextField(
                  controller: userwebsiteController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Website',
                    hintText: 'Enter  Website',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: useremailController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'email',
                    hintText: 'Enter Your Email',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: userpasswordController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'password',
                    hintText: 'Enter Password',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  onPressed: () {

                    Map<String, String> students = {
                      'name': userwebsiteController.text,
                      'age': useremailController.text,
                      'salary': userpasswordController.text
                    };

                    dbRef.child(widget.studentKey).update(students)
                        .then((value) => {
                      Navigator.pop(context)
                    });

                  },
                  child: const Text('Update Data'),
                  color: Colors.blue,
                  textColor: Colors.black,
                  minWidth: 300,
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}