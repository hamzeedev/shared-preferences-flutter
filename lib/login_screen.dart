import 'package:flutter/material.dart';
import 'package:practice/student_screen.dart';
import 'package:practice/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Age'),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();

                sp.setString('email', emailController.text.toString());
                sp.setString('age', ageController.text.toString());

                // admin, student, teacher
                sp.setString('userType', 'teacher');

                sp.setBool('isLogin', true);

                if (sp.getString('userType') == 'teacher') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TeacherScreen()));
                } else if (sp.getString('userType') == 'student') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StudentScreen()));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StudentScreen()));
                }
              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.orangeAccent,
                child: const Center(
                  child: Text('Signup'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
