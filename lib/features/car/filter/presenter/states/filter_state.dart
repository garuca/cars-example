import 'package:cars/features/car/filter/domain/entities/filter.dart';
import 'package:cars/features/car/filter/domain/errors/errors.dart';


abstract class FilterState {}

class StartState implements FilterState {
  const StartState();
}

class LoadingState implements FilterState {
  const LoadingState();
}

class ErrorState implements FilterState {
  final Failure error;
  const ErrorState(this.error);
}

class SuccessState implements FilterState {
  final Filter filter;
  const SuccessState(this.filter);
}
