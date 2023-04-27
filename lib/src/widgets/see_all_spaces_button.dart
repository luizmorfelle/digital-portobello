
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SeeAllSpacesButton extends StatelessWidget {
  const SeeAllSpacesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        icon: const Icon(Icons.compare_arrows),
        onPressed: () => context.push('/all-spaces'),
        label: Text(
          'VER TODOS',
          style: Theme.of(context).textTheme.headlineMedium,
        ));
  }
}
