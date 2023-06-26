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
                  '${e.codProduto}${e.sufixo} - ${e.linha} - ${e.descProduto} - ${e.descFormatoNominal} - ${e.acabamentoDeBorda}')
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
        : AutoCompleteTextField<String>(
            key: key,
            suggestions: suggestions!,
            textInputAction: TextInputAction.search,
            suggestionsAmount: 10,
            controller: widget.controller,
            submitOnSuggestionTap: true,
            itemSubmitted: (value) => context.pop(),
            textChanged: widget.onChanged,
            inputFormatters: [UpperCaseTextFormatter()],
            textCapitalization: TextCapitalization.characters,
            itemSorter: (a, b) => a.compareTo(b),
            itemFilter: (suggestion, input) =>
                suggestion.toUpperCase().contains(input.toUpperCase()),
            style: const TextStyle(color: Colors.white),
            cursorColor: Colors.white,
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
                hintStyle: const TextStyle(color: Colors.white, fontSize: 20),
                hintText: tl('search', context)),
            itemBuilder: (BuildContext context, String suggestion) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(suggestion),
              );
            },
          );
  }
}
