import 'package:digital_portobello/src/models/dropdown_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomMultiSelect extends StatefulWidget {
  final List<DropDownModel> items;
  final DropDownModel value;
  final List<DropDownModel> selecteds;
  final void Function(DropDownModel? value)? onChange;
  const CustomMultiSelect({
    Key? key,
    required this.items,
    required this.value,
    required this.selecteds,
    required this.onChange,
  }) : super(key: key);

  @override
  State<CustomMultiSelect> createState() => _CustomMultiSelectState();
}

class _CustomMultiSelectState extends State<CustomMultiSelect> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        items: widget.items
            .map((item) => DropdownMenuItem<String>(
                  value: item.value,
                  onTap: () => widget.onChange!(item),
                  child: Row(
                    children: [
                      Checkbox(
                          value: widget.selecteds.contains(item),
                          onChanged: (e) {
                            widget.onChange!(item);
                            setState(() {});
                          }),
                      Text(
                        item.value,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ))
            .toList(),
        value: null,
        customButton: const Text('aaa'),
        onChanged: (_) {},
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
