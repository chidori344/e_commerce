import 'package:flutter/material.dart';
import 'my_theme.dart';

class DialogUtils {
  static void ShowLoading(BuildContext context, String message) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (dialogContext) { // Use a unique name like dialogContext
        return AlertDialog(
          backgroundColor: MyTheme.primaryLight,
          content: Row(
            children: [
              CircularProgressIndicator(color: Theme.of(dialogContext).primaryColor),
              const SizedBox(width: 20),
              Text(message, style: Theme.of(dialogContext).textTheme.titleMedium),
            ],
          ),
        );
      },
    );
  }

  static void hideDialog(BuildContext context) {
    // Check if there is actually a dialog to pop to avoid crashing the app
    if (Navigator.canPop(context)) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  static void showMassage(
      BuildContext context,
      String message, {
        String title = "title",
        String posActionName = "ok",
        VoidCallback? posAction,
        String? negActionName,
        VoidCallback? negAction,
      }) {
    showDialog(
      context: context,
      builder: (runtimeContext) { // This context is created specifically for the dialog
        List<Widget> actions = [];

        if (posActionName != null) {
          actions.add(TextButton(
            onPressed: () {
              Navigator.pop(runtimeContext); // Closes the dialog safely
              posAction?.call();
            },
            child: Text(posActionName, style: TextStyle(color: Theme.of(context).primaryColor)),
          ));
        }

        if (negActionName != null) {
          actions.add(TextButton(
              onPressed: () {
                Navigator.pop(runtimeContext); // Closes the dialog safely
                negAction?.call();
              },
              child: Text(negActionName)
          ));
        }

        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: actions,
        );
      },
    );
  }
}
