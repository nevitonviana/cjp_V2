import 'package:flutter/material.dart';

class SaveDialog {
  save({required BuildContext buildContext, required String msg}) {
    showDialog(
      context: buildContext,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 6,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator.adaptive(),
              SizedBox(
                height: 30,
                child: Text(msg),
              )
            ],
          ),
        );
      },
    );
  }
}
