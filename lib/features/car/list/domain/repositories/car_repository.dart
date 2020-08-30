import 'package:cars/features/car/list/domain/entities/car.dart';
import 'package:cars/features/car/list/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class CarRepository {
  Future<Either<Failure, List<Car>>> list();
  Future<Either<Failure, List<Car>>> filter(
      List<int> listBrandId, List<int> listColorId);
}
