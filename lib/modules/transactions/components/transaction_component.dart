import 'package:cashflow/modules/transactions/components/modal_bottom_add_transaction_component.dart';
import 'package:cashflow/modules/transactions/controllers/transaction_controller.dart';
import 'package:cashflow/modules/transactions/models/transaction_model.dart';
import 'package:cashflow/shared/components/alert_dialog_info_component.dart';
import 'package:cashflow/shared/models/action_model.dart';
import 'package:cashflow/shared/util/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

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
  final TransactionController _transactionController =
      Modular.get<TransactionController>();

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
          PopupMenuButton<int>(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onSelected: (value) async {
              if (value == 0) {
                await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialogInfoComponent(
                      title: "Excluir transação",
                      description:
                          "Você tem certeza que deseja excluir esta transação?",
                      actions: [
                        ActionModel(
                          title: "Cancelar",
                          onTap: () {
                            Modular.to.pop();
                          },
                        ),
                        ActionModel(
                          title: "Excluir",
                          onTap: () async {
                            await _transactionController.deleteTransaction(
                              transaction: widget.transaction,
                            );
                            Modular.to.pop();
                          },
                        ),
                      ],
                      alertDialogType: AlertDialogType.important,
                    );
                  },
                );
              } else if (value == 1) {
                await showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder:
                      (_) => ModalBottomAddTransactionComponent(
                        transaction: widget.transaction,
                        editing: true,
                      ),
                );
              }
            },
            itemBuilder:
                (context) => [
                  const PopupMenuItem(value: 0, child: Text("Excluir")),
                  const PopupMenuItem(value: 1, child: Text("Editar")),
                ],
          ),
        ],
      ),
    );
  }
}
