import 'package:cjp_v2/components/theme/font/fonts.dart';
import 'package:cjp_v2/route_generate.dart';
import 'package:flutter/material.dart';

class MassageDialog {
  save({required BuildContext context, required String error}) async {
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
                color: Colors.cyanAccent,
                child: const Text(
                  "Obrigado 😁",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 90,
                child: Text(
                  "Obrigado pelo seu feedback, Ele e muito importante para nós ",
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
