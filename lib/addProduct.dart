import 'package:demo_flutter_project/login_screen.dart';
import 'package:demo_flutter_project/products.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'specificProduct.dart';


class addprod extends StatefulWidget {

  const addprod({Key? key}) : super(key: key);


  @override
  _addprodState createState() => _addprodState();
}

class _addprodState extends State<addprod> {
  User? user = FirebaseAuth.instance.currentUser;
  var itemNameController = TextEditingController();
  var itemPriceController = TextEditingController();
  var itemSalePriceController = TextEditingController();
  var itemQuantityController = TextEditingController();
  var itemDescController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final red = const Color(0xffD24949);
  final orange = const Color(0xffD26E4A);
  final yellow = const Color(0xffD2C54C);
  final fieldButton = const Color(0xE6FFFFFF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              child: null,
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const ProductPage()));
                setState(() {

                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Add Product'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                Navigator.of(context).popUntil((route) => route.isFirst);


              Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  const LoginPage()));
                setState(() {

                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: yellow,
        bottomOpacity: 0.0,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            iconSize: 40,
            tooltip: 'Menu',
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title:  InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductPage()));
          },
          child: const Text("liquify",
            style: TextStyle(
              fontSize: 48.0,
              fontFamily: 'Rockwell',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle),
            iconSize: 40,
            tooltip: 'Menu',
            onPressed: () {
            },
          )
        ],
      ),
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
            Form(
            key: _formKey,
            child: ListView(
                children: [

                      Center(
                        child: Column(
                          children: [
                            const Text(
                              'Track an Item',
                              style: TextStyle(
                                fontSize: 28.0,
                                fontFamily: 'Rockwell',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5,left:30, right: 30, bottom: 10),
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

                                  controller: itemNameController,
                                  obscureText: false,
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
                                    labelText: 'item name...',
                                  )
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10,left:30, right: 30, bottom: 10),
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
                                  controller: itemPriceController,
                                  keyboardType: TextInputType.number,
                                  obscureText: false,
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
                                    labelText: '\$ item price...',
                                  )
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10,left:30, right: 30, bottom: 10),
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
                                  controller: itemSalePriceController,
                                  keyboardType: TextInputType.number,
                                  obscureText: false,
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
                                    labelText: '\$ item sale price...',
                                  )
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10,left:30, right: 30, bottom: 10),
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
                                  controller: itemQuantityController,
                                  keyboardType: TextInputType.number,
                                  obscureText: false,
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
                                    labelText: 'quantity...',
                                  )
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10,left:30, right: 30, bottom: 10),
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
                                  controller: itemDescController,
                                  keyboardType: TextInputType.number,
                                  obscureText: false,
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
                                    labelText: 'description...',
                                  )
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
                              width: 150,
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
                                  print(itemPriceController.text);
                                  var timeStamp = new DateTime.now().millisecondsSinceEpoch;
                                  var uid = user?.uid;
                                  print(user?.uid);
                                  int sale = int.parse(itemSalePriceController.text);
                                  int reg = int.parse(itemPriceController.text);
                                  int pro = sale-reg;
                                  FirebaseDatabase.instance.ref().child("itemCollection/" + uid.toString() + "/" + timeStamp.toString()).set(
                                      {
                                        "itemName" : itemNameController.text,
                                        "itemPrice" : itemPriceController.text,
                                        "itemSalePrice" : itemSalePriceController.text,
                                        "itemProfit" : pro,
                                        "itemQuantity" : itemQuantityController.text,
                                        "itemDescription" : itemDescController.text,
                                      }
                                  ).then((value) {
                                    print("Success");
                                  }).catchError((error){
                                    print("Error" + error.toString());
                                  });
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ProductPage()),
                                  );
                                  }
                                },
                                child: const Text('submit',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: 'Rockwell',
                                    color: Colors.black,
                                  ),),
                              ),
                            ),
                          ],
    )
                      )

                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
