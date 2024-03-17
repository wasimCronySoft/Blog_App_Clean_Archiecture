import 'package:flutter/material.dart';

showLoadingIndicator(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return const AlertDialog.adaptive(
        title: Text("Loading"),
        content: CircularProgressIndicator.adaptive(),
      );
    },
  );
}
