import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommontText extends StatelessWidget {
  const CommontText({super.key, required this.text, required this.fSize, required this.fweight, this.color, this.letterspace, this.wordspace, this.textDecoration,});

  final String text;
  final double fSize;
  final FontWeight fweight;
  final Color ? color;
  final double ? letterspace;
  final double ? wordspace;
  final TextDecoration ? textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
        fontSize: fSize,
        fontWeight: fweight,
        fontFamily: "Poppins",
        color: color,
        letterSpacing: letterspace,
        wordSpacing: wordspace,
        decoration: textDecoration,
        decorationColor:color,
        fontStyle: FontStyle.normal
      ),
    );
  }
}
