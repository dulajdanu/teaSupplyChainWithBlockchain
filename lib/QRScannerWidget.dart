import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_code_scanner/qr_scanner_overlay_shape.dart';

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    EthereumAddress.fromHex('0xae92a667D9d858E72E355ed0bd219C1473Bcd34B');
final EthereumAddress receiver =
    EthereumAddress.fromHex('0xE4778F7662c3aB86dD4F3ef88D461cA3943Eae78');

class QRWidget extends StatefulWidget {
  @override
  QRWidgetState createState() => QRWidgetState();
}

class QRWidgetState extends State<QRWidget> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var qrText = "";
  QRViewController controller;

  getVal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final client = Web3Client(rpcUrl, Client(), socketConnector: () {
        return IOWebSocketChannel.connect(wsUrl).cast<String>();
      });
      final credentials = await client.credentialsFromPrivateKey(privateKey);
      final ownAddress = await credentials.extractAddress();

      final boxAbi =
          '[{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"boxIdcode","type":"bytes32"},{"indexed":false,"internalType":"uint256","name":"index","type":"uint256"}],"name":"LogDeleteBox","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"boxIdCode","type":"bytes32"},{"indexed":false,"internalType":"uint256","name":"index","type":"uint256"},{"indexed":false,"internalType":"string","name":"boxId","type":"string"},{"indexed":false,"internalType":"string","name":"oderId","type":"string"}],"name":"LogNewBox","type":"event"},{"constant":true,"inputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"name":"BoxArray","outputs":[{"internalType":"string","name":"boxId","type":"string"},{"internalType":"bytes32","name":"boxIdCode","type":"bytes32"},{"internalType":"string","name":"orderId","type":"string"},{"internalType":"string","name":"containerId","type":"string"},{"internalType":"string","name":"loaderScanDateAndTime","type":"string"},{"internalType":"uint256","name":"scantime","type":"uint256"},{"internalType":"uint256","name":"index","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"name":"OrderArray","outputs":[{"internalType":"bytes32","name":"orderIdCode","type":"bytes32"},{"internalType":"string","name":"orderId","type":"string"},{"internalType":"string","name":"boxId","type":"string"},{"internalType":"uint256","name":"index","type":"uint256"},{"internalType":"uint256","name":"quantity","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"string","name":"_boxId","type":"string"}],"name":"isBox","outputs":[{"internalType":"bool","name":"isIndeed","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"bytes32","name":"_boxIdCode","type":"bytes32"}],"name":"isBoxx","outputs":[{"internalType":"bool","name":"isIndeed","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"_boxId","type":"string"},{"internalType":"string","name":"_orderId","type":"string"}],"name":"insertBox","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"internalType":"string","name":"_boxId","type":"string"}],"name":"getBox","outputs":[{"internalType":"bytes32","name":"boxIdCode","type":"bytes32"},{"internalType":"string","name":"boxId","type":"string"},{"internalType":"string","name":"orderId","type":"string"},{"internalType":"string","name":"containerId","type":"string"},{"internalType":"string","name":"loaderScanDateAndTime","type":"string"},{"internalType":"uint256","name":"distributorIdCount","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"bytes32","name":"_boxIdCode","type":"bytes32"}],"name":"getBoxCode","outputs":[{"internalType":"bytes32","name":"boxIdCode","type":"bytes32"},{"internalType":"string","name":"boxId","type":"string"},{"internalType":"string","name":"orderId","type":"string"},{"internalType":"string","name":"containerId","type":"string"},{"internalType":"string","name":"loaderScanDateAndTime","type":"string"},{"internalType":"uint256","name":"distributorIdCount","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"uint256","name":"i","type":"uint256"}],"name":"getBoxi","outputs":[{"internalType":"bytes32","name":"boxIdCode","type":"bytes32"},{"internalType":"string","name":"boxId","type":"string"},{"internalType":"string","name":"orderId","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"bytes32","name":"_boxIdCode","type":"bytes32"},{"internalType":"uint256","name":"i","type":"uint256"}],"name":"getBoxDistributori","outputs":[{"internalType":"string","name":"","type":"string"},{"internalType":"string","name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"internalType":"bytes32","name":"_boxIdCode","type":"bytes32"},{"internalType":"string","name":"distributorId","type":"string"},{"internalType":"string","name":"dateAndTime","type":"string"}],"name":"scanDistributor","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"_orderId","type":"string"},{"internalType":"uint256","name":"quantity","type":"uint256"}],"name":"insertOrder","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"internalType":"string","name":"_orderId","type":"string"}],"name":"getOrder","outputs":[{"internalType":"bytes32","name":"orderIdCode","type":"bytes32"},{"internalType":"string","name":"orderId","type":"string"},{"internalType":"uint256","name":"index","type":"uint256"},{"internalType":"uint256","name":"quantity","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"getLastBox","outputs":[{"internalType":"string","name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"}]';

      final contract = new DeployedContract(
          ContractAbi.fromJson(boxAbi, 'BoxContract'), contractAddr);
      final scanFunction = contract.function('scanDistributor');
      final getBox = contract.function('getBoxCode');
      final isBox = contract.function('isBoxx');
      final getDistributorI = contract.function('getBoxDistributori');
      int flag = 0; //kalin scan karalada balanawa

      // final UintType intV = 1 as UintType;

      final boxData = await client.call(
          contract: contract, function: getBox, params: [hexToBytes(qrText)]);
      print("printing box data");
      print(boxData);
      var orderId = boxData[2];
      var scanTime = boxData[5].toString();
      print(scanTime.runtimeType);

      for (var i = 0; i < int.parse(scanTime); i++) {
        print("inside for loop");
        final boxDistributor = await client.call(
            contract: contract,
            function: getDistributorI,
            params: [hexToBytes(qrText), BigInt.from(i)]);

        if (boxDistributor[0] == prefs.getString('disMail')) {
          print("cannot scan");
          flag = 1;
          break;
        }
      }
      if (flag == 0) {
        final box = await client.call(
            contract: contract, function: isBox, params: [hexToBytes(qrText)]);

        if (box[0] == true) {
          print("this is a box");
          await client.sendTransaction(
              credentials,
              Transaction.callContract(
                  contract: contract,
                  function: scanFunction,
                  parameters: [
                    hexToBytes(qrText),
                    prefs.getString('disMail'),
                    DateTime.now().toString()
                  ]));

          print("funcion ended");

          if (scanTime == BigInt.from(0)) {
            print("change orders");
          } else {
            if (prefs.getString('usrType') == '0') {
              print("change order");
            }
          }

          // print(hexToBytes(qrText));
          // print(qrText.runtimeType);
        } else {
          print("not a box");
        }
      } else {
        print("already scanned");
      }

      // // BigInt bala = bal.first;
      // print(bal.first);
      // Navigator.pushReplacement(context,
      //     MaterialPageRoute(builder: (BuildContext context) => HomePage()));

      // print('We have ${balance.first} MetaCoins');
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              overlay: QrScannerOverlayShape(
                  borderRadius: 10,
                  borderColor: Colors.redAccent,
                  borderLength: 30,
                  borderWidth: 10,
                  cutOutSize: 300),
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Scan result: \n$qrText',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    RaisedButton(
                      autofocus: false,
                      color: Colors.redAccent,
                      child: Text(
                        "Add to Databse",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        print("herlloooo");
                        getVal();
                      },
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
