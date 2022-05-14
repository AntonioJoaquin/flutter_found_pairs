import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DialogService {
  final GlobalKey<NavigatorState> _navigatorKey;

  DialogService(this._navigatorKey);

  BuildContext _getSafeContext() {
    final context = _navigatorKey.currentContext;

    // ignore: prefer_if_null_operators
    return context != null
        ? context
        : throw ('Have you forgot to setup navigation?');
  }

  Future<void> _getDialog({
    required String content,
    required String positiveTextButton,
    required bool isDismissible,
    Function()? positiveButtonAction,
    String? negativeTextButton,
    Function()? negativeButtonAction,
  }) {
    return showDialog(
        context: _getSafeContext(),
        barrierDismissible: isDismissible,
        builder: (_) {
          return AlertDialog(
            backgroundColor: Colors.purple[50],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
            content: Text(content),
            actions: [
              (negativeTextButton != null)
                  ? TextButton(
                      onPressed: negativeButtonAction ??
                          () => _navigatorKey.currentState!.pop(),
                      child: Text(negativeTextButton),
                  )
                  : const SizedBox.shrink(),
              TextButton(
                  onPressed: positiveButtonAction ??
                      () => _navigatorKey.currentState!.pop(),
                  child: Text(positiveTextButton),
              ),
            ],
          );
        });
  }

  Future<void> showErrorDialog({
    required String content,
    required String textButton,
    Function()? buttonAction,
  }) =>
      _getDialog(
          content: content,
          positiveTextButton: textButton,
          positiveButtonAction: buttonAction,
          isDismissible: false,
      );

  Future<void> showGeneralDialog({
    required String content,
    required String positiveTextButton,
    Function()? positiveButtonAction,
    String? negativeTextButton,
    Function()? negativeButtonAction,
    bool isDismissible = true,
  }) =>
      _getDialog(
          content: content,
          positiveTextButton: positiveTextButton,
          positiveButtonAction: positiveButtonAction,
          negativeTextButton: negativeTextButton,
          negativeButtonAction: negativeButtonAction,
        isDismissible: isDismissible,
      );


  Future<void> showInputDialog({
    required GlobalKey<FormState> formKey,
    required String content,
    required TextEditingController controller,
    required String positiveTextButton,
    Function()? positiveButtonAction,
    String? negativeTextButton,
    Function()? negativeButtonAction,
    bool isDismissible = true,
  }) {
    return showDialog(
        context: _getSafeContext(),
        barrierDismissible: isDismissible,
        builder: (_) {
          return AlertDialog(
          backgroundColor: Colors.purple[50],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(content),
              const SizedBox(height: 20.0),
              Form(
                key: formKey,
                child: TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: 'Enter an activity name...',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(color: Colors.purple),
                    ),
                    focusColor: Colors.purple,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  cursorColor: Colors.purple,
                  validator: (value) => ((value?.length ?? 0) <= 3)
                      ? 'The name must have more than 3 characters'
                      : null,
                ),
              ),
            ],
          ),
            actions: [
              (negativeTextButton != null)
                  ? TextButton(
                      onPressed: negativeButtonAction ??
                          () => _navigatorKey.currentState!.pop(),
                      child: Text(negativeTextButton),
                    )
                  : const SizedBox.shrink(),
              TextButton(
              onPressed: () =>
                  positiveButtonAction?.call() ??
                    () => _navigatorKey.currentState!.pop(),
                child: Text(
                  positiveTextButton,
                  style: const TextStyle(color: Colors.purple),
                ),
              ),
            ],
          );
      },
    );
  }
}
