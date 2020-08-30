import 'package:cars/features/car/filter/data/data_source/filter_data_source.dart';
import 'package:cars/features/car/filter/domain/entities/filter.dart';
import 'package:cars/features/car/filter/domain/errors/errors.dart';
import 'package:cars/features/car/filter/domain/repositories/filter_repository.dart';
import 'package:dartz/dartz.dart';

class FiltersRepositoryImpl implements FiltersRepository {
  final FiltersDataSource dataSource;
  FiltersRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, Filter>> getFilter() async {
    try {
      final result = await dataSource.getFilters();
      return Right(result);
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
