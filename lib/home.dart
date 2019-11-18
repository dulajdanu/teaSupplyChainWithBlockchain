import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'QRScannerWidget.dart';
import 'ProfilePage.dart';

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
                      constraints: BoxConstraints(
                          minWidth: double.infinity, minHeight: 350),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                            child: Text(
                              "Recent Transactions",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          ListTile(
                            title: Text("Transaction 1"),
                            subtitle: Text("Information About transaction 1"),
                          ),
                          ListTile(
                            title: Text("Transaction 1"),
                            subtitle: Text("Information About transaction 1"),
                          ),
                          ListTile(
                            title: Text("Transaction 1"),
                            subtitle: Text("Information About transaction 1"),
                          ),
                          ListTile(
                            title: Text("Transaction 1"),
                            subtitle: Text("Information About transaction 1"),
                          ),
                          ListTile(
                            title: Text("Transaction 1"),
                            subtitle: Text("Information About transaction 1"),
                          )
                        ],
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
