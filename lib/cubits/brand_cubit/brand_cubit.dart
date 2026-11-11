import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:otlop_app/api/api_service.dart';

part 'brand_state.dart';

class BrandCubit extends Cubit<BrandState> {
  BrandCubit() : super(BrandInitial());

  final DataService datasource = DataService();

  
}
