import 'package:cars/features/car/filter/brand/domain/entities/brand.dart';

class BrandModel implements Brand {
  @override
  String? brandId;

  @override
  String? name;

  BrandModel({this.brandId, this.name});

  BrandModel.fromMap(Map<String, dynamic> json) {
    brandId = json['brand_id'];
    name = json['name'];
  }
}
