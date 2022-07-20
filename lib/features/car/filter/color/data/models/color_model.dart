import 'package:cars/features/car/filter/color/domain/entities/color.dart';

class ColorModel implements ColorCustom {
  @override
  String? colorId;
  @override
  String? name;

  ColorModel({this.colorId, this.name});

  ColorModel.fromMap(Map<String, dynamic> json) {
    colorId = json['color_id'];
    name = json['name'];
  }
}
