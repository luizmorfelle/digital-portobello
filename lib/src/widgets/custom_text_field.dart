import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:digital_portobello/src/controllers/products_controller.dart';
import 'package:digital_portobello/src/utils/translate.dart';
import 'package:digital_portobello/src/utils/uppercase_text_formatter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final Function(String value)? onChanged;
  final Function(String value)? onSubmitted;
  const CustomTextField(
      {super.key,
      this.onChanged,
      this.controller,
      this.suggestions,
      this.onSubmitted});

  final List<String>? suggestions;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  List<String>? suggestions;
  final GlobalKey<AutoCompleteTextFieldState<String>> key =
      GlobalKey<AutoCompleteTextFieldState<String>>();

  @override
  void initState() {
    super.initState();
    if (widget.suggestions == null) {
      fetchProducts().then((value) {
        setState(() {
          suggestions = value
              .map((e) =>
                  '${e.id} - ${e.codProduto}${e.sufixo} - ${e.linha} - ${e.descProduto} - ${e.descFormatoNominal} - ${e.acabamentoDeBorda}')
              .toList();
        });
      });
    } else {
      setState(() {
        suggestions = widget.suggestions!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return suggestions == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : RawAutocomplete(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == '' ||
                  textEditingValue.text.length < 3) {
                return const Iterable<String>.empty();
              } else {
                List<String> matches = <String>[];
                matches.addAll(suggestions!);

                matches.retainWhere((s) {
                  return s
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase());
                });
                return matches;
              }
            },
            onSelected: (String selection) {
              widget.onSubmitted!(selection);
            },
            fieldViewBuilder: (BuildContext context,
                TextEditingController textEditingController,
                FocusNode focusNode,
                VoidCallback onFieldSubmitted) {
              return TextField(
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
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintStyle:
                        const TextStyle(color: Colors.white, fontSize: 20),
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
                        return InkWell(
                          onTap: () {
                            onSelected(opt);
                          },
                          child: Container(
                            padding: const EdgeInsets.only(right: 60),
                            child: Card(
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                child: Text(opt),
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
