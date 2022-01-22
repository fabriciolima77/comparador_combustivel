import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  const CampoTexto({
      Key? key,
      required this.onChanged,
      required this.hintText,
  }): super(key: key);

  final Function(String) onChanged;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      onChanged: onChanged,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.all(10.0),
        hintStyle: TextStyle(color: Colors.grey[600]),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      style: const TextStyle(color: Colors.black),
    );
  }
}
