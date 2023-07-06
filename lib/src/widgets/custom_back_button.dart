import 'package:digital_portobello/src/utils/translate.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[300],
        minimumSize: const Size(100, 50),
        side: const BorderSide(color: Colors.black, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      icon: const Icon(Icons.arrow_back, color: Colors.black, size: 30),
      label: Text(
        tl('back', context),
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),
      onPressed: () => context.pop(),
    );
  }
}
