import 'package:flutter/material.dart';

class TextAnimated extends StatelessWidget {
  final String text;
  final Animation<double> animation;

  const TextAnimated({
    Key? key,
    required this.text,
    required this.animation,
  }) : super(key: key);
  final _commonColor = Colors.white;
  final _fontSizeCommon = 18.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return SizedBox(
            height: 20,
            width: animation.value,
            child: Text(
              text,
              style: TextStyle(
                color: _commonColor,
                fontSize: _fontSizeCommon,
              ),
            ),
          );
        },
      ),
    );
  }
}
