import 'package:demo_flutter_project/addProduct.dart';
import 'package:demo_flutter_project/products.dart';
import 'package:flutter/material.dart';

class SpecificProductListing extends StatefulWidget {
  const SpecificProductListing({Key? key}) : super(key: key);

  @override
  _SpecificProductListingState createState() => _SpecificProductListingState();
}

class _SpecificProductListingState extends State<SpecificProductListing> {

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

            Container(
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
                    children: const [
                      Expanded(
                        child: Text("Yeezy Boost 350 V2 Light",
                          style: TextStyle(
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
                    children: const [
                      Expanded(
                        child: Text("\$599.99",
                          style: TextStyle(
                            fontSize: 32.0,
                            fontFamily: 'Rockwell',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text("\$599.99",
                          style: TextStyle(
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
                    children: const [
                      Expanded(
                        child: Text("2",
                          style: TextStyle(
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
