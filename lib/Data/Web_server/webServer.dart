import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:noon/Data/Modal/products.dart';

class WebServer {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getdate({
    required String url,
  }) async {
    return await dio.get(
      url,
    );
  }

  static Future<Response> PostData({
    required String uri,
    Map<String, dynamic>?query,
    required Map<String, dynamic>data,
  }) async {
    return await dio.post(
      uri,
      data: data,
      queryParameters: query,
    );
  }

}
