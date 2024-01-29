import 'package:flutter/material.dart';
import 'package:practice/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherScreen extends StatefulWidget {
  const TeacherScreen({super.key});

  @override
  State<TeacherScreen> createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
 String email='', age='', type='';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('email')    ?? '';
    age   = sp.getString('age')      ?? '';
    type  = sp.getString('userType') ?? '';
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
        title: const Text('Teacher Screen'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orangeAccent,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Email'),
                Text(email.toString()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Age'),
                Text(age.toString()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('User Type'),
                Text(type.toString()),
              ],
            ),
            const SizedBox(height: 20,),

             InkWell(
              onTap: ()async{
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.clear();
                Navigator.push(context, 
                MaterialPageRoute(builder: (context)=> const LoginScreen())
                );
              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.orangeAccent,
                child: const Center(
                  child: Text('Logout'),
                ),
              ),
            ),

          ],
        ),
      ),
      
    );
  }
}