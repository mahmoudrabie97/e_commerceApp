import 'package:flutter/material.dart';

class CustomSearchingWidget extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;

  final IconData? perfixicon;

  const CustomSearchingWidget({
    super.key,
    this.validator,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.perfixicon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextFormField(
        style: const TextStyle(
          backgroundColor: Color(0xffFFFFFF),
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusColor: Colors.white,
          prefixIcon: perfixicon != null ? Icon(perfixicon) : null,
        ),
        validator: validator!,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
      ),
    );
  }
}
