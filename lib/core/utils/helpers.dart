import 'package:flutter/material.dart';

/// does... nothing ;)
T? doNothing<T>() {
  return null;
}

/// shows dialog with "not implemented" message. its var so that it can be replaced for tests
void Function({required BuildContext context, String? message}) notImplemented =
    ({String? message, BuildContext? context}) {
  showDialog(
    context: context!,
    builder: (context) => AlertDialog(
      title: const Text('Not implemented'),
      content: Text(message ?? "This feature is not yet implemented"),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('OK'),
        ),
      ],
    ),
  );
};

/// method that allows suppressing the `unused-code` metric
/// https://github.com/dart-code-checker/dart-code-metrics/pull/929
void suppressUnusedCodeWarning(dynamic anything) => doNothing();
