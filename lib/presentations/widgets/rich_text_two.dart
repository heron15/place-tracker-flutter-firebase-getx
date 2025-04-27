import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RichTextTwo extends StatelessWidget {
  const RichTextTwo({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.firstTextColor,
    required this.secondTextColor,
    required this.firstTextSize,
    required this.secondTextSize,
    required this.firstTextFontWeight,
    required this.secondTextFontWeight,
    this.height,
    this.leftPadding = 0,
    this.rightPadding = 0,
    this.topPadding = 0,
    this.bottomPadding = 0,
    this.textAlign = TextAlign.center,
    this.onTap,
    this.underLineSecondText = TextDecoration.none,
    this.firstTextFontStyle,
    this.secondTextFontStyle,
  });

  final String firstText;
  final String secondText;
  final Color firstTextColor;
  final Color secondTextColor;
  final double firstTextSize;
  final double secondTextSize;
  final FontWeight firstTextFontWeight;
  final FontWeight secondTextFontWeight;
  final FontStyle? firstTextFontStyle;
  final FontStyle? secondTextFontStyle;
  final double? height;
  final double leftPadding;
  final TextDecoration underLineSecondText;
  final double rightPadding;
  final double topPadding;
  final double bottomPadding;
  final TextAlign textAlign;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding, right: rightPadding, top: topPadding, bottom: bottomPadding),
      child: RichText(
        textAlign: textAlign,
        text: TextSpan(
          text: firstText,
          style: TextStyle(
            color: firstTextColor,
            fontWeight: firstTextFontWeight,
            fontSize: firstTextSize,
            fontStyle: firstTextFontStyle,
          ),
          children: [
            TextSpan(
              text: secondText,
              style: TextStyle(
                color: secondTextColor,
                fontWeight: secondTextFontWeight,
                fontSize: secondTextSize,
                height: height,
                decoration: underLineSecondText,
                fontStyle: secondTextFontStyle,
              ),
              recognizer: onTap != null ? (TapGestureRecognizer()..onTap = onTap) : null,
            ),
          ],
        ),
      ),
    );
  }
}
