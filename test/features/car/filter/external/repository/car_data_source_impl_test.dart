import 'package:cars/features/car/filter/external/repository/car_data_source_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

main() async {
  final Dio dio = Dio();

  final dataSource = FilterDataSourceImpl(dio);
  test('Return list all filters', () async {
    expect(dataSource.getFilters(), completes);
  });
}
