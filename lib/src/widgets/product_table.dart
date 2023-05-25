import 'package:digital_portobello/src/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductTable extends StatelessWidget {
  final ProductModel product;
  const ProductTable({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    List<TableRow> rows = [];
    rows.add(TableRow(
        decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.vertical(top: Radius.circular(3))),
        children: [
          TableCell(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Informações Técnicas',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          )),
          TableCell(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          )),
        ]));
    var cont = 0;
    product.toJsonTableProduct().entries.forEach((mapJson) {
      rows.add(TableRow(
        decoration: BoxDecoration(
            color: cont % 2 == 0 ? Colors.white : Colors.grey[400]),
        children: [
          TableCell(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              mapJson.key,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          )),
          TableCell(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              mapJson.value.toString(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          )),
        ],
      ));
      cont += 1;
    });

    return Table(
      columnWidths: const {
        0: FractionColumnWidth(.8),
        1: FractionColumnWidth(.2),
      },
      children: rows,
    );
  }
}
