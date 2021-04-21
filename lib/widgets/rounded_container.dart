import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Color textColor;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Widget child;
  EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final BoxBorder border;
  final List<BoxShadow> boxShadow;
  BorderRadiusGeometry borderRadius;

  RoundedContainer({
    this.margin = const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    this.width,
    this.height,
    this.color,
    this.text,
    this.padding,
    this.textColor,
    this.fontSize,
    this.borderRadius= const BorderRadius.all(Radius.circular(5)),
    this.fontWeight,
    this.child,
    this.boxShadow,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color,
          boxShadow: boxShadow,
          border: border,

          borderRadius: borderRadius
      ),
      child: child,
    );
  }
}
