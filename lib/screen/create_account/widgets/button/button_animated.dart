import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../controller/account_controller.dart';

class ButtonAnimated extends StatelessWidget {
  final AccountController accountController;
  final double width;

  const ButtonAnimated({
    Key? key,
    required this.accountController,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        duration: const Duration(milliseconds: 600),
        constraints: BoxConstraints.loose(
          Size(width, 40),
        ),
        height: accountController.loginPressed == null ? 0 : 40,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: const Border.fromBorderSide(
            BorderSide(color: Colors.grey),
          ),
        ),
        child: ElevatedButton(
          onPressed: accountController.loginPressed,
          child: accountController.loading
              ? const CircularProgressIndicator(
                  color: Colors.blue,
                )
              : const Text(
                  "Cadastrar-se",
                  style: TextStyle(color: Colors.black),
                ),
        ),
      );
    });
  }
}