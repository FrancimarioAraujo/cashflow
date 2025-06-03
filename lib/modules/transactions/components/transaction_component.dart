import 'package:cashflow/modules/transactions/controllers/transaction_controller.dart';
import 'package:cashflow/modules/transactions/models/income_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

class TransactionComponent extends StatefulWidget {
  final TransactionModel transaction;
  const TransactionComponent({
    super.key,
    required TransactionModel this.transaction,
  });

  @override
  State<TransactionComponent> createState() => _TransactionComponentState();
}

class _TransactionComponentState extends State<TransactionComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          if (widget.transaction.transactionType == TransactionType.income.name)
            Icon(Icons.arrow_upward, color: Colors.green, size: 22)
          else
            Icon(Icons.arrow_downward, color: Colors.red, size: 22),

          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.transaction.description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  DateFormat(
                    "d 'de' MMMM 'de' y",
                    "pt_BR",
                  ).format(widget.transaction.date),
                  style: const TextStyle(color: Colors.white54, fontSize: 13),
                ),
              ],
            ),
          ),
          Text(
            "${widget.transaction.transactionType == TransactionType.income.name ? '+' : '-'}${NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(widget.transaction.valor)}",
            style: TextStyle(
              color:
                  widget.transaction.transactionType ==
                          TransactionType.income.name
                      ? Colors.green
                      : Colors.red,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
