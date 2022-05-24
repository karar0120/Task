import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:noon/Business_logic/Provider/AppProvider.dart';
import 'package:noon/Data/Web_server/webServer.dart';

import '../../Data/Modal/categoriesModal.dart';
import '../../Data/Modal/products.dart';

class ProductProvider extends ChangeNotifier {
  categories? Categories;

  void GetdataFormApi() async {
    WebServer.getdate(
        url:
        "https://sae-marketing.com/NOON/api/LoadProductsTypeCategoriesPage.php")
        .then((value) {
      final convert = jsonDecode(value.data);
      Categories = categories.fromJson(convert);
      notifyListeners();
    }).catchError((error) {
      // notifyListeners();
    });
  }

}
