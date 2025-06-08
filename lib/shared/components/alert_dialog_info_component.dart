import 'package:cashflow/shared/models/action_model.dart';
import 'package:cashflow/shared/theme/constants/app_colors.dart';
import 'package:cashflow/shared/util/enums.dart';
import 'package:flutter/material.dart';

class AlertDialogInfoComponent extends StatelessWidget {
  final String title;
  final String description;
  final List<ActionModel> actions;
  final AlertDialogType alertDialogType;

  const AlertDialogInfoComponent({
    super.key,
    required this.title,
    required this.description,
    required this.actions,
    required this.alertDialogType,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Fechar
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.black87),
                onPressed: () => Navigator.of(context).pop(),
                tooltip: 'Fechar',
              ),
            ),
            // Ícone e título
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: _getColor(alertDialogType).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    _getIcon(alertDialogType),
                    color: _getColor(alertDialogType),
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Descrição
            Text(
              description,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 24),
            // Botões de ação
            ...actions.map(
              (action) => Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _getColor(alertDialogType),
                    foregroundColor: Colors.black,
                    minimumSize: const Size.fromHeight(48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: action.onTap,
                  child: Text(
                    action.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getColor(AlertDialogType alertDialogType) {
    switch (alertDialogType) {
      case AlertDialogType.info:
        return AppColors.accent;
      case AlertDialogType.attention:
        return AppColors.cobaltBlue;
      case AlertDialogType.important:
      case AlertDialogType.error:
        return AppColors.red;
      default:
        return AppColors.accent;
    }
  }

  IconData _getIcon(AlertDialogType alertDialogType) {
    switch (alertDialogType) {
      case AlertDialogType.info:
        return Icons.info_outline;
      case AlertDialogType.attention:
        return Icons.warning_amber_rounded;
      case AlertDialogType.important:
        return Icons.priority_high_rounded;
      case AlertDialogType.error:
        return Icons.error_outline;
      default:
        return Icons.info_outline;
    }
  }
}
