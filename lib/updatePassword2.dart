import 'package:flutter/material.dart';

class PasswordUpdate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CHANGE PASSWORD'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text("Update your password",
                  style: TextStyle(fontSize: 20.0)),
              subtitle:
                  Text("Verify your password to update your security details."),
            ),
          ),
          Divider(
            height: 10.0,
          ),
          Container(
            // color: Colors.red,
            child: Row(
              children: <Widget>[
                // TextFormField(
                //   initialValue: "First Name",
                // ),
                // TextFormField(
                //   initialValue: "Last Name",
                // ),
                Expanded(
                  // width: 50.0,
                  // height: 50.0,
                  // color: Colors.green,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    initialValue: "password",
                  ),
                ),
                Expanded(
                  // width: 50.0,
                  // height: 50.0,
                  // color: Colors.green,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    initialValue: "confirm pw",
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 20.0,
          ),
          FlatButton(
            color: Colors.black,
            onPressed: () {},
            child: Text(
              "Next",
              style: TextStyle(color: Colors.white),
            ),
            padding: EdgeInsets.all(10.0),
          ),
        ],
      ),
    );
  }
}
