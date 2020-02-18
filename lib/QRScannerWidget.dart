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
final EthereumAddress ordercontractAddr =
    EthereumAddress.fromHex('0xA47A7c9047248D982E2b0a9ccB2481CD7af488Bb');

class QRWidget extends StatefulWidget {
  @override
  QRWidgetState createState() => QRWidgetState();
}

class QRWidgetState extends State<QRWidget> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var qrText = "";
  QRViewController controller;
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

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
      final orderContractAbi =
          '[{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"orderNamecode","type":"bytes32"},{"indexed":false,"internalType":"uint256","name":"index","type":"uint256"}],"name":"LogDeleteOrder","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"orderNameCode","type":"bytes32"},{"indexed":false,"internalType":"uint256","name":"index","type":"uint256"},{"indexed":false,"internalType":"string","name":"orderName","type":"string"},{"indexed":false,"internalType":"string","name":"productName","type":"string"},{"indexed":false,"internalType":"string","name":"progress","type":"string"},{"indexed":false,"internalType":"uint256","name":"quntity","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"orderAccess","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"rate","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"unit","type":"uint256"}],"name":"LogNewOrder","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"orderNameCode","type":"bytes32"},{"indexed":false,"internalType":"uint256","name":"index","type":"uint256"},{"indexed":false,"internalType":"string","name":"orderName","type":"string"},{"indexed":false,"internalType":"string","name":"progress","type":"string"},{"indexed":false,"internalType":"uint256","name":"quntity","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"orderAccess","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"rate","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"unit","type":"uint256"}],"name":"LogUpdateOrder","type":"event"},{"constant":true,"inputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"name":"OrderArray","outputs":[{"internalType":"string","name":"orderName","type":"string"},{"internalType":"bytes32","name":"orderNameCode","type":"bytes32"},{"internalType":"string","name":"productName","type":"string"},{"internalType":"string","name":"progress","type":"string"},{"internalType":"uint256","name":"quntity","type":"uint256"},{"internalType":"uint256","name":"orderAccess","type":"uint256"},{"internalType":"uint256","name":"index","type":"uint256"},{"internalType":"uint256","name":"rate","type":"uint256"},{"internalType":"uint256","name":"unit","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"bytes32","name":"_orderNameCode","type":"bytes32"}],"name":"isOrder","outputs":[{"internalType":"bool","name":"isIndeed","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"_orderName","type":"string"},{"internalType":"string","name":"_progress","type":"string"},{"internalType":"uint256","name":"_quntity","type":"uint256"},{"internalType":"string","name":"productName","type":"string"}],"name":"insertOrder","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"bytes32","name":"_orderNameCode","type":"bytes32"}],"name":"deleteOrder","outputs":[{"internalType":"string","name":"","type":"string"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"internalType":"string","name":"_orderName","type":"string"}],"name":"getOrder","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"},{"internalType":"string","name":"orderName","type":"string"},{"internalType":"string","name":"progress","type":"string"},{"internalType":"uint256","name":"quntity","type":"uint256"},{"internalType":"uint256","name":"orderAccess","type":"uint256"},{"internalType":"uint256","name":"rate","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"uint256","name":"i","type":"uint256"}],"name":"getOrderi","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"},{"internalType":"string","name":"","type":"string"},{"internalType":"string","name":"","type":"string"},{"internalType":"string","name":"","type":"string"},{"internalType":"uint256","name":"","type":"uint256"},{"internalType":"uint256","name":"","type":"uint256"},{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"getOrderCount","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"_orderName","type":"string"},{"internalType":"string","name":"_progress","type":"string"}],"name":"updateOrderOrderProgress","outputs":[{"internalType":"bool","name":"success","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"_orderName","type":"string"},{"internalType":"uint256","name":"_rate","type":"uint256"}],"name":"rateOrder","outputs":[{"internalType":"bool","name":"success","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"}]';

      final contract = new DeployedContract(
          ContractAbi.fromJson(boxAbi, 'BoxContract'), contractAddr);
      final scanFunction = contract.function('scanDistributor');
      final getBox = contract.function('getBoxCode');
      final isBox = contract.function('isBoxx');
      final getDistributorI = contract.function('getBoxDistributori');
      final orderContract = new DeployedContract(
          ContractAbi.fromJson(orderContractAbi, 'OrderContract'),
          ordercontractAddr);
      int flag = 0; //kalin scan karalada balanawa

      final getOrderFun = orderContract.function('getOrder');

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

          final changeOrder = await client.call(
              contract: orderContract,
              function: getOrderFun,
              params: [orderId]);

          print(changeOrder);

          var progress = changeOrder[2].split("#");

          if (scanTime == BigInt.from(0)) {
            progress[3] = int.parse(progress[3]) - 20;
            progress[4] = int.parse(progress[4]) + 20;
            var newProgress = progress[0] +
                '#' +
                progress[1] +
                '#' +
                progress[2] +
                '#' +
                progress[3].toString() +
                '#' +
                progress[4].toString() +
                '#' +
                progress[5] +
                '#' +
                progress[6] +
                '#' +
                progress[7];

            final updateOrderProgress =
                orderContract.function('updateOrderOrderProgress');
            print(newProgress);
            await client.sendTransaction(
                credentials,
                Transaction.callContract(
                    contract: orderContract,
                    function: updateOrderProgress,
                    parameters: [orderId, newProgress]));
          } else {
            if (prefs.getString('usrType') == '0') {
              progress[4] = int.parse(progress[4]) - 20;
              progress[5] = int.parse(progress[5]) + 20;
              var newProgress = progress[0] +
                  '#' +
                  progress[1] +
                  '#' +
                  progress[2] +
                  '#' +
                  progress[3] +
                  '#' +
                  progress[4].toString() +
                  '#' +
                  progress[5].toString() +
                  '#' +
                  progress[6] +
                  '#' +
                  progress[7];

              final updateOrderProgress =
                  orderContract.function('updateOrderOrderProgress');

              await client.sendTransaction(
                  credentials,
                  Transaction.callContract(
                      contract: orderContract,
                      function: updateOrderProgress,
                      parameters: [orderId, newProgress]));
            }
          }

          // print(hexToBytes(qrText));
          // print(qrText.runtimeType);
        } else {
          final containerAbi =
              '[{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"containerIdcode","type":"bytes32"},{"indexed":false,"internalType":"uint256","name":"index","type":"uint256"}],"name":"LogDeleteContainer","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"containerIdCode","type":"bytes32"},{"indexed":false,"internalType":"uint256","name":"index","type":"uint256"},{"indexed":false,"internalType":"string","name":"containerId","type":"string"}],"name":"LogNewContainer","type":"event"},{"constant":true,"inputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"name":"ContainerArray","outputs":[{"internalType":"string","name":"containerId","type":"string"},{"internalType":"bytes32","name":"containerIdCode","type":"bytes32"},{"internalType":"string","name":"mainDistributorScanDateAndTime","type":"string"},{"internalType":"string","name":"loaderScanDateAndTime","type":"string"},{"internalType":"uint256","name":"orderIdCount","type":"uint256"},{"internalType":"uint256","name":"index","type":"uint256"},{"internalType":"uint256","name":"scantime","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"string","name":"_containerId","type":"string"}],"name":"isContainer","outputs":[{"internalType":"bool","name":"isIndeed","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"bytes32","name":"_containerIdCode","type":"bytes32"}],"name":"isContainerx","outputs":[{"internalType":"bool","name":"isIndeed","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"bytes32","name":"_containerIdCode","type":"bytes32"},{"internalType":"string","name":"_orderId","type":"string"}],"name":"isOrder","outputs":[{"internalType":"bool","name":"isIndeed","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"_containerId","type":"string"}],"name":"insertContainer","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"internalType":"string","name":"_containerId","type":"string"}],"name":"getContainer","outputs":[{"internalType":"bytes32","name":"containerIdCode","type":"bytes32"},{"internalType":"string","name":"containerId","type":"string"},{"internalType":"uint256","name":"orderIdCount","type":"uint256"},{"internalType":"string","name":"loaderScanDateAndTime","type":"string"},{"internalType":"string","name":"mainDistributorScanDateAndTime","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"string","name":"_containerId","type":"string"},{"internalType":"uint256","name":"i","type":"uint256"}],"name":"getorderi","outputs":[{"internalType":"string","name":"orderId","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"internalType":"bytes32","name":"_containerIdCode","type":"bytes32"},{"internalType":"string","name":"orderId","type":"string"}],"name":"addOrder","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"bytes32","name":"_containerIdCode","type":"bytes32"},{"internalType":"string","name":"distributorIdAnddateAndTime","type":"string"}],"name":"scanContaine","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"}]';
          final EthereumAddress containerContractAddr = EthereumAddress.fromHex(
              '0x14e9e4820E7ed3087B11d9E9f47044Cb11ee2C5d');

          final containerContract = new DeployedContract(
              ContractAbi.fromJson(containerAbi, 'ContainerContract'),
              containerContractAddr);

          final conContractFun = containerContract.function('scanContaine');

          await client.sendTransaction(
              credentials,
              Transaction.callContract(
                  contract: containerContract,
                  function: conContractFun,
                  parameters: [
                    hexToBytes(qrText),
                    prefs.getString('disMail') + "#" + DateTime.now().toString()
                  ]));
          final changeOrder = await client.call(
              contract: orderContract,
              function: getOrderFun,
              params: [orderId]);
          var progress = changeOrder[2].split("#");
          progress[2] = int.parse(progress[2]) - 40;
          progress[3] = int.parse(progress[3]) + 40;
          var newProgress = progress[0] +
              '#' +
              progress[1] +
              '#' +
              progress[2].toString() +
              '#' +
              progress[3].toString() +
              '#' +
              progress[4] +
              '#' +
              progress[5] +
              '#' +
              progress[6] +
              '#' +
              progress[7];

          final updateOrderProgress =
              orderContract.function('updateOrderOrderProgress');

          await client.sendTransaction(
              credentials,
              Transaction.callContract(
                  contract: orderContract,
                  function: updateOrderProgress,
                  parameters: [orderId, newProgress]));
          print("not a box");
        }
      } else {
        print("already scanned");
        final snackBar = SnackBar(
          content: Text(
            "Already Scanned",
            style: TextStyle(color: Colors.red),
          ),
        );
        _scaffoldKey.currentState.showSnackBar(snackBar);
      }

      // // BigInt bala = bal.first;
      // print(bal.first);
      // Navigator.pushReplacement(context,
      //     MaterialPageRoute(builder: (BuildContext context) => HomePage()));

      // print('We have ${balance.first} MetaCoins');
    } catch (e) {
      print(e);
      print("already scanned");
      final snackBar = SnackBar(
        content: Text(
          "Error Occured",
          style: TextStyle(color: Colors.red),
        ),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
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
