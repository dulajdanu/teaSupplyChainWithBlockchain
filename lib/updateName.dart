import 'package:flutter/material.dart';
// import 'package:my_mechanic/globals.dart' as globals;
// import 'package:my_mechanic/ui/google_map.dart';
// import 'package:my_mechanic/ui/profilePage2.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'package:http/http.dart' as http;

class Profileusrname extends StatefulWidget {
  @override
  _ProfileusrnameState createState() => _ProfileusrnameState();
}

class _ProfileusrnameState extends State<Profileusrname> {
  String fullName = "";
  String userId = "";
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // SharedPreferences.getInstance().then((prefs) {
    //   setState(() {
    //     fullName = prefs.getString('fullName');
    //     userId = prefs.getString("userId");
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PROFILE'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text("Enter your name", style: TextStyle(fontSize: 20.0)),
              subtitle: Text("This will be showing as your contact name"),
            ),
          ),
          Divider(
            height: 10.0,
          ),
          Container(
            // color: Colors.red,
            child: Row(
              children: <Widget>[
                Expanded(
                  // width: 50.0,
                  // height: 50.0,
                  // color: Colors.green,
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                        hintText: fullName,
                        hintStyle: TextStyle(color: Colors.black)),
                    onChanged: (v) {
                      setState(() {
                        fullName = v;
                      });
                    },
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 20.0,
          ),
          FlatButton(
            color: Colors.black,
            onPressed: () {
              // updateProfile();
            },
            child: Text(
              "Save",
              style: TextStyle(color: Colors.white),
            ),
            padding: EdgeInsets.all(10.0),
          ),
        ],
      ),
    );
  }

  Future<void> _neverSatisfied(String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text(message),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Press OK to continue'),
                  //Text('You\’re like me. I’m never satisfied.'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  // SharedPreferences.getInstance().then((prefs) {
                  //   prefs.setString("fullName", fullName);
                  // });
                  // //openSettingsMenu("ACTION_SETTINGS");
                  // Navigator.of(context).pop();
                  // Navigator.of(context).pop();

                  // // Navigator.pushNamed(context, '/myCar');
                  // Navigator.pushReplacement(
                  //   context,
                  //   // MaterialPageRoute(builder: (context) => MyCar(userLogin)),
                  //   MaterialPageRoute(builder: (context) => GoogleMapPage()),
                  // );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // void updateProfile() async {
  //   var url = "http://test.mymech.lk//sendData.php";

  //   await http.post(url, body: {
  //     "key": "profileChange",
  //     "subKey": "name",
  //     "userId": userId,
  //     "fullName": fullName,
  //   }).then((response) {
  //     String result = response.body;
  //     print(result);
  //     if (result == "Success") {
  //       _neverSatisfied("Name changed!");
  //     } else {
  //       _neverSatisfied("Oops! Try again");
  //     }
  //   });
  // }
}
