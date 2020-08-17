import 'package:cars/features/car/filter/color/domain/entities/color.dart';

class ColorModel extends ColorCustom {
  String colorId;
  String name;

  ColorModel({this.colorId, this.name});

  ColorModel.fromMap(Map<String, dynamic> json) {
    colorId = json['color_id'];
    name = json['name'];
  }
}
