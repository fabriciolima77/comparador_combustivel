import 'package:flutter/material.dart';

class CampoTextoValidate extends StatelessWidget {
  const CampoTextoValidate({
    Key? key,
    required this.onChanged,
    required this.controller,
    required this.hintText,
    required this.validator,
  }) : super(key: key);

  final Function(String?) onChanged;
  final TextEditingController controller;
  final String hintText;
  final String? validator;

  @override
  Widget build(BuildContext context) {
      return TextFormField(
        onChanged: onChanged,
        keyboardType: TextInputType.number,
        validator: (value) => validator,
        maxLines: 1,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.all(10.0),
          hintStyle: TextStyle(color: Colors.grey[600]),
          filled: true,
          fillColor: Colors.white,
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.redAccent),
            borderRadius: BorderRadius.circular(8),
          ),
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
