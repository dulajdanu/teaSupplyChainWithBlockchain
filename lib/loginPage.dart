import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/crypto.dart';
import 'home.dart';
import 'SignUp.dart';
import 'ForgetPassword.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';
import 'package:path/path.dart' show join, dirname;
import 'package:web_socket_channel/io.dart';

const String rpcUrl = 'http://13.126.29.43:7545';
const String wsUrl = 'ws://13.126.29.43:7545';

const String privateKey =
    '0x7f2ef1bafe1fce3d063bef284bc98da98c4d29b2d8d224408f200ddb73e49487';

final EthereumAddress contractAddr =
    EthereumAddress.fromHex('0x528B3a6A11A49da4b398795C0352d66F77756A01');

final EthereumAddress contractAddrDis =
    EthereumAddress.fromHex('0x936C105E309D150BBd1FF09FdF0B0Cfd377638a8');
final EthereumAddress receiver =
    EthereumAddress.fromHex('0x05346F5978995345Ab999311eE6A9eD614Bc4F95');

final dir = getApplicationDocumentsDirectory();

final File abiFile = File(join(dirname(Platform.script.path), 'login.json'));

class loginPage extends StatefulWidget {
  @override
  loginPageState createState() => loginPageState();
}

class loginPageState extends State<loginPage> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";

  // Credentials fromHex = EthPrivateKey.fromHex(
  //     "0x7f2ef1bafe1fce3d063bef284bc98da98c4d29b2d8d224408f200ddb73e49487");

  // var apiUrl = "http://13.126.29.43:7545";
  // var httpClient = new Client();

  // getVal() async {
  //   var ethClient = new Web3Client(apiUrl, httpClient);
  //   var credentials = ethClient.credentialsFromPrivateKey(
  //       "0x7f2ef1bafe1fce3d063bef284bc98da98c4d29b2d8d224408f200ddb73e49487");
  //   print(credentials.toString());
  //   EtherAmount balance = await ethClient.getBalance(
  //       EthereumAddress.fromHex('0x05346F5978995345Ab999311eE6A9eD614Bc4F95'));
  //   print(balance);

  //   print('hi');
  // }

  getVal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    print("get val called");
    _formKey.currentState.save();
    print(email);
    print(password);
    try {
      final client = Web3Client(rpcUrl, Client(), socketConnector: () {
        return IOWebSocketChannel.connect(wsUrl).cast<String>();
      });
      final credentials = await client.credentialsFromPrivateKey(privateKey);
      final ownAddress = await credentials.extractAddress();
      final abiCode =
          '[    {        "inputs": [            {                "internalType": "address",                "name": "ad",                "type": "address"            },            {                "internalType": "address",                "name": "ma",                "type": "address"            },            {                "internalType": "address",                "name": "dis",                "type": "address"            },            {                "internalType": "address",                "name": "lo",                "type": "address"            },            {                "internalType": "address",                "name": "su",                "type": "address"            }        ],        "payable": false,        "stateMutability": "nonpayable",        "type": "constructor"    },    {        "constant": true,        "inputs": [],        "name": "adminc",        "outputs": [            {                "internalType": "contract AdminContract",                "name": "",                "type": "address"            }        ],        "payable": false,        "stateMutability": "view",        "type": "function"    },    {        "constant": true,        "inputs": [],        "name": "distributorc",        "outputs": [            {                "internalType": "contract DistributorContract",                "name": "",                "type": "address"            }        ],        "payable": false,        "stateMutability": "view",        "type": "function"    },    {        "constant": true,        "inputs": [],        "name": "loaderc",        "outputs": [            {                "internalType": "contract LoaderContract",                "name": "",                "type": "address"            }        ],        "payable": false,        "stateMutability": "view",        "type": "function"    },    {        "constant": true,        "inputs": [],        "name": "managerc",        "outputs": [            {                "internalType": "contract ManagerContract",                "name": "",                "type": "address"            }        ],        "payable": false,        "stateMutability": "view",        "type": "function"    },    {        "constant": true,        "inputs": [],        "name": "supervisorc",        "outputs": [            {                "internalType": "contract SupervisorContract",                "name": "",                "type": "address"            }        ],        "payable": false,        "stateMutability": "view",        "type": "function"    },    {        "constant": true,        "inputs": [            {                "internalType": "string",                "name": "_email",                "type": "string"            },            {                "internalType": "string",                "name": "_password",                "type": "string"            },            {                "internalType": "uint256",                "name": "_appId",                "type": "uint256"            }        ],        "name": "login",        "outputs": [            {                "internalType": "bool",                "name": "",                "type": "bool"            }        ],        "payable": false,        "stateMutability": "view",        "type": "function"    },    {        "constant": true,        "inputs": [            {                "internalType": "string",                "name": "_email",                "type": "string"            },            {                "internalType": "bytes32",                "name": "token",                "type": "bytes32"            },            {                "internalType": "uint256",                "name": "_appId",                "type": "uint256"            }        ],        "name": "registation",        "outputs": [            {                "internalType": "bool",                "name": "",                "type": "bool"            },            {                "internalType": "uint256",                "name": "",                "type": "uint256"            }        ],        "payable": false,        "stateMutability": "view",        "type": "function"    },    {        "constant": true,        "inputs": [            {                "internalType": "string",                "name": "_email",                "type": "string"            },            {                "internalType": "uint256",                "name": "_appId",                "type": "uint256"            }        ],        "name": "frogetPassword",        "outputs": [            {                "internalType": "bool",                "name": "",                "type": "bool"            },            {                "internalType": "uint256",                "name": "",                "type": "uint256"            }        ],        "payable": false,        "stateMutability": "view",        "type": "function"    },    {        "constant": true,        "inputs": [            {                "internalType": "string",                "name": "_email",                "type": "string"            },            {                "internalType": "bytes32",                "name": "token",                "type": "bytes32"            },            {                "internalType": "uint256",                "name": "_appId",                "type": "uint256"            }        ],        "name": "resetPassword",        "outputs": [            {                "internalType": "bool",                "name": "",                "type": "bool"            },            {                "internalType": "uint256",                "name": "",                "type": "uint256"            }        ],        "payable": false,        "stateMutability": "view",        "type": "function"    }]';

      final disAbiCode =
          '[{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"emailcode","type":"bytes32"},{"indexed":false,"internalType":"uint256","name":"index","type":"uint256"}],"name":"LogDeleteDistributor","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"emailCode","type":"bytes32"},{"indexed":false,"internalType":"uint256","name":"index","type":"uint256"},{"indexed":false,"internalType":"string","name":"email","type":"string"},{"indexed":false,"internalType":"bytes32","name":"passwordCode","type":"bytes32"},{"indexed":false,"internalType":"string","name":"name","type":"string"},{"indexed":false,"internalType":"uint256","name":"contactNumber","type":"uint256"},{"indexed":false,"internalType":"string","name":"userAddress","type":"string"},{"indexed":false,"internalType":"uint256","name":"userAccess","type":"uint256"}],"name":"LogNewDistributor","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"emailCode","type":"bytes32"},{"indexed":false,"internalType":"uint256","name":"index","type":"uint256"},{"indexed":false,"internalType":"string","name":"email","type":"string"},{"indexed":false,"internalType":"bytes32","name":"passwordCode","type":"bytes32"},{"indexed":false,"internalType":"string","name":"name","type":"string"},{"indexed":false,"internalType":"uint256","name":"contactNumber","type":"uint256"},{"indexed":false,"internalType":"string","name":"userAddress","type":"string"},{"indexed":false,"internalType":"uint256","name":"userAccess","type":"uint256"}],"name":"LogUpdateDistributor","type":"event"},{"constant":true,"inputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"name":"distributorArray","outputs":[{"internalType":"string","name":"email","type":"string"},{"internalType":"bytes32","name":"emailCode","type":"bytes32"},{"internalType":"bytes32","name":"passwordCode","type":"bytes32"},{"internalType":"string","name":"name","type":"string"},{"internalType":"uint256","name":"contactNumber","type":"uint256"},{"internalType":"string","name":"userAddress","type":"string"},{"internalType":"uint256","name":"userAccess","type":"uint256"},{"internalType":"uint256","name":"index","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"bytes32","name":"_emailCode","type":"bytes32"}],"name":"isDistributor","outputs":[{"internalType":"bool","name":"isIndeed","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"_email","type":"string"}],"name":"createDistributorToken","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"internalType":"string","name":"_email","type":"string"}],"name":"getDistributorToken","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"string","name":"_email","type":"string"},{"internalType":"bytes32","name":"_token","type":"bytes32"}],"name":"checkDistributorToken","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"_email","type":"string"},{"internalType":"string","name":"_password","type":"string"}],"name":"setPassword","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"_email","type":"string"},{"internalType":"string","name":"_name","type":"string"},{"internalType":"string","name":"_address","type":"string"},{"internalType":"uint256","name":"_telephone","type":"uint256"}],"name":"insertDistributor","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"bytes32","name":"email","type":"bytes32"}],"name":"deleteDistributor","outputs":[{"internalType":"string","name":"","type":"string"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"bytes32","name":"email","type":"bytes32"}],"name":"blockDistributor","outputs":[{"internalType":"string","name":"","type":"string"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"_email","type":"string"},{"internalType":"uint256","name":"usreAccess","type":"uint256"}],"name":"editUserAccess","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"internalType":"string","name":"_email","type":"string"}],"name":"getDistributor","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"},{"internalType":"string","name":"email","type":"string"},{"internalType":"string","name":"name","type":"string"},{"internalType":"uint256","name":"contactNumber","type":"uint256"},{"internalType":"string","name":"userAddress","type":"string"},{"internalType":"uint256","name":"userAccess","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"uint256","name":"i","type":"uint256"}],"name":"getDistributori","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"},{"internalType":"string","name":"","type":"string"},{"internalType":"string","name":"","type":"string"},{"internalType":"uint256","name":"","type":"uint256"},{"internalType":"string","name":"","type":"string"},{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"getDistributorCount","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"_email","type":"string"},{"internalType":"string","name":"_name","type":"string"}],"name":"updateDistributorName","outputs":[{"internalType":"bool","name":"success","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"_email","type":"string"},{"internalType":"string","name":"_userAddress","type":"string"}],"name":"updateDistributorAddress","outputs":[{"internalType":"bool","name":"success","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"_email","type":"string"},{"internalType":"uint256","name":"_contactNumber","type":"uint256"}],"name":"updateDistributorContactNumber","outputs":[{"internalType":"bool","name":"success","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"_email","type":"string"},{"internalType":"uint256[]","name":"index","type":"uint256[]"},{"internalType":"string","name":"_name","type":"string"},{"internalType":"string","name":"_userAddress","type":"string"},{"internalType":"uint256","name":"_contactNumber","type":"uint256"}],"name":"updateDistributor","outputs":[{"internalType":"bool","name":"success","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"_email","type":"string"}],"name":"updateDistributoriEmail","outputs":[{"internalType":"bool","name":"success","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"internalType":"bytes32","name":"email","type":"bytes32"}],"name":"checkDistributorUserAccess","outputs":[{"internalType":"uint256","name":"userAccess","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"bytes32","name":"email","type":"bytes32"}],"name":"checkDistributorPasswordCode","outputs":[{"internalType":"bytes32","name":"passwordCode","type":"bytes32"}],"payable":false,"stateMutability":"view","type":"function"}]';
      final contract = new DeployedContract(
          ContractAbi.fromJson(abiCode, 'Login'), contractAddr);
      print("before distributor");
      final DisContract = new DeployedContract(
          ContractAbi.fromJson(disAbiCode, 'DistributorContract'),
          contractAddrDis);
      final loginFunction = contract.function('login');
      print("after distributor");
      final getDataFunction = DisContract.function('getDistributor');
      print("after dis 2");

      // final UintType intV = 1 as UintType;
      final bal = await client.call(
          contract: contract,
          function: loginFunction,
          params: [email, password, BigInt.from(3)]);

      // BigInt bala = bal.first;

      print("before dis function");
      print(email);

      final disData = await client.call(
          contract: DisContract, function: getDataFunction, params: [email]);

      print(disData[2].split('#')[2]);
      var distributorIdCode = disData[0];
      prefs.setString('disId', bytesToHex(distributorIdCode));
      prefs.setString('usrType', disData[2].split('#')[2]);
      print(prefs.getString('disId'));
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => HomePage()));

      // print('We have ${balance.first} MetaCoins');
    } catch (e) {
      print("exception occured");
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    // getVal();
  }

  @override
  Widget build(BuildContext context) {
    // EtherAmount balance = ethClient.getBalance();

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
                Form(
                    key: _formKey,
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
                                      image:
                                          AssetImage("assets/images/logo1.png"),
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
                              validator: (value) => value.isEmpty
                                  ? 'E mail cannot be empty'
                                  : null,
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
                              validator: (value) => value.isEmpty
                                  ? "Password cannot be empty"
                                  : null,
                              onSaved: (value) => password = value.trim(),
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
                                    "LOGIN",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  )),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              SignUp()));
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
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ForgetPass()));
                            },
                            child: Container(
                              height: 50,
                              width: 210,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Colors.green,
                                    Colors.greenAccent
                                  ]),
                                  color: Colors.greenAccent,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                "FORGOT PASSWORD ?",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                              )),
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            )));
  }
}
