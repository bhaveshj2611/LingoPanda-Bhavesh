import 'package:flutter/material.dart';

Widget buildTextField({
  required String label,
  bool isPassword = false,
  TextEditingController? controller,
  String? Function(String?)? validator,
  TextInputType keyboardType = TextInputType.text,
}) {
  return TextFormField(
    controller: controller,
    obscureText: isPassword,
    validator: validator,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.black),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: Colors.white,
      errorStyle: const TextStyle(
        color: Colors.red,
        fontSize: 12,
      ),
    ),
    style: const TextStyle(
      color: Colors.black,
    ),
  );
}
