import 'package:cars/features/car/list/domain/entities/car.dart';
import 'package:cars/features/car/list/domain/errors/errors.dart';
import 'package:cars/features/car/list/domain/repositories/car_repository.dart';
import 'package:dartz/dartz.dart';

abstract class ListFilteredCars {
  Future<Either<Failure, List<Car>?>> call(
      List<int> listBrandId, List<int> listColorId);
}

class ListFilteredCarsImpl implements ListFilteredCars {
  final CarRepository repository;

  ListFilteredCarsImpl(this.repository);

  @override
  Future<Either<Failure, List<Car>?>> call(
      List<int> listBrandId, List<int> listColorId) async {
    return repository.filter(listBrandId, listColorId);
  }
}
