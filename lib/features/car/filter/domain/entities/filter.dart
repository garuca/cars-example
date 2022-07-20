import 'package:cars/features/car/filter/brand/domain/entities/brand.dart';
import 'package:cars/features/car/filter/color/domain/entities/color.dart';

class Filter {
  List<ColorCustom>? colors;
  List<Brand>? brands;

  Filter({this.colors, this.brands});
}
