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
        minimumSize: Size(100, 50),
        side: BorderSide(color: Colors.black, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      icon: Icon(Icons.arrow_back_rounded, color: Colors.black, size: 30),
      label: Text(
        'Voltar',
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),
      onPressed: () => context.pop(),
    );
  }
}
