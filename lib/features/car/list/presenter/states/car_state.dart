

import 'package:cars/features/car/list/domain/entities/car.dart';
import 'package:cars/features/car/list/domain/errors/errors.dart';

abstract class CarState {}

class StartState implements CarState {
  const StartState();
}

class LoadingState implements CarState {
  const LoadingState();
}

class ErrorState implements CarState {
  final Failure error;
  const ErrorState( this.error);
}

class SuccessState implements CarState {
  final List<Car> listFiltered;
  const SuccessState(this.listFiltered);
}