import 'package:cars/features/car/list/domain/entities/car.dart';
import 'package:cars/features/car/list/domain/repositories/car_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:cars/features/car/list/domain/use_cases/list_all_cars.dart';
class CarRepositoryMock extends Mock implements CarRepository {}

main() {
  final repository = CarRepositoryMock();
  final useCase = ListAllCarsImpl(repository);

  test("Return list of Cars", () async {
    when(repository.list()).thenAnswer((_) async => Right(<Car>[]));
    final result = await useCase();
    expect(result | null, isA<List<Car>>());
  });
}