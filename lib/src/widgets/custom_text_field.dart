import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextField(
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            focusedBorder:
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
