import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '/components/theme/font/fonts.dart';

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
        return GestureDetector(
          onTap: controller.pressed,
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            elevation: 3,
            child: AnimatedContainer(
              alignment: Alignment.center,
              curve: Curves.easeInCirc,
              duration: const Duration(milliseconds: 600),
              constraints: BoxConstraints.loose(
                Size(width, 40),
              ),
              height: controller.pressed == null ? 0 : 55,
              width: controller.loading ? 50 : width,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(controller.loading ? 100 : 6),
                border: const Border.fromBorderSide(
                  BorderSide(color: Colors.grey),
                ),
                color: Colors.grey[400],
              ),
              child: AnimatedCrossFade(
                firstChild: Text(
                  name,
                  style: Fonts.fontsRoboto,
                ),
                secondChild: const CircularProgressIndicator(
                  color: Colors.blue,
                ),
                crossFadeState: controller.loading
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 600),
              ),
            ),
          ),
        );
      },
    );
  }
}
