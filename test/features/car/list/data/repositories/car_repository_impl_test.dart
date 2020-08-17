import 'package:cars/features/car/list/data/data_source/car_data_source.dart';
import 'package:cars/features/car/list/data/models/car_model.dart';
import 'package:cars/features/car/list/data/repositories/car_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class CarDataSourceMock extends Mock implements CarDataSource {}

main() {
  final dataSource = CarDataSourceMock();
  final repository = CarRepositoryImpl(dataSource);

  test('Return list result Search', () async {
    when(dataSource.getCars())
        .thenAnswer((_) async => <CarModel>[]);
    final result = await repository.list();
    expect(result | null, isA<List<CarModel>>());
  });
}