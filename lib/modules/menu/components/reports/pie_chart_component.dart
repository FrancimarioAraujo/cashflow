import 'dart:math';

import 'package:cashflow/modules/transactions/controllers/transaction_controller.dart';
import 'package:cashflow/shared/theme/constants/app_colors.dart';
import 'package:cashflow/shared/util/strings_util.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PieChartComponent extends StatefulWidget {
  const PieChartComponent({super.key});

  @override
  State<PieChartComponent> createState() => _PieChartComponentState();
}

class _PieChartComponentState extends State<PieChartComponent> {
  TransactionController transactionController =
      Modular.get<TransactionController>();
  @override
  Widget build(BuildContext context) {
    return Container(
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
    List<Color> colors = [
      AppColors.amber,
      AppColors.red,
      AppColors.emeraldGreen,
      AppColors.cobaltBlue,
    ];
    List<PieChartSectionData> sections = [];
    List incomeCategories =
        transactionController.incomesByCategory["categories"];

    List<Color> coresAleatorias = colors.toList();

    for (var category in incomeCategories) {
      Color cor = coresAleatorias.removeAt(
        Random().nextInt(coresAleatorias.length),
      );
      String title = StringsUtil().capitalize(category['name']);
      sections.add(
        PieChartSectionData(
          color: cor,
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
