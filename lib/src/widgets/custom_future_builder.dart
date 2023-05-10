import 'package:flutter/material.dart';

import '../../mock.dart';
import '../models/space_n1_model.dart';
import 'grid_items.dart';

class CustomFutureBuilder extends StatelessWidget {
  const CustomFutureBuilder({
    super.key,
    required this.futureSpaces,
    required this.body,
  });

  final Future<List<SpaceN1Model>> futureSpaces;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return body;
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return CircularProgressIndicator();
      },
      future: futureSpaces,
    );
  }
}
