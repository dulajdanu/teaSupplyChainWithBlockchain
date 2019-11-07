import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  @override
  loginPageState createState() => loginPageState();
}

class loginPageState extends State<loginPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
            left: true,
            bottom: true,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/tea.jpg"),
                          fit: BoxFit.cover)),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      Spacer(
                        flex: 1,
                      ),
                      Container(
                        height: 250,
                        width: 300,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/tea1.png"),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                          padding: EdgeInsets.all(10),
                          child: Center(
                            widthFactor: 2,
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                  fontSize: 50,
                                  color: Colors.white60,
                                  fontWeight: FontWeight.w700),
                            ),
                          )),
                      TextFormField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            labelText: "E Mail",
                            labelStyle:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            labelText: "Password",
                            labelStyle:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 20),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            widthFactor: 2,
                            heightFactor: 1,
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white60,
                                  fontWeight: FontWeight.w700),
                            ),
                          )),
                      Spacer(
                        flex: 4,
                      ),
                    ],
                  ),
                )
              ],
            )));
  }
}
