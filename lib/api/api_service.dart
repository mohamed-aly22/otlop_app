import 'dart:developer';

import 'package:dio/dio.dart';

class DataService {
  Future<List> getProducts() async {
    List<dynamic> items = [];
    final Dio dio = Dio();
    try {
      final Response resonse = await dio.get(
        'https://talabat639.runasp.net/api/Products'
      );

      items = resonse.data['data'];
    } on Exception catch (e) {
      log('Error in data source : $e');
    }
    return items;
  }

  Future<List> getCategories() async {
    List<dynamic> listCategory = [];
    final Dio dio = Dio();
    try {
      final Response resonse = await dio.get(
        'https://talabat639.runasp.net/api/Products/categories'
      );

      listCategory = resonse.data['data'];
    } on Exception catch (e) {
      log('Error in data source : $e');
    }
    return listCategory;
  }

  Future<List> getbrands() async {
    List<dynamic> listBrands = [];
    final Dio dio = Dio();
    try {
      final Response resonse = await dio.get(
        'https://talabat639.runasp.net/api/Products/brands'
      );

      listBrands = resonse.data['data'];
    } on Exception catch (e) {
      log('Error in data source : $e');
    }
    return listBrands;
  }

}
