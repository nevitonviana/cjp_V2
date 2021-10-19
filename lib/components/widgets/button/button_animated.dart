import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ButtonAnimated extends StatelessWidget {
  final dynamic controller;
  final double width;
  final String name;

  const ButtonAnimated({
    Key? key,
    required this.controller,
    required this.width,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return AnimatedContainer(
          curve: Curves.easeInCirc,
          duration: const Duration(milliseconds: 600),
          constraints: BoxConstraints.loose(
            Size(width, 40),
          ),
          height: controller.pressed == null ? 0 : 40,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: const Border.fromBorderSide(
              BorderSide(color: Colors.grey),
            ),
          ),
          child: ElevatedButton(
            onPressed: controller.pressed,
            child: controller?.loading
                ? const CircularProgressIndicator(
                    color: Colors.blue,
                  )
                : Text(
                    name,
                    style: const TextStyle(color: Colors.black),
                  ),
          ),
        );
      },
    );
  }
}
