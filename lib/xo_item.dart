import 'package:flutter/material.dart';

// ignore: must_be_immutable
class XOItem extends StatelessWidget {
  String text;
  Color textColor;
  int position;
  Function onClick;
  static Color borderColor = const Color(0xFFE8E9E9);
  BoxBorder itemBorder;

  XOItem(this.text, this.position, this.onClick,
      {this.itemBorder = const Border(),
      this.textColor = Colors.white,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick(text, position);
      },
      child: Container(
        decoration: BoxDecoration(border: itemBorder),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
              fontSize: 50, color: textColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
