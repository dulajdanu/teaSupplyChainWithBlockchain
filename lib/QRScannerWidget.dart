import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_code_scanner/qr_scanner_overlay_shape.dart';

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
    '0x7f2ef1bafe1fce3d063bef284bc98da98c4d29b2d8d224408f200ddb73e49487';

final EthereumAddress contractAddr =
    EthereumAddress.fromHex('0x7419d6fA8b3Ce22E0A4958fdD86dedBcbe06d74A');
final EthereumAddress receiver =
    EthereumAddress.fromHex('0x05346F5978995345Ab999311eE6A9eD614Bc4F95');

final EthereumAddress contractAddrDis =
    EthereumAddress.fromHex('0x936C105E309D150BBd1FF09FdF0B0Cfd377638a8');

final abiCode =
    '[{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"boxIdcode","type":"bytes32"},{"indexed":false,"internalType":"uint256","name":"index","type":"uint256"}],"name":"LogDeleteBox","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"boxIdCode","type":"bytes32"},{"indexed":false,"internalType":"uint256","name":"index","type":"uint256"},{"indexed":false,"internalType":"string","name":"boxId","type":"string"},{"indexed":false,"internalType":"string","name":"oderId","type":"string"}],"name":"LogNewBox","type":"event"},{"constant":true,"inputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"name":"BoxArray","outputs":[{"internalType":"string","name":"boxId","type":"string"},{"internalType":"bytes32","name":"boxIdCode","type":"bytes32"},{"internalType":"string","name":"orderId","type":"string"},{"internalType":"string","name":"containerId","type":"string"},{"internalType":"string","name":"loaderScanDateAndTime","type":"string"},{"internalType":"uint256","name":"scantime","type":"uint256"},{"internalType":"uint256","name":"index","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"name":"OrderArray","outputs":[{"internalType":"bytes32","name":"orderIdCode","type":"bytes32"},{"internalType":"string","name":"orderId","type":"string"},{"internalType":"string","name":"boxId","type":"string"},{"internalType":"uint256","name":"index","type":"uint256"},{"internalType":"uint256","name":"quantity","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"string","name":"_boxId","type":"string"}],"name":"isBox","outputs":[{"internalType":"bool","name":"isIndeed","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"bytes32","name":"_boxIdCode","type":"bytes32"}],"name":"isBoxx","outputs":[{"internalType":"bool","name":"isIndeed","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"_boxId","type":"string"},{"internalType":"string","name":"_orderId","type":"string"}],"name":"insertBox","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"internalType":"string","name":"_boxId","type":"string"}],"name":"getBox","outputs":[{"internalType":"bytes32","name":"boxIdCode","type":"bytes32"},{"internalType":"string","name":"boxId","type":"string"},{"internalType":"string","name":"orderId","type":"string"},{"internalType":"string","name":"containerId","type":"string"},{"internalType":"string","name":"loaderScanDateAndTime","type":"string"},{"internalType":"uint256","name":"distributorIdCount","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"uint256","name":"i","type":"uint256"}],"name":"getBoxi","outputs":[{"internalType":"bytes32","name":"boxIdCode","type":"bytes32"},{"internalType":"string","name":"boxId","type":"string"},{"internalType":"string","name":"orderId","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"bytes32","name":"_boxIdCode","type":"bytes32"},{"internalType":"uint256","name":"i","type":"uint256"}],"name":"getBoxDistributori","outputs":[{"internalType":"string","name":"","type":"string"},{"internalType":"string","name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"internalType":"bytes32","name":"_boxIdCode","type":"bytes32"},{"internalType":"string","name":"distributorId","type":"string"},{"internalType":"string","name":"dateAndTime","type":"string"}],"name":"scanDistributor","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"_orderId","type":"string"},{"internalType":"uint256","name":"quantity","type":"uint256"}],"name":"insertOrder","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"internalType":"string","name":"_orderId","type":"string"}],"name":"getOrder","outputs":[{"internalType":"bytes32","name":"orderIdCode","type":"bytes32"},{"internalType":"string","name":"orderId","type":"string"},{"internalType":"uint256","name":"index","type":"uint256"},{"internalType":"uint256","name":"quantity","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"getLastBox","outputs":[{"internalType":"string","name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"}]';

class QRWidget extends StatefulWidget {
  @override
  QRWidgetState createState() => QRWidgetState();
}

class QRWidgetState extends State<QRWidget> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var qrText = "";
  QRViewController controller;

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
