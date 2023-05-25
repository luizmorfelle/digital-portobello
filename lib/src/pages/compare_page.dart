import 'package:digital_portobello/src/models/breadcrumb_item_model.dart';
import 'package:digital_portobello/src/models/product_model.dart';
import 'package:digital_portobello/src/providers/favorite_provider.dart';
import 'package:digital_portobello/src/widgets/custom_app_bar.dart';
import 'package:digital_portobello/src/widgets/custom_back_button.dart';
import 'package:digital_portobello/src/widgets/custom_breadcrumb.dart';
import 'package:digital_portobello/src/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ComparePage extends StatefulWidget {
  const ComparePage({Key? key}) : super(key: key);

  @override
  State<ComparePage> createState() => _ComparePageState();
}

class _ComparePageState extends State<ComparePage> {
  late List<ProductModel> products;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    products = Provider.of<FavoriteProvider>(context).getFavoriteProducts;

    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.grey[300]),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.compare_arrows),
                          Text(
                            'COMPARAÇÃO',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      ),
                      Text('Você está comparando ${products.length} produtos!')
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [CustomBackButton()],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                var produto = products[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    width: 400,
                    height: 800,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: SizedBox(
                                  height: 100,
                                  child: Image.asset(
                                    'assets/images${produto.zoomImage!}',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${produto.linha!} - ${produto.descProduto}",
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  CustomBreadCrumb(items: [
                                    BreadCrumbItemModel(name: 'Piso', path: ''),
                                    BreadCrumbItemModel(
                                        name: 'Residencial', path: ''),
                                    BreadCrumbItemModel(
                                        name: 'Banheiro', path: ''),
                                  ])
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: ListView.builder(
                                    itemCount: produto.toJson().keys.length,
                                    itemExtent: 70,
                                    itemBuilder: (_, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                produto
                                                    .toJson()
                                                    .keys
                                                    .toList()[index],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium),
                                            Text(
                                                produto
                                                    .toJson()
                                                    .values
                                                    .toList()[index]!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge),
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                              ElevatedButton.icon(
                                  onPressed: () {
                                    Provider.of<FavoriteProvider>(context,
                                            listen: false)
                                        .removeFavoriteProduct(produto);
                                  },
                                  icon: const Icon(Icons.delete),
                                  label: const Text('Excluir'))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
