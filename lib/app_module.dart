import 'package:cars/features/car/filter/data/repositories/filter_repository_impl.dart';
import 'package:cars/features/car/filter/domain/use_cases/list_all_colors_and_brands.dart';
import 'package:cars/features/car/filter/external/repository/car_data_source_impl.dart';
import 'package:cars/features/car/filter/presenter/filter_cubit.dart';
import 'package:cars/features/car/list/data/models/car_model.dart';
import 'package:cars/features/car/list/data/repositories/car_repository_impl.dart';
import 'package:cars/features/car/list/domain/use_cases/list_all_cars.dart';
import 'package:cars/features/car/list/domain/use_cases/list_filtered_cars.dart';
import 'package:cars/features/car/list/external/repository/car_data_source_impl.dart';
import 'package:cars/features/car/list/external/repository/local/memory.dart';
import 'package:cars/features/car/list/presenter/car_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'features/car/filter/data/data_source/filter_data_source.dart';
import 'features/car/filter/domain/repositories/filter_repository.dart';
import 'features/car/list/data/data_source/car_data_source.dart';
import 'features/car/list/domain/repositories/car_repository.dart';

final sl = GetIt.I;

startModule([Dio dio]) {
  sl.registerFactory<ListAllCars>(() => ListAllCarsImpl(sl<CarRepository>()));
  sl.registerFactory<ListFilteredCars>(
      () => ListFilteredCarsImpl(sl<CarRepository>()));
  sl.registerFactory<CarRepository>(
      () => CarRepositoryImpl(sl<CarDataSource>()));
  sl.registerFactory<CarDataSource>(() => CarDataSourceImpl(sl()));
  sl.registerFactory(() => dio ?? Dio());
  sl.registerLazySingleton(
      () => CarCubit(sl<ListAllCars>(), sl<ListFilteredCars>()));
  sl.registerFactory<List<CarModel>>(() => <CarModel>[]);
  sl.registerLazySingleton(() => Memory(sl()));

  sl.registerFactory<ListAllColorsAndBrands>(
      () => ListAllColorsAndBrandsImpl(sl<FiltersRepository>()));
  sl.registerFactory<FiltersRepository>(
      () => FiltersRepositoryImpl(sl<FiltersDataSource>()));
  sl.registerFactory<FiltersDataSource>(() => FilterDataSourceImpl(sl()));
  sl.registerLazySingleton(() => FilterCubit(sl<ListAllColorsAndBrands>()));
}

disposeModule() {
  sl.get<CarCubit>().close();
  sl.unregister<CarCubit>();
}
