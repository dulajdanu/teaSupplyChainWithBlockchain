import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:web3dart/crypto.dart';
import 'home.dart';

import 'dart:io';
import 'package:convert/convert.dart';

import 'package:path_provider/path_provider.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';
import 'package:path/path.dart' show join, dirname;
import 'package:web_socket_channel/io.dart';
import 'loginPage.dart';

const String rpcUrl = 'http://13.126.29.43:7545';
const String wsUrl = 'ws://13.126.29.43:7545';

const String privateKey =
    '0xbb64dd17ce5e3b45cededd52e66c565628b3b788d0512151d7ea46c0038b8cfe';

final EthereumAddress contractAddr =
    EthereumAddress.fromHex('0x3C4B372344f8f4b744EbD0D75dDeF02d996480b7');
final EthereumAddress receiver =
    EthereumAddress.fromHex('0xE4778F7662c3aB86dD4F3ef88D461cA3943Eae78');

final EthereumAddress contractAddrDis =
    EthereumAddress.fromHex('0xED5046b3c2848Fa99273EB1492a79BA5C5cEf1Ab');

final dir = getApplicationDocumentsDirectory();

final File abiFile = File(join(dirname(Platform.script.path), 'login.json'));

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String eMail, pWord, token;
  final GlobalKey<FormState> _loginFormKeyValue = GlobalKey<FormState>();
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    print(hexToBytes(
        '0x46fa2e4340a3e65302c772cc4f15bc331ed7ae695cd49e601192321f05021377'));
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  getVal() async {
    if (_loginFormKeyValue.currentState.validate()) {
      print("get val called");
      _loginFormKeyValue.currentState.save();
      print(eMail);
      print(pWord);
      print(token);
      print(token.runtimeType);

      try {
        final client = Web3Client(rpcUrl, Client(), socketConnector: () {
          return IOWebSocketChannel.connect(wsUrl).cast<String>();
        });
        final credentials = await client.credentialsFromPrivateKey(privateKey);
        final ownAddress = await credentials.extractAddress();
        final abiCode =
            '[{"inputs":[{"internalType":"address","name":"ad","type":"address"},{"internalType":"address","name":"ma","type":"address"},{"internalType":"address","name":"dis","type":"address"},{"internalType":"address","name":"lo","type":"address"},{"internalType":"address","name":"su","type":"address"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"},{"constant":true,"inputs":[],"name":"adminc","outputs":[{"internalType":"contract AdminContract","name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"distributorc","outputs":[{"internalType":"contract DistributorContract","name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"loaderc","outputs":[{"internalType":"contract LoaderContract","name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"managerc","outputs":[{"internalType":"contract ManagerContract","name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"supervisorc","outputs":[{"internalType":"contract SupervisorContract","name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"string","name":"_email","type":"string"},{"internalType":"string","name":"_password","type":"string"},{"internalType":"uint256","name":"_appId","type":"uint256"}],"name":"login","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"string","name":"_email","type":"string"},{"internalType":"bytes32","name":"token","type":"bytes32"},{"internalType":"uint256","name":"_appId","type":"uint256"}],"name":"registation","outputs":[{"internalType":"bool","name":"","type":"bool"},{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"string","name":"_email","type":"string"},{"internalType":"uint256","name":"_appId","type":"uint256"}],"name":"frogetPassword","outputs":[{"internalType":"bool","name":"","type":"bool"},{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"string","name":"_email","type":"string"},{"internalType":"bytes32","name":"token","type":"bytes32"},{"internalType":"uint256","name":"_appId","type":"uint256"}],"name":"resetPassword","outputs":[{"internalType":"bool","name":"","type":"bool"},{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"}]';

        final distributorAbi =
            '[{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"emailcode","type":"bytes32"},{"indexed":false,"internalType":"uint256","name":"index","type":"uint256"}],"name":"LogDeleteDistributor","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"emailCode","type":"bytes32"},{"indexed":false,"internalType":"uint256","name":"index","type":"uint256"},{"indexed":false,"internalType":"string","name":"email","type":"string"},{"indexed":false,"internalType":"bytes32","name":"passwordCode","type":"bytes32"},{"indexed":false,"internalType":"string","name":"name","type":"string"},{"indexed":false,"internalType":"uint256","name":"contactNumber","type":"uint256"},{"indexed":false,"internalType":"string","name":"userAddress","type":"string"},{"indexed":false,"internalType":"uint256","name":"userAccess","type":"uint256"}],"name":"LogNewDistributor","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"emailCode","type":"bytes32"},{"indexed":false,"internalType":"uint256","name":"index","type":"uint256"},{"indexed":false,"internalType":"string","name":"email","type":"string"},{"indexed":false,"internalType":"bytes32","name":"passwordCode","type":"bytes32"},{"indexed":false,"internalType":"string","name":"name","type":"string"},{"indexed":false,"internalType":"uint256","name":"contactNumber","type":"uint256"},{"indexed":false,"internalType":"string","name":"userAddress","type":"string"},{"indexed":false,"internalType":"uint256","name":"userAccess","type":"uint256"}],"name":"LogUpdateDistributor","type":"event"},{"constant":true,"inputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"name":"distributorArray","outputs":[{"internalType":"string","name":"email","type":"string"},{"internalType":"bytes32","name":"emailCode","type":"bytes32"},{"internalType":"bytes32","name":"passwordCode","type":"bytes32"},{"internalType":"string","name":"name","type":"string"},{"internalType":"uint256","name":"contactNumber","type":"uint256"},{"internalType":"string","name":"userAddress","type":"string"},{"internalType":"uint256","name":"userAccess","type":"uint256"},{"internalType":"uint256","name":"index","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"bytes32","name":"_emailCode","type":"bytes32"}],"name":"isDistributor","outputs":[{"internalType":"bool","name":"isIndeed","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"_email","type":"string"}],"name":"createDistributorToken","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"internalType":"string","name":"_email","type":"string"}],"name":"getDistributorToken","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"string","name":"_email","type":"string"},{"internalType":"bytes32","name":"_token","type":"bytes32"}],"name":"checkDistributorToken","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"_email","type":"string"},{"internalType":"string","name":"_password","type":"string"}],"name":"setPassword","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"_email","type":"string"},{"internalType":"string","name":"_name","type":"string"},{"internalType":"string","name":"_address","type":"string"},{"internalType":"uint256","name":"_telephone","type":"uint256"}],"name":"insertDistributor","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"bytes32","name":"email","type":"bytes32"}],"name":"deleteDistributor","outputs":[{"internalType":"string","name":"","type":"string"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"bytes32","name":"email","type":"bytes32"}],"name":"blockDistributor","outputs":[{"internalType":"string","name":"","type":"string"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"_email","type":"string"},{"internalType":"uint256","name":"usreAccess","type":"uint256"}],"name":"editUserAccess","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"internalType":"string","name":"_email","type":"string"}],"name":"getDistributor","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"},{"internalType":"string","name":"email","type":"string"},{"internalType":"string","name":"name","type":"string"},{"internalType":"uint256","name":"contactNumber","type":"uint256"},{"internalType":"string","name":"userAddress","type":"string"},{"internalType":"uint256","name":"userAccess","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"uint256","name":"i","type":"uint256"}],"name":"getDistributori","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"},{"internalType":"string","name":"","type":"string"},{"internalType":"string","name":"","type":"string"},{"internalType":"uint256","name":"","type":"uint256"},{"internalType":"string","name":"","type":"string"},{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"getDistributorCount","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"_email","type":"string"},{"internalType":"string","name":"_name","type":"string"}],"name":"updateDistributorName","outputs":[{"internalType":"bool","name":"success","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"_email","type":"string"},{"internalType":"string","name":"_userAddress","type":"string"}],"name":"updateDistributorAddress","outputs":[{"internalType":"bool","name":"success","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"_email","type":"string"},{"internalType":"uint256","name":"_contactNumber","type":"uint256"}],"name":"updateDistributorContactNumber","outputs":[{"internalType":"bool","name":"success","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"_email","type":"string"},{"internalType":"uint256[]","name":"index","type":"uint256[]"},{"internalType":"string","name":"_name","type":"string"},{"internalType":"string","name":"_userAddress","type":"string"},{"internalType":"uint256","name":"_contactNumber","type":"uint256"}],"name":"updateDistributor","outputs":[{"internalType":"bool","name":"success","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"_email","type":"string"}],"name":"updateDistributoriEmail","outputs":[{"internalType":"bool","name":"success","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"internalType":"bytes32","name":"email","type":"bytes32"}],"name":"checkDistributorUserAccess","outputs":[{"internalType":"uint256","name":"userAccess","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"bytes32","name":"email","type":"bytes32"}],"name":"checkDistributorPasswordCode","outputs":[{"internalType":"bytes32","name":"passwordCode","type":"bytes32"}],"payable":false,"stateMutability":"view","type":"function"}]';
        final contract = new DeployedContract(
            ContractAbi.fromJson(abiCode, 'Login'), contractAddr);
        final signUpFunction = contract.function('registation');

        final contract2 = new DeployedContract(
            ContractAbi.fromJson(distributorAbi, 'DistributorContract'),
            contractAddrDis);

        final setPassword = contract2.function('setPassword');

        // final UintType intV = 1 as UintType;
        // print('69d3d9cffa31e3643efd508811dd45dd884ef43f2c725d5eb38c097641c89175'
        //     .codeUnits);

        final bal = await client.call(
            contract: contract,
            function: signUpFunction,
            params: [eMail, hexToBytes(token), BigInt.from(3)]);

        print("inside function 1");

        // BigInt bala = bal.first;
        print(bal[0]);
        print(bal[1]);
        if (bal[0] == true && bal[1] == BigInt.from(31)) {
          print("inside second fucntion");
          await client.sendTransaction(
            credentials,
            Transaction.callContract(
              contract: contract2,
              function: setPassword,
              parameters: [eMail, pWord],
            ),
          );
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => loginPage()));
        }

        // print('We have ${balance.first} MetaCoins');
      } catch (e) {
        print(e);
        print("inside catch block");
        final snackBar = SnackBar(
          content: Text(
            "Please Check Whethere Your E mail Or Token is Correct",
            style: TextStyle(color: Colors.red),
          ),
        );
        _scaffoldKey.currentState.showSnackBar(snackBar);
      }
    } else {
      final snackBar = SnackBar(
        content: Text(
          "Please Check the Input Dear",
          style: TextStyle(color: Colors.red),
        ),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        top: true,
        left: true,
        right: true,
        bottom: true,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/back.jpg"),
                      fit: BoxFit.cover)),
            ),
            Form(
                key: _loginFormKeyValue,
                child: Center(
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
                              "SIGN UP",
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
                          validator: validateEmail,
                          onSaved: (value) => eMail = value.trim(),
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
                          onSaved: (value) => pWord = value.trim(),
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
                          validator: (value) =>
                              value.isEmpty ? 'E mail cannot be empty' : null,
                          onSaved: (value) => token = value.trim(),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (BuildContext context) =>
                              //             HomePage()));
                              getVal();
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
                                "SIGN UP",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                              )),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 110,
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
