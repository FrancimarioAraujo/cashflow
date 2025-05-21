import 'package:cashflow/shared/theme/constants/app_border_radius.dart';
import 'package:cashflow/shared/theme/constants/app_colors.dart';
import 'package:cashflow/shared/theme/constants/app_paddings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cashflow/shared/validators/email_validator.dart';
import 'package:cashflow/shared/validators/password_validator.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                                      "Entrar",
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
                                        controller: _emailController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          labelText: 'Email',
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
                                            Modular.to.pushReplacementNamed(
                                              '/home/',
                                            );
                                          }
                                        },
                                        child: const Text("Entrar"),
                                      ),
                                    ),
                                    Container(
                                      margin: AppPaddings.topSmall,
                                      child: Center(
                                        child: TextButton(
                                          onPressed:
                                              () => Modular.to.pushNamed(
                                                '/auth/forgot',
                                              ),
                                          child: const Text(
                                            "Esqueceu a senha?",
                                          ),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: TextButton(
                                        onPressed:
                                            () => Modular.to.pushNamed(
                                              '/auth/signup',
                                            ),
                                        child: const Text(
                                          "Não tem uma conta? Cadastre-se",
                                        ),
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
