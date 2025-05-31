import 'package:cashflow/modules/incomes/controllers/income_controller.dart';
import 'package:cashflow/shared/theme/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _valorController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final IncomeController _incomeController = Modular.get<IncomeController>();
  String? _selectedCategory;

  @override
  void dispose() {
    _valorController.dispose();
    _descricaoController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Adicionar Transação",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFD600),
          ),
        ),
      ),
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
                    controller: _valorController,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
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
                              _incomeController.transactionTypeSelected ==
                              TransactionType.income,
                          selectedColor: Colors.green,
                          backgroundColor: AppColors.darkGrey,
                          labelStyle: TextStyle(
                            color:
                                _incomeController.transactionTypeSelected ==
                                        TransactionType.income
                                    ? Colors.white
                                    : Colors.white70,
                          ),
                          onSelected: (selected) {
                            _incomeController.transactionTypeSelected =
                                TransactionType.income;
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
                              _incomeController.transactionTypeSelected ==
                              TransactionType.expense,
                          selectedColor: Colors.red,
                          backgroundColor: AppColors.darkGrey,
                          labelStyle: TextStyle(
                            color:
                                _incomeController.transactionTypeSelected ==
                                        TransactionType.expense
                                    ? Colors.white
                                    : Colors.white70,
                          ),
                          onSelected: (selected) {
                            _incomeController.transactionTypeSelected =
                                TransactionType.expense;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Campo Descrição
                  TextFormField(
                    controller: _descricaoController,
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
                        _incomeController.getCategories().map((category) {
                          final bool isSelected = _selectedCategory == category;
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
                                _incomeController.transactionTypeSelected ==
                                        TransactionType.income
                                    ? Colors.green
                                    : Colors.red,
                            backgroundColor: AppColors.darkGrey,
                            onSelected: (selected) {
                              setState(() {
                                _selectedCategory = category;
                              });
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
                      onPressed: () {
                        if (_formKey.currentState!.validate() &&
                            _selectedCategory != null) {
                          // Realize a conversão e o salvamento dos dados.
                          // Exemplo: converter o valor e armazenar os dados coletados.
                        } else if (_selectedCategory == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Selecione uma categoria"),
                            ),
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
}
