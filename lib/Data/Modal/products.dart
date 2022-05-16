class product {
  int? statusCode;
  bool? success;
  List<Data>? data;
  String? message;

  product({this.statusCode, this.success, this.data, this.message});

  product.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

}

class Data {
  String? s0;
  String? s1;
  String? productsID;
  String? sellerID;
  String? productsName;
  String? productsPrice;
  String? productsOfferPrice;
  String? currencyID;
  String? productsStatus;
  String? productsDescription;
  String? productsWordsToSearch;
  String? productsBarcode;
  String? productsTypeID;
  String? subCategoryId;
  String? productsInsuranceCompany;
  String? productsInsuranceDuration;
  String? productsQuantity;
  String? productsFirstImage;
  String? productsSecondImage;
  String? productsThirdImage;
  String? productsFourthmage;
  String? productsFifthImage;
  String? dealsOfToday;
  String? productRate;
  String? productTotalRates;
  String? productTotalNum;
  String? lastUpdated;
  String? createdAtProducts;
  String? productsTypeImage;
  String? productsTypeNameArabic;
  String? productsTypeNameAbri;
  String? productsTypeNameEnglish;
  String? productsTypeNameRussian;
  String? productsTypeStatus;
  String? loadInHomePage;
  String? productsTypeDiscription;
  String? createdAtProductsTyps;
  String? sellerFirstName;
  String? sellerLastName;
  String? sellerEmail;
  String? sellerPassword;
  String? sellerCountryID;
  String? sellerStoreName;
  String? sellerCompanyLegelName;
  String? sellerCompanyPhoneNumber;



  Data.fromJson(Map<String, dynamic> json) {
    s0 = json['0'];
    s1 = json['1'];
    productsID = json['ProductsID'];
    sellerID = json['SellerID'];
    productsName = json['ProductsName'];
    productsPrice = json['ProductsPrice'];
    productsOfferPrice = json['ProductsOfferPrice'];
    currencyID = json['CurrencyID'];
    productsStatus = json['ProductsStatus'];
    productsDescription = json['ProductsDescription'];
    productsWordsToSearch = json['ProductsWordsToSearch'];
    productsBarcode = json['ProductsBarcode'];
    productsTypeID = json['ProductsTypeID'];
    subCategoryId = json['SubCategoryId'];
    productsInsuranceCompany = json['ProductsInsuranceCompany'];
    productsInsuranceDuration = json['ProductsInsuranceDuration'];
    productsQuantity = json['ProductsQuantity'];
    productsFirstImage = json['ProductsFirstImage'];
    productsSecondImage = json['ProductsSecondImage'];
    productsThirdImage = json['ProductsThirdImage'];
    productsFourthmage = json['ProductsFourthmage'];
    productsFifthImage = json['ProductsFifthImage'];
    dealsOfToday = json['DealsOfToday'];
    productRate = json['ProductRate'];
    productTotalRates = json['ProductTotalRates'];
    productTotalNum = json['ProductTotalNum'];
    lastUpdated = json['lastUpdated'];
    createdAtProducts = json['CreatedAtProducts'];
    productsTypeImage = json['ProductsTypeImage'];
    productsTypeNameArabic = json['ProductsTypeNameArabic'];
    productsTypeNameAbri = json['ProductsTypeNameAbri'];
    productsTypeNameEnglish = json['ProductsTypeNameEnglish'];
    productsTypeNameRussian = json['ProductsTypeNameRussian'];
    productsTypeStatus = json['ProductsTypeStatus'];
    loadInHomePage = json['LoadInHomePage'];
    productsTypeDiscription = json['ProductsTypeDiscription'];
    createdAtProductsTyps = json['CreatedAtProductsTyps'];
    sellerFirstName = json['SellerFirstName'];
    sellerLastName = json['SellerLastName'];
    sellerEmail = json['SellerEmail'];
    sellerPassword = json['SellerPassword'];
    sellerCountryID = json['SellerCountryID'];
    sellerStoreName = json['SellerStoreName'];
    sellerCompanyLegelName = json['SellerCompanyLegelName'];
    sellerCompanyPhoneNumber = json['SellerCompanyPhoneNumber'];
  }

}