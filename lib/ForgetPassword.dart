import 'package:flutter/material.dart';

class ForgetPass extends StatefulWidget {
  ForgetPass({Key key}) : super(key: key);

  @override
  _ForgetPassState createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      left: true,
      right: true,
      bottom: true,
      child: Scaffold(
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
                      // validator: (value) =>
                      //     value.isEmpty ? 'E mail cannot be empty' : null,
                      // onSaved: (value) => email = value.trim(),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
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
                            Icons.email,
                            color: Colors.black,
                          )),
                      // validator: (value) =>
                      //     value.isEmpty ? 'E mail cannot be empty' : null,
                      // onSaved: (value) => email = value.trim(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
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
                        "ENTER",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
