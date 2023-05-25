import 'package:digital_portobello/src/models/breadcrumb_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';
import 'package:go_router/go_router.dart';

class CustomBreadCrumb extends StatelessWidget {
  final List<BreadCrumbItemModel> items;
  const CustomBreadCrumb({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return BreadCrumb(
      items: items
          .map(
            (item) => BreadCrumbItem(
              content: Text(
                item.name!,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              onTap:
                  item.path!.isNotEmpty ? () => context.push(item.path!) : null,
            ),
          )
          .toList(),
      divider: const Icon(Icons.chevron_right),
    );
  }
}
