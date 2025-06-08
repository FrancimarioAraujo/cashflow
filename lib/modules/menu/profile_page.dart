import 'package:cashflow/modules/auth/auth_controller.dart';
import 'package:cashflow/shared/components/alert_dialog_info_component.dart';
import 'package:cashflow/shared/models/action_model.dart';
import 'package:cashflow/shared/theme/constants/app_colors.dart';
import 'package:cashflow/shared/util/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final AuthController _authController = Modular.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          backgroundColor: AppColors.dark,
          appBar: AppBar(
            backgroundColor: AppColors.dark,
            elevation: 0,
            title: const Text(
              "Perfil",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/logo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  _authController.user.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _authController.user.email,
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                const SizedBox(height: 16),
                Card(
                  color: AppColors.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  child: ListTile(
                    leading: const Icon(Icons.logout, color: Colors.black),
                    title: const Text(
                      "Sair",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      _authController.logout();
                      Modular.to.pushNamed('/auth/');
                    },
                  ),
                ),
                const SizedBox(height: 16),
                // Card para excluir a conta
                Card(
                  color: AppColors.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  child: ListTile(
                    leading: const Icon(
                      Icons.delete_forever,
                      color: AppColors.red,
                    ),
                    title: const Text(
                      "Excluir minha conta",
                      style: TextStyle(
                        color: AppColors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () async {
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialogInfoComponent(
                            alertDialogType: AlertDialogType.important,
                            title: 'Excluir conta',
                            description:
                                'Você tem certeza que deseja excluir sua conta? Esta ação não pode ser desfeita.',

                            actions: [
                              ActionModel(
                                title: "Excluir",
                                onTap: () async {
                                  await _authController.deleteUser();
                                  Modular.to.navigate('/auth/');
                                },
                              ),
                              ActionModel(
                                title: "Cancelar",
                                onTap: () {
                                  Modular.to.pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
