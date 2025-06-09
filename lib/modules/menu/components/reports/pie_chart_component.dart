import 'dart:math';

import 'package:cashflow/modules/transactions/controllers/transaction_controller.dart';
import 'package:cashflow/shared/util/strings_util.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PieChartComponent extends StatefulWidget {
  List<Color> colors;
  List categories;
  PieChartComponent({
    super.key,
    required this.colors,
    required this.categories,
  });

  @override
  State<PieChartComponent> createState() => _PieChartComponentState();
}

class _PieChartComponentState extends State<PieChartComponent> {
  TransactionController transactionController =
      Modular.get<TransactionController>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: PieChart(
        PieChartData(
          sections: getSections(),
          sectionsSpace: 2,
          centerSpaceRadius: 40,
        ),
      ),
    );
  }

  List<PieChartSectionData> getSections() {
    List<PieChartSectionData> sections = [];

    List<Color> randomColors = widget.colors.toList();

    for (var category in widget.categories) {
      Color color = randomColors.removeAt(
        Random().nextInt(randomColors.length),
      );
      String title = StringsUtil().capitalize(category['name']);
      sections.add(
        PieChartSectionData(
          color: color,
          value: category['value'],
          title: title,
          radius: 80,
          titleStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );
    }

    return sections;
  }
}
