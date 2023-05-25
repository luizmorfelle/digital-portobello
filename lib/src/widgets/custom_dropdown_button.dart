import 'package:digital_portobello/src/models/dropdown_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropdownButton extends StatelessWidget {
  final List<DropDownModel> items;
  final DropDownModel value;
  final void Function(DropDownModel? value)? onChange;
  const CustomDropdownButton({
    Key? key,
    required this.items,
    required this.value,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<DropDownModel>(
        isExpanded: true,
        hint: Text(
          value?.value ?? "",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        items: items
            .map((item) => DropdownMenuItem<DropDownModel>(
                  value: item,
                  child: Text(
                    item.value,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        value: value,
        onChanged: onChange,
        buttonStyleData: ButtonStyleData(
          height: 50,
          width: 160,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(
              color: Colors.black26,
            ),
            color: Colors.white,
          ),
          elevation: 2,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          width: 200,
          padding: null,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),
          elevation: 8,
          offset: const Offset(-20, 0),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}
