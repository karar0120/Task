class categories {
  int? statusCode;
  bool? success;
  List<Data>? data;
  dynamic? message;


  categories({this.statusCode, this.success, this.data, this.message});
  categories.fromJson(Map<String,dynamic> json) {
    statusCode = json['status_code'];
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message']as String ;
  }
}

class Data {
  String? productsTypeID;
  String? productsTypeImage;
  String? productsTypeNameArabic;
  String? productsTypeNameAbri;
  String? productsTypeNameEnglish;
  String? productsTypeNameRussian;
  String? productsTypeStatus;
  String? loadInHomePage;
  String? productsTypeDiscription;
  String? lastUpdated;
  String? createdAtProductsTyps;

  Data.fromJson(Map<String, dynamic> json) {
    productsTypeID = json['ProductsTypeID'] ;
    productsTypeImage = json['ProductsTypeImage'];
    productsTypeNameArabic = json['ProductsTypeNameArabic'];
    productsTypeNameAbri = json['ProductsTypeNameAbri'];
    productsTypeNameEnglish = json['ProductsTypeNameEnglish'];
    productsTypeNameRussian = json['ProductsTypeNameRussian'];
    productsTypeStatus = json['ProductsTypeStatus'];
    loadInHomePage = json['LoadInHomePage'];
    productsTypeDiscription = json['ProductsTypeDiscription'];
    lastUpdated = json['lastUpdated'];
    createdAtProductsTyps = json['CreatedAtProductsTyps'];
  }

}