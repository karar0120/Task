import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noon/Data/Web_server/webServer.dart';
import 'package:noon/Screens/Cateogries.dart';

import '../../Data/Modal/categoriesModal.dart';
import '../../Data/Modal/products.dart';
import '../../Screens/Cart.dart';
import '../../Screens/Home.dart';
import '../../Screens/Profile.dart';
import 'App_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(initialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  int CurrentIndex = 0;

  void ChangeBottomNavigationBar(int index) {
    CurrentIndex = index;
    emit(changeBottomNavigationBar());
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

 late categories Categories;

  void GetdataFormApi() async {
    emit(GetDataLoadingState());
    WebServer.getdate(
            url:
                "https://sae-marketing.com/NOON/api/LoadProductsTypeCategoriesPage.php")
        .then((value) {
      final convert = jsonDecode(value.data);
      Categories = categories.fromJson(convert);
      emit(GetDataEnterState());
    }).catchError((error) {
      emit(GetDataErrorState(error: error));
    });
  }

 late product Product;

  void PostData({required String ProductId}) async {
    emit(PostDataLoadingState());
    WebServer.PostData(
        uri:
            "https://sae-marketing.com/NOON/api/LoadAllProductsOfSpecificProductsType.php",
        data: {
          "ProductsTypeID": ProductId,
        }).then((value) {
      final convert = jsonDecode(value.data);
      Product = product.fromJson(convert);
      emit(PostDataEnterState(Proudacts: Product));
    }).catchError((error) {
      print(error.toString());
      emit(PostDataErrorState(erorr: error.toString()));
    });
  }
}
