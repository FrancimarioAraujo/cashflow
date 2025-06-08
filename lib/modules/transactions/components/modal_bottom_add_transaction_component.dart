import 'package:cashflow/modules/auth/auth_controller.dart';
import 'package:cashflow/modules/transactions/controllers/transaction_controller.dart';
import 'package:cashflow/modules/transactions/models/transaction_model.dart';
import 'package:cashflow/shared/components/alert_dialog_custom_exception_component.dart';
import 'package:cashflow/shared/components/alert_dialog_info_component.dart';
import 'package:cashflow/shared/exceptions/custom_exception.dart';
import 'package:cashflow/shared/models/action_model.dart';
import 'package:cashflow/shared/theme/constants/app_colors.dart';
import 'package:cashflow/shared/util/enums.dart';
import 'package:cashflow/shared/util/strings_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/services.dart';

class ModalBottomAddTransactionComponent extends StatefulWidget {
  TransactionModel? transaction;
  bool editing;
  ModalBottomAddTransactionComponent({
    super.key,
    this.transaction,
    this.editing = false,
  });

  @override
  State<ModalBottomAddTransactionComponent> createState() =>
      _ModalBottomAddTransactionComponentState();
}

class _ModalBottomAddTransactionComponentState
    extends State<ModalBottomAddTransactionComponent> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _valueTextFieldController =
      TextEditingController();
  final TextEditingController _descriptionTextFieldController =
      TextEditingController();
  final TransactionController _transactionController =
      Modular.get<TransactionController>();
  final AuthController _authController = Modular.get<AuthController>();

  StringsUtil stringsUtil = StringsUtil();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.transaction != null) {
      _valueTextFieldController.text =
          widget.transaction?.valor != null
              ? widget.transaction!.valor.toString()
              : "";
      _descriptionTextFieldController.text =
          widget.transaction?.description ?? "";
      _transactionController.selectTransactionType(
        widget.transaction!.transactionType == TransactionType.income.name
            ? TransactionType.income
            : TransactionType.expense,
      );
      _transactionController.selectCategory(widget.transaction!.category);
    }
  }

  @override
  void dispose() {
    _valueTextFieldController.dispose();
    _descriptionTextFieldController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black, elevation: 0),
      body: Observer(
        builder: (context) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Valor",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _valueTextFieldController,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[\d,\.]')),
                    ],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      hintText: "R\$ 0,00",
                      hintStyle: const TextStyle(
                        color: Colors.white54,
                        fontSize: 36,
                      ),
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Informe o valor";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: ChoiceChip(
                          label: const Text(
                            "Receita",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          selected:
                              _transactionController.transactionTypeSelected ==
                              TransactionType.income,
                          selectedColor: Colors.green,
                          backgroundColor: AppColors.darkGrey,
                          labelStyle: TextStyle(
                            color:
                                _transactionController
                                            .transactionTypeSelected ==
                                        TransactionType.income
                                    ? Colors.white
                                    : Colors.white70,
                          ),
                          onSelected: (selected) {
                            _transactionController.selectTransactionType(
                              TransactionType.income,
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ChoiceChip(
                          label: const Text(
                            "Despesa",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          selected:
                              _transactionController.transactionTypeSelected ==
                              TransactionType.expense,
                          selectedColor: Colors.red,
                          backgroundColor: AppColors.darkGrey,
                          labelStyle: TextStyle(
                            color:
                                _transactionController
                                            .transactionTypeSelected ==
                                        TransactionType.expense
                                    ? Colors.white
                                    : Colors.white70,
                          ),
                          onSelected: (selected) {
                            _transactionController.selectTransactionType(
                              TransactionType.expense,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Campo Descrição
                  TextFormField(
                    controller: _descriptionTextFieldController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: "Descrição",
                      labelStyle: const TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Colors.white12,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Informe a descrição";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Categoria",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children:
                        _transactionController.getCategories().map((category) {
                          final bool isSelected = _transactionController
                              .isSelectedCategory(category);
                          return ChoiceChip(
                            label: Text(
                              category,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:
                                    isSelected ? Colors.white : Colors.white70,
                              ),
                            ),
                            selected: isSelected,
                            selectedColor:
                                _transactionController
                                            .transactionTypeSelected ==
                                        TransactionType.income
                                    ? Colors.green
                                    : Colors.red,
                            backgroundColor: AppColors.darkGrey,
                            onSelected: (selected) {
                              _transactionController.selectCategory(category);
                            },
                          );
                        }).toList(),
                  ),

                  const SizedBox(height: 32),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFD600),
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () async {
                        if (widget.editing) {
                          await updateTransaction(
                            valueParam: _valueTextFieldController.text,
                            descriptionParam:
                                _descriptionTextFieldController.text,
                          );
                        } else {
                          await addTransaction(
                            valueParam: _valueTextFieldController.text,
                            descriptionParam:
                                _descriptionTextFieldController.text,
                          );
                        }
                      },
                      child: const Text(
                        "Salvar",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> addTransaction({
    required String valueParam,
    required String descriptionParam,
  }) async {
    try {
      double value = stringsUtil.textToDouble(valueParam);
      if (_formKey.currentState!.validate() &&
          _transactionController.selectedCategory != null) {
        await _transactionController
            .addTransaction(
              value: value,
              description: descriptionParam,
              category: _transactionController.selectedCategory!,
            )
            .then((value) async {
              await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialogInfoComponent(
                    title: "Transação adicionada",
                    description: "Sua transação foi adicionada com sucesso.",
                    actions: [
                      ActionModel(
                        title: "Consultar transações",
                        onTap: () {
                          Navigator.of(context).pop();

                          Modular.to.pushNamed("/home/dashboard");
                        },
                      ),
                    ],
                    alertDialogType: AlertDialogType.info,
                  );
                },
              );
            });
      } else if (_transactionController.selectedCategory == null) {
        throw CustomException(
          title: "Campo vazio",
          message: "Selecione uma categoria",
        );
      }
    } on CustomException catch (e) {
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialogCustomExceptionComponent(customException: e);
        },
      );
    } catch (e) {
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialogCustomExceptionComponent(
            customException: CustomException(
              title: "Erro",
              message: "Ocorreu um erro ao adicionar a transação.",
            ),
          );
        },
      );
    }
  }

  Future<void> updateTransaction({
    required String valueParam,
    required String descriptionParam,
  }) async {
    try {
      if (_formKey.currentState!.validate() &&
          _transactionController.selectedCategory != null) {
        double value = stringsUtil.textToDouble(_valueTextFieldController.text);
        if (widget.transaction!.transactionType !=
            _transactionController.transactionTypeSelected.name) {
          _transactionController.deleteTransaction(
            transaction: widget.transaction!,
          );
          _transactionController.addTransaction(
            value: value,
            description: _descriptionTextFieldController.text,
            category: _transactionController.selectedCategory!,
          );
        } else {
          await _transactionController.updateTransaction(
            value: value,
            description: descriptionParam,
            category: _transactionController.selectedCategory!,
            transaction: widget.transaction!,
            transactionType:
                _transactionController.transactionTypeSelected.name,
          );
        }

        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialogInfoComponent(
              title: "Transação Atualizada",
              description: "Sua transação foi atualizada com sucesso.",
              actions: [
                ActionModel(
                  title: "Consultar transações",
                  onTap: () {
                    Navigator.of(context).pop();

                    Modular.to.pushNamed("/home/dashboard");
                  },
                ),
              ],
              alertDialogType: AlertDialogType.info,
            );
          },
        );
      } else if (_transactionController.selectedCategory == null) {
        throw CustomException(
          title: "Campo vazio",
          message: "Selecione uma categoria",
        );
      }
    } on CustomException catch (e) {
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialogCustomExceptionComponent(customException: e);
        },
      );
    } catch (e) {
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialogCustomExceptionComponent(
            customException: CustomException(
              title: "Erro",
              message: "Ocorreu um erro ao atualizar a transação.",
            ),
          );
        },
      );
    }
  }
}
