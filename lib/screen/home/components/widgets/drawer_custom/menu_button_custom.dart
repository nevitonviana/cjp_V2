import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';

class MenuButtonCustom extends StatelessWidget {
  final String text;
  final dynamic icons;
  final Function()? onTap;

  const MenuButtonCustom(
      {Key? key, required this.text, required this.icons, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      curve: Curves.slowMiddle,
      direction: AnimatedCardDirection.left,
      duration: const Duration(seconds: 2),
      child: Container(
        margin: const EdgeInsets.all(11),
        child: ListTile(
          onTap: onTap,
          title: Text(
            text,
          ),
          leading: Icon(
            icons,
            color: Colors.black87,
          ),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
