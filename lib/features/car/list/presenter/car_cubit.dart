import 'package:async/async.dart';
import 'package:bloc/bloc.dart';
import 'package:cars/features/car/list/domain/use_cases/list_all_cars.dart';
import 'package:cars/features/car/list/domain/use_cases/list_filtered_cars.dart';

import 'package:cars/features/car/list/presenter/states/car_state.dart';

class CarCubit extends Cubit<CarState> {
  final ListAllCars? listAllCars;
  final ListFilteredCars? listFilteredCars;
  late CancelableOperation cancelable;

  CarCubit(this.listAllCars, this.listFilteredCars)
      : super(const StartState()) {
    cancelable = CancelableOperation.fromFuture(listAllCars!.call());
    execute([], []);
  }

  Future<CarState> execute(List<int> listBrandId, List<int> listColorId) async {
    await listAllCars!();
    final response = await listFilteredCars!(listBrandId, listColorId);
    final result = response.fold(
      (failure) => ErrorState(failure),
      (success) => SuccessState(success),
    );
    emit(result);
    return result;
  }

  Future<void> addFilterListCar(
      List<int> listBrandId, List<int> listColorId) async {
    await cancelable.cancel();

    emit(const LoadingState());
    cancelable = CancelableOperation.fromFuture(
        Future.delayed(const Duration(milliseconds: 800)));
    await cancelable.value;
    if (cancelable.isCompleted) {
      emit(await execute(listBrandId, listColorId));
    }
  }
}
