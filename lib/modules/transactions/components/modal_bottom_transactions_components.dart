import 'package:cashflow/modules/transactions/components/transaction_component.dart';
import 'package:cashflow/modules/transactions/controllers/transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class ModalBottomTransactionsComponents extends StatefulWidget {
  const ModalBottomTransactionsComponents({Key? key}) : super(key: key);

  @override
  State<ModalBottomTransactionsComponents> createState() =>
      _ModalBottomTransactionsComponentsState();
}

class _ModalBottomTransactionsComponentsState
    extends State<ModalBottomTransactionsComponents> {
  TransactionController transactionController =
      Modular.get<TransactionController>();

  @override
  void initState() {
    super.initState();
    transactionController.fetchTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (transactionController.isLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }
        return Container(
          color: Colors.transparent,
          child: DraggableScrollableSheet(
            initialChildSize: 0.9,
            minChildSize: 0.3,
            maxChildSize: 1.0,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.black, // Mesmo fundo que o DashboardPage
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 40.0,
                      height: 4.0,
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Título do modal
                    const Text(
                      "Minhas Transações",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Lista de transações
                    Expanded(
                      child: ListView.separated(
                        controller: scrollController,
                        itemCount: transactionController.transactions.length,
                        separatorBuilder:
                            (context, index) => const Divider(
                              color: Colors.white24,
                              thickness: 1,
                              height: 16,
                            ),
                        itemBuilder: (context, index) {
                          final transaction =
                              transactionController.transactions[index];
                          return TransactionComponent(transaction: transaction);
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
