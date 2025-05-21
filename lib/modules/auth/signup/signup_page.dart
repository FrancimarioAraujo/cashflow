import 'package:cashflow/shared/theme/constants/app_border_radius.dart';
import 'package:cashflow/shared/theme/constants/app_colors.dart';
import 'package:cashflow/shared/theme/constants/app_paddings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cashflow/shared/validators/complete_name_validator.dart';
import 'package:cashflow/shared/validators/email_validator.dart';
import 'package:cashflow/shared/validators/password_validator.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _completeName = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Center(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 600),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    'assets/logo.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const Text(
                                "CashFlow",
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.accent,
                                ),
                              ),
                              const Text(
                                "Gerencie suas finanças com facilidade",
                                style: TextStyle(
                                  color: AppColors.secondary,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Expanded(
                            child: Container(
                              margin: AppPaddings.topMedium,
                              padding: AppPaddings.large,
                              decoration: const BoxDecoration(
                                color: AppColors.secondary,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(24),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.dark,
                                    blurRadius: 10,
                                    offset: Offset(0, -5),
                                  ),
                                ],
                              ),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const Text(
                                      "Cadastro",
                                      style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.dark,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Container(
                                      margin: AppPaddings.topSmall,
                                      child: TextFormField(
                                        controller: _completeName,
                                        decoration: InputDecoration(
                                          labelText: 'Nome Completo',
                                          prefixIcon: const Icon(
                                            Icons.person_outline,
                                          ),
                                        ),
                                        validator:
                                            CompleteNameValidator.validate,
                                      ),
                                    ),
                                    Container(
                                      margin: AppPaddings.topSmall,
                                      child: TextFormField(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        controller: _emailController,
                                        decoration: InputDecoration(
                                          labelText: 'E-mail',
                                          prefixIcon: const Icon(
                                            Icons.mail_outline,
                                          ),
                                        ),
                                        validator: EmailValidator.validate,
                                      ),
                                    ),
                                    Container(
                                      margin: AppPaddings.topSmall,
                                      child: TextFormField(
                                        controller: _passwordController,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          labelText: 'Senha',
                                          prefixIcon: const Icon(
                                            Icons.lock_outline,
                                          ),
                                        ),
                                        validator: PasswordValidator.validate,
                                      ),
                                    ),
                                    Container(
                                      margin: AppPaddings.topSmall,
                                      child: TextFormField(
                                        controller: _confirmPasswordController,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          labelText: 'Confirmar Senha',
                                          prefixIcon: const Icon(
                                            Icons.lock_outline,
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value !=
                                              _passwordController.text) {
                                            return 'As senhas não coincidem';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Container(
                                      margin: AppPaddings.topMedium,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.accent,
                                          foregroundColor: AppColors.dark,
                                          padding: AppPaddings.horizontalSmall,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: AppBorderRadius.large,
                                          ),
                                        ),
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            // Lógica de cadastro
                                          }
                                        },
                                        child: const Text(
                                          'Cadastrar-se',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: TextButton(
                                        onPressed: () {
                                          Modular.to.pushNamed('/auth');
                                        },
                                        child: const Text('Já tenho uma conta'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
