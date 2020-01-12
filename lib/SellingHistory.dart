import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:teatruth/sales_chart.dart';
import 'package:teatruth/sales_series.dart';

class SellingRate extends StatefulWidget {
  @override
  SellingRateState createState() => SellingRateState();
}

class SellingRateState extends State<SellingRate> {
  final List<SalesSeries> data = [
    SalesSeries(
        month: "Jan",
        salesAmount: 23000,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    SalesSeries(
        month: "Feb",
        salesAmount: 20000,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    SalesSeries(
        month: "Mar",
        salesAmount: 10000,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    SalesSeries(
        month: "April",
        salesAmount: 50000,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    SalesSeries(
        month: "May",
        salesAmount: 20000,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Selling History"),
      ),
      body: Center(
        child: Sales_Chart(data: data),
      ),
    );
  }
}
