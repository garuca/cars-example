

import 'package:cars/features/car/list/domain/entities/car.dart';

class CarModel extends Car{
  String id;
  String imageUrl;
  String brandName;
  String modelName;
  int modelYear;
  String fuelType;
  int mileage;
  String transmissionType;
  int price;
  int brandId;
  int colorId;

  CarModel(
      {this.id,
        this.imageUrl,
        this.brandName,
        this.modelName,
        this.modelYear,
        this.fuelType,
        this.mileage,
        this.transmissionType,
        this.price,
        this.brandId,
        this.colorId});

  CarModel.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
    brandName = json['brand_name'];
    modelName = json['model_name'];
    modelYear = json['model_year'];
    fuelType = json['fuel_type'];
    mileage = json['mileage'];
    transmissionType = json['transmission_type'];
    price = json['price'];
    brandId = json['brand_id'];
    colorId = json['color_id'];
  }

}