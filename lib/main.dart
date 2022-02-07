import 'package:cars/app_widget.dart';
import 'package:cars/features/car/filter/presenter/filter_cubit.dart';
import 'package:cars/features/car/list/presenter/car_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:cars/features/car/list/domain/use_cases/list_all_cars.dart';
import 'package:cars/features/car/list/domain/use_cases/list_filtered_cars.dart';

import 'features/car/filter/domain/use_cases/list_all_colors_and_brands.dart';
void main() {
  final sl = GetIt.I;
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<CarCubit>(
        create: (BuildContext context) => CarCubit(sl<ListAllCars>(), sl<ListFilteredCars>()),
      ),
      BlocProvider<FilterCubit>(
        create: (BuildContext context) => FilterCubit(sl<ListAllColorsAndBrands>()),
      ),

    ],
    child: AppWidget(),
  ));
}
