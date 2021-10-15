import 'package:flutter/material.dart';

class ErrorDialog {
  error({required BuildContext context, required String error}) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.center,
                height: 40,
                width: double.infinity,
                color: Colors.red,
                child: const Text(
                  "ERROR",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 90,
                child: Text(
                  error,
                  textAlign: TextAlign.center,
                ),
              ),
              GestureDetector(
                onTap: Navigator.of(context).pop,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  alignment: Alignment.bottomRight,
                  child: const Text(
                    "OK",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
