import 'dart:convert';

import 'package:flutter/material.dart';

import '../../Data/Modal/categoriesModal.dart';
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

  product? Product;

  void PostData({required String ProductId}) async {
    WebServer.PostData(
        uri:
            "https://sae-marketing.com/NOON/api/LoadAllProductsOfSpecificProductsType.php",
        data: {
          "ProductsTypeID": ProductId,
        }).then((value) {
      final convert = jsonDecode(value.data);
      Product = product.fromJson(convert);
      notifyListeners();
    }).catchError((error) {
      print(error.toString());
    });
  }
}
