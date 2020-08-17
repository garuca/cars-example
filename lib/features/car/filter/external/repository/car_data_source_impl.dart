import 'package:cars/features/car/filter/brand/data/models/brand_model.dart';
import 'package:cars/features/car/filter/color/data/models/color_model.dart';
import 'package:cars/features/car/filter/data/data_source/filter_data_source.dart';
import 'package:cars/features/car/filter/data/models/filter_model.dart';
import 'package:cars/features/car/filter/domain/entities/filter.dart';
import 'package:dio/dio.dart';

class FilterDataSourceImpl implements FiltersDataSource {
  final Dio dio;

  FilterDataSourceImpl(this.dio);

  @override
  Future<Filter> getFilters() async {
    Response responseColors = await dio
        .get('https://run.mocky.io/v3/ac466e17-58a4-432b-8647-7a2e4c4074e2');
    Response responseBrands = await dio
        .get('https://run.mocky.io/v3/4f858a89-17b2-4e9c-82e0-5cdce6e90d29');
    if (responseBrands.statusCode == 200 && responseColors.statusCode == 200) {
      final listBrands = (responseBrands.data as List)
          .map((e) => BrandModel.fromMap(e))
          .toList();
      final listColors = (responseColors.data as List)
          .map((e) => ColorModel.fromMap(e))
          .toList();
      return FilterModel(
        brands: listBrands,
        colors: listColors,
      );
    }
    return null;
  }
}
