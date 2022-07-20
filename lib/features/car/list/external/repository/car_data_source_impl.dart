import 'package:cars/features/car/list/data/data_source/car_data_source.dart';
import 'package:cars/features/car/list/data/models/car_model.dart';
import 'package:cars/features/car/list/external/repository/local/memory.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class CarDataSourceImpl implements CarDataSource {
  final Dio dio;

  CarDataSourceImpl(this.dio);

  @override
  Future<List<CarModel>?> getCars() async {
    Response response = await dio
        .get('https://run.mocky.io/v3/e2fe4deb-f65d-45e2-b548-39c17f08e637');
    if (response.statusCode == 200) {
      final list =
          (response.data as List).map((e) => CarModel.fromMap(e)).toList();
      var memory = GetIt.instance.get<Memory>();
      memory.cars = list;
      return list;
    }
    return null;
  }

  @override
  Future<List<CarModel>> getFilteredCars(
      List<int> listBrandId, List<int> listColorId) async {
    var memory = GetIt.instance.get<Memory>();
    List<CarModel> carsFiltered = memory.cars;
    if (listColorId.isNotEmpty) {
      carsFiltered = carsFiltered
          .where((car) => listColorId.contains(car.colorId))
          .toList();
    }
    if (listBrandId.isNotEmpty) {
      carsFiltered = carsFiltered
          .where((car) => listBrandId.contains(car.brandId))
          .toList();
    }
    return carsFiltered;
  }
}
