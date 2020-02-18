import 'package:flutter/material.dart';

class ForgetPass extends StatefulWidget {
  ForgetPass({Key key}) : super(key: key);

  @override
  _ForgetPassState createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  final GlobalKey<FormState> _loginFormKeyValue = GlobalKey<FormState>();
  final GlobalKey<FormState> _codeForm = GlobalKey<FormState>();

  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  var email, token;

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  void sendPassWordReset() {
    if (_loginFormKeyValue.currentState.validate()) {
    } else {
      final snackBar = SnackBar(
        content: Text(
          "Enter a Valid E Mail",
          style: TextStyle(color: Colors.red),
        ),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }

  void sendCode() {
    if (_codeForm.currentState.validate()) {
    } else {
      final snackBar = SnackBar(
        content: Text(
          "Enter a Valid Code ",
          style: TextStyle(color: Colors.red),
        ),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      left: true,
      right: true,
      bottom: true,
      child: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        body: Stack(
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
                  SizedBox(
                    height: 10,
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
                          "RESET PASSWORD ",
                          style: TextStyle(
                              fontSize: 50,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                      )),
                  Form(
                    key: _loginFormKeyValue,
                    child: Column(
                      children: <Widget>[
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
                            validator: validateEmail,
                            onSaved: (value) => email = value.trim(),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            sendPassWordReset();
                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (BuildContext context) =>
                            //             HomePage()));
                          },
                          child: Container(
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.green, Colors.greenAccent]),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              "SEND",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Form(
                      key: _codeForm,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: TextFormField(
                              maxLines: 1,
                              keyboardType: TextInputType.emailAddress,
                              autofocus: false,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  hintText: "Enter the Code Received",
                                  icon: Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                  )),
                              validator: (value) =>
                                  value.isEmpty ? 'Code cannot be empty' : null,
                              onSaved: (value) => token = value.trim(),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              sendCode();
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (BuildContext context) =>
                              //             HomePage()));
                            },
                            child: Container(
                              height: 40,
                              width: 120,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Colors.green,
                                    Colors.greenAccent
                                  ]),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                "ENTER",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                              )),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
