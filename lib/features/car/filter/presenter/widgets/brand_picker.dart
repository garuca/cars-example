import 'dart:async';

import 'package:cars/features/car/filter/brand/domain/entities/brand.dart';
import 'package:flutter/material.dart';

class BrandPicker extends StatefulWidget {
  final BrandPickerController controller;

  BrandPicker({Key key, this.controller}) : super(key: key);

  @override
  _BrandPickerState createState() => _BrandPickerState();
}

class _BrandPickerState extends State<BrandPicker> {
  Map<String, String> images = {
    '1': 'images/logo-audi.jpg',
    '2': 'images/logo-chevrolet.jpg',
    '3': 'images/logo-hyundai.jpg',
  };
  var brandsFilters = [];
  @override
  void initState() {
    super.initState();
    brandsFilters = widget.controller.brands;
    StreamSubscription subscription;
    subscription = widget.controller.streamController.stream.listen((data) {
      print(data);
      subscription.pause(Future.delayed(const Duration(microseconds: 500)));
      setState(() {
        brandsFilters = widget.controller.brands
            .where((brand) =>
                brand.name.toUpperCase().contains(data.toUpperCase()))
            .toList();
      });
    }, onDone: () {
      print("Task Done");
      subscription.cancel();
    }, onError: (error) {
      print("Some Error");
    });
  }

  @override
  void dispose() {
    widget.controller.streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildElement(Brand brand) {
      return GestureDetector(
        onTap: () {
          setState(() {
            if (widget.controller.selects.contains(int.parse(brand.brandId))) {
              widget.controller.selects.remove(int.parse(brand.brandId));
            } else {
              widget.controller.selects.add(int.parse(brand.brandId));
            }
          });
        },
        child: Container(
          color: Colors.white,
          height: 50,
          child: Row(
            children: [
              SizedBox(
                  height: 18.0,
                  width: 18.0,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: Color(0xFFA5ABB7),
                    ),
                    child: Checkbox(
                      value: widget.controller.selects
                          .contains(int.parse(brand.brandId)),
                      onChanged: (bool value) {
                        setState(() {
                          if (widget.controller.selects
                              .contains(int.parse(brand.brandId))) {
                            widget.controller.selects
                                .remove(int.parse(brand.brandId));
                          } else {
                            widget.controller.selects
                                .add(int.parse(brand.brandId));
                          }
                        });
                      },
                    ),
                  )),
              SizedBox(
                width: 17,
              ),
              Image.asset(
                images[brand.brandId],
                height: 50,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                '${brand.name.capitalize()}',
                style: TextStyle(fontSize: 16, color: Color(0xFF768095)),
              ),
            ],
          ),
        ),
      );
    }

    SliverList _buildContent(List<Brand> brands) {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return _buildElement(brands[index]);
          },
          childCount: brands.length,
        ),
      );
    }

    return _buildContent(brandsFilters);
  }
}

class BrandPickerController {
  final List<Brand> brands;
  final List<int> selects;
  StreamController streamController;
  BrandPickerController({this.brands, this.selects, this.streamController});
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
