import 'package:Liquify/addProduct.dart';
import 'package:Liquify/productPage.dart';
import 'package:Liquify/products.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';

import 'login_screen.dart';

class SpecificProductListing extends StatefulWidget {
  final int index;

  SpecificProductListing({Key? key, required this.index}) : super(key: key);

  @override
  _SpecificProductListingState createState() => _SpecificProductListingState();
}

class _SpecificProductListingState extends State<SpecificProductListing> {

  User? user = FirebaseAuth.instance.currentUser;
  var itemList = [];
  _SpecificProductListingState() {
    var uid = user?.uid;

    FirebaseDatabase.instance.ref().child("itemCollection/" + uid.toString()).once()
        .then((dataSnapShot){
      final items = Map<String, dynamic>.from(dataSnapShot.snapshot.value as Map<dynamic, dynamic>);
      print("Success Loaded");
      print(dataSnapShot.snapshot.key);
      print(dataSnapShot.snapshot.value);
      var tmpList = [];
      items.forEach((k, v){
        print(v);
        tmpList.add(v);
      });
      itemList = tmpList;
      setState(() {

      });
    }).catchError((error){
      print("Failed Load" + error.toString());
    });
  }

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
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProductPage()));
                },
              ),
              ListTile(
                title: const Text('Add Product'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const addprod()));
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
        title: InkWell(
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
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const addprod()));
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

            if(!itemList.isEmpty) Container(
              margin: EdgeInsets.only(left: 30, top: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox.fromSize(
                          child: const Image(
                              image: NetworkImage('https://images.stockx.com/360/adidas-Yeezy-Boost-350-V2-Light/Images/adidas-Yeezy-Boost-350-V2-Light/Lv2/img01.jpg?auto=compress&w=480&q=90&dpr=2&updated_at=1629383966&h=320&fm=webp'),
                              fit: BoxFit.fill,
                          ),
                          ),
                        ),

                      ),
                    ],
                  ),
                  const Text("Name:",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Rockwell',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children:  [
                      Expanded(
                        child: Text("${itemList[widget.index]['itemName']}",
                          style: const TextStyle(
                            fontSize: 28.0,
                            fontFamily: 'Rockwell',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Expanded(
                        child: Text("Purchase Price:",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'Rockwell',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text("Sold Price:",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'Rockwell',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text("${itemList[widget.index]['itemPrice']}",
                          style: const TextStyle(
                            fontSize: 32.0,
                            fontFamily: 'Rockwell',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text("${itemList[widget.index]['itemSalePrice']}",
                          style: const TextStyle(
                            fontSize: 32.0,
                            fontFamily: 'Rockwell',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Text("Quantity:",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Rockwell',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  Row(
                    children:  [
                      Expanded(
                        child: Text("${itemList[widget.index]['itemQuantity']}",
                          style: const TextStyle(
                            fontSize: 32.0,
                            fontFamily: 'Rockwell',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Text("Description:",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Rockwell',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children:  [
                      Expanded(
                        child: Text("${itemList[widget.index]['itemDescription']}",
                          style: const TextStyle(
                            fontSize: 32.0,
                            fontFamily: 'Rockwell',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ),
        ]
        )
    )
    );
  }
}
