import 'package:cars/features/car/list/domain/entities/car.dart';
import 'package:cars/features/car/list/domain/errors/errors.dart';
import 'package:cars/features/car/list/domain/repositories/car_repository.dart';
import 'package:dartz/dartz.dart';

abstract class ListAllCars {
  Future<Either<Failure,List<Car>>> call();

}

class ListAllCarsImpl implements ListAllCars {
  final  CarRepository repository;

  ListAllCarsImpl(this.repository);

  @override
  Future<Either<Failure, List<Car>>> call() async {
    return repository.list();
  }

}
