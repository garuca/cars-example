import 'package:cars/features/car/list/external/repository/car_data_source_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

main() async {
  final Dio dio = Dio();

  final dataSource = CarDataSourceImpl(dio);
  test('Return list Cars', () async {
    expect(dataSource.getCars(), completes);
  });
}
