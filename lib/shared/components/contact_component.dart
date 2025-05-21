import 'package:flutter/material.dart';
import 'package:cashflow/shared/theme/constants/app_colors.dart';

class ContactComponent extends StatelessWidget {
  final String nome;
  final String imagemUrl;
  final VoidCallback onTap;

  const ContactComponent({
    Key? key,
    required this.nome,
    required this.imagemUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(radius: 25, backgroundColor: AppColors.primary),
      title: Text(nome, style: TextStyle(fontWeight: FontWeight.w600)),
      onTap: onTap,
    );
  }
}
