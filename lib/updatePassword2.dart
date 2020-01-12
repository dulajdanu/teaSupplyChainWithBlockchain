import 'package:flutter/material.dart';

class PhoneUpdate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('CHANGE PHONE NUMBER'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text("Update your phone number",
                  style: TextStyle(fontSize: 20.0)),
            ),
          ),
          Divider(
            height: 10.0,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              initialValue: "Your Number",
              maxLines: 1,
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: "Phone Number",
                  icon: Icon(
                    Icons.phone,
                    color: Colors.black,
                  )),
              // validator: (value) =>
              //     value.isEmpty ? 'E mail cannot be empty' : null,
              // onSaved: (value) => email = value.trim(),
            ),
          ),
          Divider(
            height: 20.0,
          ),
          FlatButton(
            color: Colors.black,
            onPressed: () {},
            child: Text(
              "UPDATE",
              style: TextStyle(color: Colors.white),
            ),
            padding: EdgeInsets.all(10.0),
          ),
        ],
      ),
    );
  }
}
