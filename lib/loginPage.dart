import 'package:flutter/material.dart';
import 'home.dart';

class loginPage extends StatefulWidget {
  @override
  loginPageState createState() => loginPageState();
}

class loginPageState extends State<loginPage> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";

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
                          image: AssetImage("assets/images/back.jpg"),
                          fit: BoxFit.cover)),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      Spacer(
                        flex: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/logo1.png"),
                                  fit: BoxFit.fitHeight)),
                        ),
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
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: TextFormField(
                          maxLines: 1,
                          keyboardType: TextInputType.emailAddress,
                          autofocus: false,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              hintText: "E Mail",
                              icon: Icon(
                                Icons.email,
                                color: Colors.black,
                              )),
                          validator: (value) =>
                              value.isEmpty ? 'E mail cannot be empty' : null,
                          onSaved: (value) => email = value.trim(),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: TextFormField(
                          maxLines: 1,
                          obscureText: true,
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            icon: Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                          ),
                          validator: (value) =>
                              value.isEmpty ? "Password cannot be empty" : null,
                          onSaved: (value) => password = value.trim(),
                        ),
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
                            child: RaisedButton(
                              color: Colors.black,
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            HomePage()));
                              },
                              child: Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white60,
                                    fontWeight: FontWeight.w700),
                              ),
                            )),
                      ),
                      Spacer(
                        flex: 170,
                      ),
                    ],
                  ),
                )
              ],
            )));
  }
}
