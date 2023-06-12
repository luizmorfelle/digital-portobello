import 'package:digital_portobello/constants.dart';
import 'package:digital_portobello/src/models/dropdown_model.dart';
import 'package:flutter/material.dart';

class SalesChannelProvider extends ChangeNotifier {
  DropDownModel saleChannel = salesChannels[0];

  DropDownModel get getSaleChannel {
    return saleChannel;
  }

  void setSaleChannel(DropDownModel saleChannel) {
    this.saleChannel = saleChannel;
    notifyListeners();
  }
}
