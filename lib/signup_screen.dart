import 'package:Liquify/products.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
                Form(
                  key: _formKey,
                  child: Expanded(
                    flex: 80,
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: const Text(
                              'Create an Account',
                              style: TextStyle(
                                fontSize: 38.0,
                                fontFamily: 'Rockwell',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(

                            margin: const EdgeInsets.only(left: 45, right: 45, top:10, bottom: 10),
                            height: 50,
                            child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
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
                              labelText: 'full name...',
                              )
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 45, right: 45, top:10, bottom: 10),
                            height: 50,
                            child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
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
                            child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
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
                                        if (_formKey.currentState!.validate()) {
                                          // If the form is valid, display a snackbar. In the real world,
                                          // you'd often call a server or save the information in a database.
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(content: Text('Processing Data')),
                                          );
                                          FirebaseAuth.instance
                                              .createUserWithEmailAndPassword(
                                              email: emailController.text,
                                              password: passwordController.text)
                                              .then((value) {
                                            print("Successfuly Signed Up!");
                                            Navigator.pop(context);
                                          }).catchError((error) {
                                            print("Failed to Sign Up");
                                            print(error.toString());
                                          });
                                        }
                                      },
                                      child: const Text('Signup',
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

                        ],
                      ),
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
