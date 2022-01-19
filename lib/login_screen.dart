import 'package:Liquify/products.dart';
import 'package:Liquify/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  final red = const Color(0xffD24949);
  final orange = const Color(0xffD26E4A);
  final yellow = const Color(0xffD2C54C);
  final fieldButton = const Color(0xE6FFFFFF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    yellow,
                    orange,
                    red,
                  ],
                ),
              ),
            ),
            Column(
              children:[
                const Spacer(
                  flex: 20,
                ),
                Expanded(
                  flex: 80,
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: const Text(
                            'liquify',
                            style: TextStyle(
                              fontSize: 48.0,
                              fontFamily: 'Rockwell',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 45, right: 45, top:10, bottom: 10),
                          height: 50,
                          child: TextField(
                            controller: emailController,
                              style: const TextStyle(
                                fontSize: 17,
                                fontFamily: 'Rockwell',
                              ),
                            obscureText: false,
                            decoration: InputDecoration(

                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(color: Colors.deepOrangeAccent, width: 0.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
                              ),
                              fillColor: Colors.white.withOpacity(0.7),
                              filled: true,
                            labelText: 'email...',
                            )
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.only(left: 45, right: 45, top:10, bottom: 10),
                          height: 50,
                          child: TextField(
                            controller: passwordController,
                            style: const TextStyle(
                              fontSize: 17,
                              fontFamily: 'Rockwell',
                            ),
                              obscureText: true,
                              decoration: InputDecoration(
                                fillColor: Colors.white.withOpacity(0.7),
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(color: Colors.deepOrangeAccent, width: 0.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
                                ),
                                labelText: 'password...',
                              )
                          ),
                        ),
                          Row(
                            children:[
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(top: 0, left: 130, right: 130, bottom: 0),

                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.all(0.0),
                                      primary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12)
                                      ),

                                    ),
                                    onPressed: () {
                                      FirebaseAuth.instance.signInWithEmailAndPassword(
                                          email: emailController.text, password: passwordController.text)
                                          .then((value) {
                                        print("Login Successfully");
                                        User? user = FirebaseAuth.instance.currentUser;
                                        print(user?.uid);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => ProductPage()),
                                        );
                                      }).catchError((error) {
                                        print("Failed to Login");
                                        print(error.toString());
                                      });
                                    },
                                    child: const Text('login',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'Rockwell',
                                        color: Colors.black,
                                      ),),
                                  ),
                                ),
                              ),
                            ]
                          ),

                        Row(
                            children:[
                              Expanded(
                                child: Container(
                                  height: 40,
                                  margin: const EdgeInsets.only(top: 0, left: 100, right: 100, bottom: 15),

                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(100)
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => const SignupPage()));
                                    },
                                    child: const Text('Create an Account',
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        fontFamily: 'Rockwell',
                                        color: Colors.white,
                                      ),),
                                  ),

                                ),
                              ),

                            ]
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ]
      ),
      ),
    );
  }
}
