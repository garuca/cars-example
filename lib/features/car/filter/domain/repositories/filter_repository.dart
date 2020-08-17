


import 'package:cars/features/car/filter/domain/entities/filter.dart';
import 'package:cars/features/car/filter/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class FiltersRepository{
  Future<Either<Failure,Filter>> getFilter();

  }
