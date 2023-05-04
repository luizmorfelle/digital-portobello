import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart';

class BaseTechPage extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget child;

  const BaseTechPage(
      {Key? key,
      required this.title,
      required this.child,
      required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(children: [
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.grey[300]),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            subTitle,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: child,
              )
            ],
          ),
        ]),
      ),
    );
  }
}
