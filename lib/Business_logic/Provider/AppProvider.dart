import 'dart:convert';

import 'package:flutter/material.dart';

import '../../Data/Modal/products.dart';
import '../../Data/Web_server/webServer.dart';
import '../../Screens/Cart.dart';
import '../../Screens/Cateogries.dart';
import '../../Screens/Home.dart';
import '../../Screens/Profile.dart';

class AppProvider extends ChangeNotifier {
  int CurrentIndex = 0;

  void ChangeBottomNavigationBar(int index) {
    CurrentIndex = index;
    notifyListeners();
  }

  List<Widget> Pages = [
    Home(),
    Cateogries(),
    Profile(),
    Cart(),
  ];
  List<String> text = [
    "Home",
    "Categories",
    "Profile",
    "Cart",
  ];

  product? Product;
  List<Data>? SortData;
  List<Data>? SortReversedData;

  void PostData({required String ProductId}) async {
    WebServer.PostData(
        uri:
            "https://sae-marketing.com/NOON/api/LoadAllProductsOfSpecificProductsType.php",
        data: {
          "ProductsTypeID": ProductId,
        }).then((value) {
      final convert = jsonDecode(value.data);
      Product = product.fromJson(convert);

      SortData = Product!.data;
      SortReversedData = Product!.data;
      for (int i = 0; i < SortData!.length; i++) {
        SortData![i].Sort = int.tryParse(SortData![i].productsOfferPrice!);
        SortReversedData![i].SortReverse =
            int.tryParse(SortReversedData![i].productsOfferPrice!);
      }
      notifyListeners();
    }).catchError((error) {
      print(error.toString());
    });
  }

  void Sorts() {
    SortData!.sort((a, b) {
      return a.Sort!.compareTo(b.Sort!);
    });
  }

  void SortsReversed() {
    SortReversedData!.sort((a, b) {
      return b.SortReverse!.compareTo(a.SortReverse!);
    });
  }

  String? sort;
}
