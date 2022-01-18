import 'package:demo_flutter_project/addProduct.dart';
import 'package:demo_flutter_project/productPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';


class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  User? user = FirebaseAuth.instance.currentUser;
  var itemList = [];

  _ProductPageState() {
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
  final usFormat = NumberFormat.currency(locale: 'en_US');
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
              if(itemList.isEmpty) Center(
                child:
                  Container(
                    margin: const EdgeInsets.only(),
                    child: const Text(

                      'Please start by adding an item to track', style: TextStyle(
                      fontSize: 28.0,

                      fontFamily: 'Rockwell',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                      textAlign: TextAlign.center,
                    ),
                  ),
              ),
        Container(
          margin: const EdgeInsets.only(top: 10),
            child: ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    print(index.toString());
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SpecificProductListing()));
                  },
                  title: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(11.0))),
                    margin: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 70,
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Container(
                                margin: const EdgeInsets.only(left: 10, top: 10),
                                child: const Text(
                                  'Name:', style: TextStyle(
                                  fontSize: 11.0,
                                  fontFamily: 'Rockwell',
                                  color: Colors.black,
                                ),//CHANGE AS SOON AS TITLE DATA CLASS BECOMES AVAIL
                                ),
                              ),
                              Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Text(
                                '${itemList[index]['itemName']}', style: const TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'Rockwell',
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),//CHANGE AS SOON AS TITLE DATA CLASS BECOMES AVAIL
                            ),
                          ),
                          const SizedBox(
                            height: 100,
                            child: Image(
                              image: NetworkImage('https://images.stockx.com/images/NVIDIA-ASUS-TUF-Gaming-GeForce-RTX-3060-TI-8G-OC-Graphics-Card-TUF-RTX3060TI-O8G-GAMING.jpg?fit=fill&bg=FFFFFF&w=480&h=320&auto=compress&q=90&dpr=1&trim=color&updated_at=1622251579&fm=webp'),

                            ),
                          ),
                          ]
                          ),
                        ),

                        Expanded(
                          flex: 35,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: const Text(
                                  'Purchase Price:', style: TextStyle(
                                  fontSize: 11.0,
                                  fontFamily: 'Rockwell',
                                  color: Colors.black,
                                ),//CHANGE AS SOON AS TITLE DATA CLASS BECOMES AVAIL
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(),
                                child: Text(
                                  '${itemList[index]['itemPrice']}', //CHANGE AS SOON AS PRICE DATA CLASS BECOMES AVAIL
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: 'Rockwell',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          flex: 35,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: const Text(
                                  'Sale Price:', style: TextStyle(
                                  fontSize: 11.0,
                                  fontFamily: 'Rockwell',
                                  color: Colors.black,
                                ),//CHANGE AS SOON AS TITLE DATA CLASS BECOMES AVAIL
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(),
                                child: const Text(
                                  '\$17,000', //CHANGE AS SOON AS PRICE DATA CLASS BECOMES AVAIL
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: 'Rockwell',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    ),
          ],
        ),
      )
    );
  }
}
