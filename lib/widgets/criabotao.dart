import 'package:flutter/material.dart';

class CriaBotao extends StatelessWidget {
  const CriaBotao({
      Key? key,
      required this.hintText,
      required this.onPressed,
      required this.left,
      required this.top,
      required this.right,
      required this.bottom}) : super(key: key);

  final String hintText;
  final VoidCallback? onPressed;
  final double left;
  final double top;
  final double right;
  final double bottom;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(hintText,
        style: const TextStyle(
            fontSize: 18,
            color: Colors.black),),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.yellow,
        padding: EdgeInsets.fromLTRB(left, top, right, bottom),
        textStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }
}