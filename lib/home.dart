import 'package:flutter/material.dart';
import 'package:teatruth/sales_series.dart';
import 'loginPage.dart';
import 'QRScannerWidget.dart';
import 'ProfilePage.dart';
import 'SellingHistory.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'Products.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text("Welcome \nDulaj"),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Profile()));
              },
            ),
            ListTile(
              title: Text('Selling History'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SellingRate()));
              },
              // Update the state of the app.
              // ...
            ),
            ListTile(
              title: Text('Products '),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Products()));
              },
              // Update the state of the app.
              // ...
            ),
            ListTile(
              title: Text('LogOut'),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => loginPage()));
              },
              // Update the state of the app.
              // ...
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text('Boxes Scanned Today \n\n 10'),
                        width: 100,
                        height: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        width: 100,
                        height: 110,
                        child: Text("Complains\n         0"),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.redAccent,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Container(
                          child: RaisedButton(
                        color: Colors.lightGreen,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      QRWidget()));
                        },
                        child: Text("Scan QR Code"),
                      ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(20),
                          color: Colors.amberAccent),
                      constraints: BoxConstraints(minWidth: double.infinity),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Recent Transactions",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )),
                ),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                title: Text("Transaction 1"),
                                subtitle:
                                    Text("Information About transaction 1"),
                              ),
                              ListTile(
                                title: Text("Transaction 2"),
                                subtitle:
                                    Text("Information About transaction 2"),
                              ),
                              ListTile(
                                title: Text("Transaction 3"),
                                subtitle:
                                    Text("Information About transaction 3"),
                              ),
                              ListTile(
                                title: Text("Transaction 4"),
                                subtitle:
                                    Text("Information About transaction 4"),
                              ),
                              ListTile(
                                title: Text("Transaction 5"),
                                subtitle:
                                    Text("Information About transaction 5"),
                              ),
                              ListTile(
                                title: Text("Transaction 6"),
                                subtitle:
                                    Text("Information About transaction 6"),
                              ),
                              ListTile(
                                title: Text("Transaction 7"),
                                subtitle:
                                    Text("Information About transaction 7"),
                              ),
                              ListTile(
                                title: Text("Transaction 8"),
                                subtitle:
                                    Text("Information About transaction 8"),
                              ),
                            ],
                          )),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
