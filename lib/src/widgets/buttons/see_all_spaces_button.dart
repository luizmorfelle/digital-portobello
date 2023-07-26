import 'package:digital_portobello/src/utils/translate.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SeeAllSpacesButton extends StatelessWidget {
  const SeeAllSpacesButton({super.key, this.surfaceId});

  final String? surfaceId;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        icon: const Icon(Icons.compare_arrows),
        onPressed: () => context.push('/all-spaces/$surfaceId'),
        label: Text(
          tl('see_all', context),
          style: Theme.of(context).textTheme.headlineMedium,
        ));
  }
}
