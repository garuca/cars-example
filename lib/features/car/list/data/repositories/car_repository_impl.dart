import 'package:cars/features/car/list/data/data_source/car_data_source.dart';
import 'package:cars/features/car/list/data/models/car_model.dart';
import 'package:cars/features/car/list/domain/entities/car.dart';
import 'package:cars/features/car/list/domain/errors/errors.dart';
import 'package:cars/features/car/list/domain/repositories/car_repository.dart';
import 'package:dartz/dartz.dart';

class CarRepositoryImpl implements CarRepository {
  final CarDataSource dataSource;

  CarRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<CarModel>?>> list() async {
    try {
      final result = await dataSource.getCars();
      return Right(result);
    } catch (e) {
      return Left(DataSourceError());
    }
  }

  @override
  Future<Either<Failure, List<Car>?>> filter(
      List<int> listBrandId, List<int> listColorId) async {
    try {
      final result = await dataSource.getFilteredCars(listBrandId, listColorId);
      return Right(result);
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
