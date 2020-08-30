import 'package:cars/features/car/list/data/models/car_model.dart';

abstract class CarDataSource {
  Future<List<CarModel>> getCars();
  Future<List<CarModel>> getFilteredCars(
      List<int> listBrandId, List<int> listColorId);
}
