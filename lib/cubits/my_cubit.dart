import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otlop_app/api/api_service.dart';
import 'package:otlop_app/cubits/cubit_states.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductLoading());

  final DataService homedatasource = DataService();

  Future getProducts() async {
  try {
    final products = await homedatasource.getProducts();

    log('Value Length : ${products.length}');

    emit(ProductSuccess(products));
  } catch (e) {
    emit(ProductFailure());
  }
}
}