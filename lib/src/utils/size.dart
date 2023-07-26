import 'package:flutter/material.dart';

bool isSmall(BuildContext context) {
  return MediaQuery.of(context).size.width < 768;
}
