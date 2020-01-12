import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Products extends StatefulWidget {
  @override
  ProductsState createState() => ProductsState();
}

class ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Products",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverPadding(
                padding: const EdgeInsets.all(26.0),
                sliver: SliverGrid.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: <Widget>[
                    cards('Dilmah', '30'),
                    cards('Ceylonta', '30'),
                    cards('La oji', '30'),
                    cards('Dilmah', '30'),
                    cards('abcd', '30'),
                    cards('Tea', '30'),
                    cards('Brocoli', '30'),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

Widget cards(title, price) {
  return Container(
    height: 200,
    width: 200,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 3.0,
        ),
      ],
      color: Colors.white,
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Image(
          //   image,
          //   height: 80,
          // ),
          SizedBox(
            height: 5,
          ),
          Text(title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(top: 4),
              color: Colors.deepOrange,
              child: Text("\$ " + price,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12))),
          Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(top: 4),
              color: Colors.lightGreen,
              child: Text("Rating **** ",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12))),
        ],
      ),
    ),
  );
}
