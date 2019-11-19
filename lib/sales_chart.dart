import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teatruth/sales_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Sales_Chart extends StatelessWidget {
  final List<SalesSeries> data;

  Sales_Chart({@required this.data});
  @override
  Widget build(BuildContext context) {
    List<charts.Series<SalesSeries, String>> series = [
      charts.Series(
          id: "Sales",
          data: data,
          domainFn: (SalesSeries series, _) => series.month,
          measureFn: (SalesSeries series, _) => series.salesAmount,
          colorFn: (SalesSeries series, _) => series.barColor)
    ];
    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text("Sales History"),
              Expanded(
                child: charts.BarChart(
                  series,
                  animate: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
