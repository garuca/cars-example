import 'package:cars/features/car/filter/domain/entities/filter.dart';

abstract class FiltersDataSource {
  Future<Filter?> getFilters();
}
