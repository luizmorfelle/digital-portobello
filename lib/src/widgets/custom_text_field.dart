import 'package:digital_portobello/src/utils/uppercase_text_formatter.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String value)? onChanged;
  const CustomTextField({super.key, this.onChanged, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        inputFormatters: [UpperCaseTextFormatter()],
        textCapitalization: TextCapitalization.characters,
        onChanged: onChanged,
        decoration: const InputDecoration(
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            filled: true,
            fillColor: Colors.grey,
            suffixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            hintStyle: TextStyle(color: Colors.white, fontSize: 20),
            hintText: 'Buscar'));
  }
}
