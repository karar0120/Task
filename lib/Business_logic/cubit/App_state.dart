import 'package:noon/Data/Modal/products.dart';

abstract class HomeState {}

class initialState extends HomeState {}

class changeBottomNavigationBar extends HomeState {}

class GetDataLoadingState extends HomeState {}

class GetDataEnterState extends HomeState {}

class GetDataErrorState extends HomeState {
  final  error;

  GetDataErrorState({this.error});
}

class PostDataEnterState extends HomeState {
  final  product? Proudacts;

  PostDataEnterState({ this.Proudacts});
}

class PostDataLoadingState extends HomeState {}

class PostDataErrorState extends HomeState {
  final erorr;

  PostDataErrorState({this.erorr});
}
