import 'package:cashflow/shared/components/alert_dialog_info_component.dart';
import 'package:cashflow/shared/exceptions/custom_exception.dart';
import 'package:cashflow/shared/models/action_model.dart';
import 'package:flutter/material.dart';

class AlertDialogCustomExceptionComponent extends StatefulWidget {
  CustomException customException;
  List<ActionModel>? actions;
  AlertDialogCustomExceptionComponent({
    super.key,
    required this.customException,
    this.actions,
  });

  @override
  State<AlertDialogCustomExceptionComponent> createState() =>
      _AlertDialogCustomExceptionComponentState();
}

class _AlertDialogCustomExceptionComponentState
    extends State<AlertDialogCustomExceptionComponent> {
  @override
  Widget build(BuildContext context) {
    return AlertDialogInfoComponent(
      title: widget.customException.title,
      description: widget.customException.message,
      actions:
          widget.actions ??
          [
            ActionModel(
              title: "Ok",
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
      alertDialogType: AlertDialogType.error,
    );
  }
}
