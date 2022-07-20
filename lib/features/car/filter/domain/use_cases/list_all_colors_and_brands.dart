import 'package:cars/features/car/filter/domain/entities/filter.dart';
import 'package:cars/features/car/filter/domain/errors/errors.dart';
import 'package:cars/features/car/filter/domain/repositories/filter_repository.dart';
import 'package:dartz/dartz.dart';

abstract class ListAllColorsAndBrands {
  Future<Either<Failure, Filter?>> call();
}

class ListAllColorsAndBrandsImpl implements ListAllColorsAndBrands {
  final FiltersRepository repository;

  ListAllColorsAndBrandsImpl(this.repository);

  @override
  Future<Either<Failure, Filter?>> call() async {
    return repository.getFilter();
  }
}
