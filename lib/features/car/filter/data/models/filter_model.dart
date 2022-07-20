import 'package:cars/features/car/filter/brand/domain/entities/brand.dart';
import 'package:cars/features/car/filter/color/domain/entities/color.dart';
import 'package:cars/features/car/filter/domain/entities/filter.dart';

class FilterModel implements Filter {
  @override
  List<ColorCustom>? colors;
  @override
  List<Brand>? brands;

  FilterModel({this.colors, this.brands});
}
