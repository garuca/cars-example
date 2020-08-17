import 'package:bloc/bloc.dart';
import 'package:cars/features/car/filter/domain/use_cases/list_all_colors_and_brands.dart';
import 'package:cars/features/car/filter/presenter/states/filter_state.dart';
import 'package:async/async.dart';

class FilterCubit extends Cubit<FilterState> {
  final ListAllColorsAndBrands listAllColorsAndBrands;
  CancelableOperation cancelable;

  FilterCubit(this.listAllColorsAndBrands) : super(const StartState());

  Future<FilterState> execute() async {
    final response = await listAllColorsAndBrands.call();
    final result = response.fold(
      (failure) => ErrorState(failure),
      (success) => SuccessState(success),
    );
    return result;
  }

  Future<void> addFilterListCar() async {
    await cancelable?.cancel();
    emit(const LoadingState());
    cancelable = CancelableOperation.fromFuture(
        Future.delayed(Duration(milliseconds: 0)));
    await cancelable.value;
    if (cancelable.isCompleted) {
      emit(await execute());
    }
  }
}
