import 'package:flutter/material.dart';

class EmailDialog {
  success({
    required BuildContext context,
    required String massage,
    required String title,
    VoidCallback? route,
  }) async {
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
                color: Colors.blueGrey,
                child: Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 90,
                child: Text(
                  massage,
                  textAlign: TextAlign.center,
                ),
              ),
              GestureDetector(
                onTap: route != null ? route : Navigator.of(context).pop,
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
