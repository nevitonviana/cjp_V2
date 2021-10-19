import 'package:flutter/material.dart';

import '/components/theme/font/fonts.dart';
import '/route_generate.dart';

class MassageDialog {
  save({
    required BuildContext context,
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
                color: Colors.lightBlue.shade100,
                child: const Text(
                  "Obrigado 😁",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 19),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 90,
                child: Text(
                  "Obrigado pelo seu feedback,\n Ele e muito importante para nós ",
                  textAlign: TextAlign.center,
                  style: Fonts.fontsAlfaslabOne,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushReplacementNamed(
                    context, RouteGenerate.routeHome),
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
