import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/widgets.dart';

class SalesSeries {
  final String month;
  final int salesAmount;
  final charts.Color barColor;

  SalesSeries(
      {@required this.month,
      @required this.salesAmount,
      @required this.barColor});
}
