import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Saudação
              const Text(
                "Olá, Joaquina Leite",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFD600), // Amarelo
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "Bem-vindo ao seu painel financeiro",
                style: TextStyle(fontSize: 15, color: Colors.white70),
              ),
              const SizedBox(height: 32),

              // Saldo Total
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD600),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Saldo Total",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      r"$ 3.389,33",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Receitas e Despesas
              Row(
                children: [
                  // Receitas
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white24, width: 2),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Row(
                            children: [
                              Text(
                                "Receitas",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                Icons.arrow_upward,
                                color: Colors.green,
                                size: 18,
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            "R\$ 8.250,00",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Despesas
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white24, width: 2),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Row(
                            children: [
                              Text(
                                "Despesas",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                Icons.arrow_downward,
                                color: Colors.red,
                                size: 18,
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            "R\$ 4.860,67",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Transações recentes
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white24, width: 2),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Transações recentes",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Suas últimas movimentações financeiras",
                      style: TextStyle(fontSize: 13, color: Colors.white54),
                    ),
                    const SizedBox(height: 16),
                    // Lista de transações
                    _buildTransaction(
                      icon: Icons.arrow_upward,
                      iconColor: Colors.green,
                      title: "Salário",
                      date: "15 abr",
                      value: "+R\$ 4.250,00",
                      valueColor: Colors.green,
                    ),
                    _divider(),
                    _buildTransaction(
                      icon: Icons.arrow_downward,
                      iconColor: Colors.red,
                      title: "Supermercado",
                      date: "10 abr",
                      value: "-R\$ 1.201,36",
                      valueColor: Colors.red,
                    ),
                    _divider(),
                    _buildTransaction(
                      icon: Icons.arrow_upward,
                      iconColor: Colors.green,
                      title: "Freelance",
                      date: "05 abr",
                      value: "+R\$ 1.000,00",
                      valueColor: Colors.green,
                    ),
                    _divider(),
                    _buildTransaction(
                      icon: Icons.arrow_downward,
                      iconColor: Colors.red,
                      title: "Aluguel",
                      date: "",
                      value: "-R\$ 1.000,00",
                      valueColor: Colors.red,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: const Color(0xFFFFD600),
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'INÍCIO'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'ADICIONAR'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'RELATÓRIOS',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _divider() =>
      const Divider(color: Colors.white24, thickness: 1, height: 16);

  Widget _buildTransaction({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String date,
    required String value,
    required Color valueColor,
  }) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: 22),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (date.isNotEmpty)
                Text(
                  date,
                  style: const TextStyle(color: Colors.white54, fontSize: 13),
                ),
            ],
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: valueColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
