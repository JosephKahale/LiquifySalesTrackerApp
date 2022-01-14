import 'package:demo_flutter_project/products.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class addprod extends StatefulWidget {
  const addprod({Key? key}) : super(key: key);

  @override
  _addprodState createState() => _addprodState();
}

class _addprodState extends State<addprod> {

  var itemNameController = TextEditingController();
  var itemPriceController = TextEditingController();
  var itemQuantityController = TextEditingController();

  final red = const Color(0xffD24949);
  final orange = const Color(0xffD26E4A);
  final yellow = const Color(0xffD2C54C);
  final fieldButton = const Color(0xE6FFFFFF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: yellow,
        bottomOpacity: 0.0,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          iconSize: 40,
          tooltip: 'Menu',
          onPressed: () {
          },
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
            Column(
              children: [
                Spacer(
                  flex: 10,
                ),
                    Expanded(
                      flex: 90,
                        child: Center(
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
                                margin: EdgeInsets.only(top: 10,left:30, right: 30, bottom: 10),
                                child: TextField(
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
                                child: TextField(
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
                                child: TextField(
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
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 0, left: 30, right: 30, bottom: 0),

                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.all(0.0),
                                          primary: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12)
                                          ),

                                        ),
                                        onPressed: () {
                                          print(itemPriceController.text);
                                          var timeStamp = new DateTime.now().millisecondsSinceEpoch;
                                          FirebaseDatabase.instance.ref().child("itemCollection/item" + timeStamp.toString()).set(
                                            {
                                              "itemName" : itemNameController.text,
                                              "itemPrice" : itemPriceController.text,
                                              "itemQuantity" : itemQuantityController.text,
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
                                        },
                                        child: const Text('submit',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: 'Rockwell',
                                            color: Colors.black,
                                          ),),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
    )
                    ))

              ],
            )
          ],
        ),
      )
    );
  }
}
