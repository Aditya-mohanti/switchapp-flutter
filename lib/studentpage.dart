import 'package:flutter/material.dart';
import 'package:switchapp/main.dart';
import 'passwordpage.dart';
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _emailController = TextEditingController(text: 'test@admin.com');
  final _passwordController=TextEditingController(text:'12345678' );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Login Page'),
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
            Container(height: 11,),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Enter your email',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: BorderSide(
                    color: Colors.purpleAccent,
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
                suffixIcon: IconButton(
                  icon: Icon(Icons.remove_red_eye),
                  onPressed: (){

                  },
                ),
                prefixIcon: Icon(Icons.email),

              ),
            ),
            Container(height: 11),
            TextField(
              controller: _passwordController,
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
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext)
              {
                return MyHomePage();
              }));


            }, child: Text(
              'Login'
            ))
          ],
        ),
      ),
    );
  }
}
