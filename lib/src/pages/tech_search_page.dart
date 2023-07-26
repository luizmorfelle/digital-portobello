import 'package:auto_size_text/auto_size_text.dart';
import 'package:digital_portobello/src/pages/list_groups_product_page.dart';
import 'package:digital_portobello/src/utils/size.dart';
import 'package:digital_portobello/src/widgets/buttons/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../utils/fields_tech_search.dart';
import '../utils/translate.dart';
import 'base_tech_page.dart';

class TechSearchPage extends StatefulWidget {
  const TechSearchPage({Key? key}) : super(key: key);

  @override
  TechSearchPageState createState() => TechSearchPageState();
}

class TechSearchPageState extends State<TechSearchPage> {
  @override
  Widget build(BuildContext context) {
    return BaseTechPage(
      title: tl('advanced_search', context).split(' ')[0],
      subTitle: tl('advanced_search', context).split(' ')[1],
      child: Column(
        children: [
          Wrap(
            runAlignment: WrapAlignment.spaceBetween,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  tl('select_filters', context),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              if (!isSmall(context)) const CustomBackButton()
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ExpansionPanelList.radio(
            dividerColor: Colors.black,
            children: fieldsTechSearch
                .map((field) => ExpansionPanelRadio(
                    backgroundColor: Colors.grey[200],
                    value: field.id,
                    canTapOnHeader: true,
                    headerBuilder: (context, isExpanded) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width /
                                                1.7),
                                    child: AutoSizeText(
                                        tl(field.title, context),
                                        maxLines: 2,
                                        maxFontSize: 19,
                                        minFontSize: 13,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  if (field.description != null)
                                    Tooltip(
                                      message: tl(field.description!, context),
                                      triggerMode: TooltipTriggerMode.tap,
                                      child: const Icon(
                                        Icons.info,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    )
                                ],
                              ),
                              if (!isSmall(context))
                                Text(
                                  field.itens
                                      .where((it) => it.checked)
                                      .map((e) => e.label)
                                      .toSet()
                                      .join(', '),
                                  style: Theme.of(context).textTheme.bodyLarge,
                                )
                            ],
                          ),
                        ),
                    body: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: field.type == 'checkbox'
                          ? Wrap(
                              alignment: WrapAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              spacing: 10,
                              children: field.itens
                                  .map(
                                    (it) => CheckboxMenuButton(
                                        value: it.checked,
                                        onChanged: (event) {
                                          setState(() {
                                            it.checked = event!;
                                          });
                                        },
                                        child: Text(tl(it.label, context))),
                                  )
                                  .toList(),
                            )
                          : field.type == 'range'
                              ? Column(
                                  children: [
                                    RangeSlider(
                                      divisions: field.itens.length - 1,
                                      min: 0,
                                      max: field.itens.length - 1,
                                      labels: RangeLabels(
                                          field
                                              .itens[
                                                  field.indexValuesApi?.item1 ??
                                                      0]
                                              .label,
                                          field
                                              .itens[
                                                  field.indexValuesApi?.item2 ??
                                                      field.itens.length - 1]
                                              .label),
                                      values: RangeValues(
                                          field.indexValuesApi?.item1
                                                  .toDouble() ??
                                              0.0,
                                          field.indexValuesApi?.item2
                                                  .toDouble() ??
                                              field.itens.length - 1),
                                      onChanged: (value) {
                                        setState(() {
                                          field.indexValuesApi = Tuple2(
                                            value.start.toInt(),
                                            value.end.toInt(),
                                          );
                                        });
                                      },
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: field.itens
                                          .map(
                                            (e) => Text(
                                              e.label,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium,
                                            ),
                                          )
                                          .toList(),
                                    )
                                  ],
                                )
                              : Column(
                                  children: [
                                    Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Slider.adaptive(
                                        divisions: field.itens.length - 1,
                                        value:
                                            field.indexField?.toDouble() ?? 0.0,
                                        onChanged: (value) {
                                          setState(() {
                                            field.indexField = value.toInt();
                                          });
                                        },
                                        label: field
                                            .itens[field.indexField ?? 0].label,
                                        min: 0,
                                        max: field.itens.length - 1,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: field.itens
                                            .map(
                                              (e) => Text(
                                                e.label,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium,
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    )
                                  ],
                                ),
                    )))
                .toList(),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.clear),
                label: Text(tl('reset_filter', context)),
                onPressed: () => setState(() {
                  for (var field in fieldsTechSearch) {
                    for (var item in field.itens) {
                      item.checked = false;
                    }
                  }
                }),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.search),
                label: Text(tl('search', context)),
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListGroupsProductPage(
                            fieldsTechSearch: fieldsTechSearch),
                      ))
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
