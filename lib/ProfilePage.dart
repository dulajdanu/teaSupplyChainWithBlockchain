import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'updateName.dart';
// import 'updatePassword.dart';
// import 'package:my_mechanic/globals.dart' as globals;
import 'updateName.dart';
import 'updatePassword2.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String userName = "";
  String email = "";
  String name = "Enter your Full Name";

  @override
  void initState() {
    super.initState();
    // SharedPreferences.getInstance().then((prefs) {
    //   email = prefs.getString('email');
    //   userName = prefs.getString('userName');
    //   setState(() {
    //     name = prefs.getString("fullName");
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text("Profile"),
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 350.0,
                width: double.infinity,
                // color: Colors.white,
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      // Color(0xffd399c1),
                      // Color(0xff9b5acf),
                      // Color(0xff611cdf),
                      Colors.green,
                      Colors.lightGreenAccent,
                      Colors.lightGreen,
                    ]),
                  )),

              Positioned(
                top: 125.0,
                left: 15.0,
                right: 15.0,
                child: Material(
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(7.0),
                  child: Container(
                    height: 200.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                top: 75.0,
                left: (MediaQuery.of(context).size.width / 2 - 70.0),
                child: Container(
                  height: 150.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80.0),
                      image: DecorationImage(
                          image: AssetImage('assets/images/user.png'),
                          fit: BoxFit.cover)),
                ),
              ),
              Positioned(
                top: 250.0,
                left: (MediaQuery.of(context).size.width / 2) - 50.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      userName,
                      style: TextStyle(
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.bold,
                          fontSize: 21.0),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 450),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: ListTile(
              onTap: () {
                // print('helo');
                //Navigator.of(context).pushNamed("/editName");
              },
              title: Text(
                "E Mail",
                style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Montserret',
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "dulajdanu@gmail.com",
                style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Montserret',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Profileusrname()));
                // print('helo');
                //Navigator.of(context).pushNamed("/editName");
                // Navigator.pushReplacement(context,
                //     MaterialPageRoute(builder: (context) => Profileusrname()));
                // // Navigator
              },
              title: Text(
                "Name",
                style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Montserret',
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                name,
                style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Montserret',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // Divider(
          //   color: Colors.black,
          // ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text("Contact Number",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Montserret',
                      fontWeight: FontWeight.bold)),
              subtitle: Text(
                "0776396993",
                style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Montserret',
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                print('2nd pressed');
                //Navigator.of(context).pushNamed("/editPw");
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => PasswordUI()));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => PhoneUpdate()));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget menuCard(String title, String imgPath, String type, int rating,
      double views, double likes) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Material(
        borderRadius: BorderRadius.circular(7.0),
        elevation: 4.0,
        child: Container(
          height: 125.0,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0), color: Colors.white),
          child: Row(
            children: <Widget>[
              SizedBox(width: 10.0),
              Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imgPath), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(7.0)),
              ),
              SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 15.0),
                  Text(
                    title,
                    style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 7.0),
                  Text(
                    type,
                    style: TextStyle(
                        fontFamily: 'Comfortaa',
                        color: Colors.grey,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 7.0),
                  Row(
                    children: <Widget>[
                      getStar(rating, 1),
                      getStar(rating, 2),
                      getStar(rating, 3),
                      getStar(rating, 4),
                      getStar(rating, 5)
                    ],
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    children: <Widget>[
                      Icon(Icons.remove_red_eye,
                          color: Colors.grey.withOpacity(0.4)),
                      SizedBox(width: 3.0),
                      Text(views.toString()),
                      SizedBox(width: 10.0),
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      SizedBox(width: 3.0),
                      Text(likes.toString())
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getStar(rating, index) {
    if (rating >= index) {
      return Icon(Icons.star, color: Colors.yellow);
    } else {
      return Icon(Icons.star, color: Colors.grey.withOpacity(0.5));
    }
  }

  // void setName() {
  //   globals.fullName = "";
  //   SharedPreferences.getInstance().then((prefs) {
  //     prefs.setString('fullName', globals.fullName);
  //   });
  // }
}
