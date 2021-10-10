import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final double? height;
  final void Function(String)? onChanged;
  final String? initialValue;
  final bool obscureText;
  final int maxLines;
  final TextInputType keyboardType;
  final String? errorText;
  final Widget? suffix;
  final String label;
  final String? hintText;
  final Widget? prefixIcon;

  const TextFieldCustom({
    Key? key,
    this.height,
    this.onChanged,
    this.initialValue,
    this.obscureText = false,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.errorText,
    this.suffix,
    required this.label,
    this.hintText,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: height,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(6),
      child: TextFormField(
        onChanged: onChanged,
        initialValue: initialValue,
        obscureText: obscureText,
        maxLines: maxLines,
        style: const TextStyle(color: Colors.black),
        keyboardType: keyboardType,
        decoration: InputDecoration(
          isDense: true,
          errorText: errorText,
          suffix: suffix,
          label: Text(label),
          hintText: hintText,
          prefixIcon: prefixIcon,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
