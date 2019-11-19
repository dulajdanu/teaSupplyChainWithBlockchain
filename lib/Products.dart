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
        title: Text("Productas"),
      ),
      body: Container(
          decoration: BoxDecoration(color: Colors.blue[50]),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text("Item 1"),
                  leading: Icon(Icons.send),
                  trailing: Icon(Icons.grade),
                ),
                ListTile(
                  title: Text("Item 2"),
                  leading: Icon(Icons.send),
                  trailing: Icon(Icons.grade),
                ),
                ListTile(
                  title: Text("Item 3"),
                  leading: Icon(Icons.send),
                  trailing: Icon(Icons.grade),
                ),
                ListTile(
                  title: Text("Item 4"),
                  leading: Icon(Icons.send),
                  trailing: Icon(Icons.grade),
                ),
                ListTile(
                  title: Text("Item 5"),
                  leading: Icon(Icons.send),
                  trailing: Icon(Icons.grade),
                ),
                ListTile(
                  title: Text("Item 6"),
                  leading: Icon(Icons.send),
                  trailing: Icon(Icons.grade),
                ),
                ListTile(
                  title: Text("Item 7"),
                  leading: Icon(Icons.send),
                  trailing: Icon(Icons.grade),
                ),
                ListTile(
                  title: Text("Item 8"),
                  leading: Icon(Icons.send),
                  trailing: Icon(Icons.grade),
                ),
                ListTile(
                  title: Text("Item 9"),
                  leading: Icon(Icons.send),
                  trailing: Icon(Icons.grade),
                ),
                ListTile(
                  title: Text("Item 10"),
                  leading: Icon(Icons.send),
                  trailing: Icon(Icons.grade),
                ),
                ListTile(
                  title: Text("Item 11"),
                  leading: Icon(Icons.send),
                  trailing: Icon(Icons.grade),
                ),
                ListTile(
                  title: Text("Item 12"),
                  leading: Icon(Icons.send),
                  trailing: Icon(Icons.grade),
                ),
                ListTile(
                  title: Text("Item 13"),
                  leading: Icon(Icons.send),
                  trailing: Icon(Icons.grade),
                ),
              ],
            ),
          )),
    );
  }
}
