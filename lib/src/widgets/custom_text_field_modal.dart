import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:digital_portobello/src/controllers/products_controller.dart';
import 'package:digital_portobello/src/models/product_model.dart';
import 'package:digital_portobello/src/utils/translate.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomTextFieldModal extends StatefulWidget {
  final TextEditingController? controller;
  final Function(String value)? onChanged;
  final Function(String value)? onSubmitted;
  final FocusNode focusNode;
  const CustomTextFieldModal(
      {super.key,
      this.onChanged,
      this.controller,
      this.suggestions,
      this.onSubmitted,
      required this.focusNode});

  final List<String>? suggestions;
  @override
  State<CustomTextFieldModal> createState() => _CustomTextFieldModalState();
}

class _CustomTextFieldModalState extends State<CustomTextFieldModal> {
  List<String>? suggestions;
  List<ProductModel>? products;
  final GlobalKey<AutoCompleteTextFieldState<String>> key =
      GlobalKey<AutoCompleteTextFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete(
      textEditingController: widget.controller,
      focusNode: widget.focusNode,
      optionsBuilder: (TextEditingValue textEditingValue) async {
        if (textEditingValue.text == '' || textEditingValue.text.length < 3) {
          return const Iterable<String>.empty();
        } else {
          List<ProductModel> matches = <ProductModel>[];
          await fetchProducts(filters: [
            {
              'field': 'desc_produto',
              'value': "%${textEditingValue.text}%",
              'operator': 'like',
              'joinOperator': 'or'
            },
            {
              'field': 'cod_produto',
              'value': "%${textEditingValue.text}%",
              'operator': 'like',
              'joinOperator': 'or'
            },
            {
              'field': 'linha',
              'value': "%${textEditingValue.text}%",
              'operator': 'like',
              'joinOperator': 'or'
            },
            {
              'field': 'desc_formato_nominal',
              'value': "%${textEditingValue.text}%",
              'operator': 'like',
              'joinOperator': 'or'
            },
            {
              'field': 'acabamento_de_borda',
              'value': "%${textEditingValue.text}%",
              'operator': 'like',
              'joinOperator': 'and'
            },
          ]).then((value) => matches = value);
          // matches.addAll(suggestions!);
          setState(() {
            products = matches;
          });
          return matches.map((e) => '${e.codProduto}${e.sufixo}');
        }
      },
      onSelected: (String selection) {
        context.push('/product/${selection.split('-')[0].trim()}');
      },
      fieldViewBuilder: (BuildContext context,
          TextEditingController textEditingController,
          FocusNode focusNode,
          VoidCallback onFieldSubmitted) {
        return TextField(
          style: const TextStyle(color: Colors.white, fontSize: 20),
          decoration: InputDecoration(
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              filled: true,
              fillColor: Colors.grey,
              suffixIcon: GestureDetector(
                child: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
              hintStyle: const TextStyle(color: Colors.white, fontSize: 20),
              hintText: tl('search', context)),
          controller: textEditingController,
          focusNode: focusNode,
          onSubmitted: (String value) {},
        );
      },
      optionsViewBuilder: (BuildContext context,
          void Function(String) onSelected, Iterable<String> options) {
        return Material(
          child: SizedBox(
            height: 200,
            child: SingleChildScrollView(
              child: Column(
                children: options.map((opt) {
                  var product = products!.firstWhere((element) =>
                      '${element.codProduto}${element.sufixo}' == opt);
                  return InkWell(
                    onTap: () {
                      onSelected(product.id);
                    },
                    child: Container(
                      padding: const EdgeInsets.only(right: 60),
                      child: Card(
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Image.asset(
                                '${product.imagem}',
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                  '${product.codProduto}${product.sufixo} - ${product.linha} - ${product.descProduto} - ${product.descFormatoNominal} - ${product.acabamentoDeBorda}'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
