import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CarCard extends StatelessWidget {
  final dynamic car;
  const CarCard({Key? key, required this.car}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String assetHeart = 'images/heart.svg';
    var heart = SvgPicture.asset(
      assetHeart,
      fit: BoxFit.cover,
      height: 24,
      width: 24,
    );
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.black12,
                image: DecorationImage(
                  image: NetworkImage(car.imageUrl!),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5.0),
                )),
            child: Align(
                alignment: Alignment.topRight,
                child:
                    Padding(padding: const EdgeInsets.all(10), child: heart)),
          ),
        ),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 10.1,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '${car.brandName}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const Text(' '),
                    Text(
                      '${car.modelName}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xFF0065ff)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 7.0,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '${car.modelYear} ',
                      style: const TextStyle(
                          fontSize: 14, color: Color(0xFF768095)),
                    ),
                    Container(
                      width: 3,
                      height: 3,
                      decoration: const BoxDecoration(
                        color: Color(0xFF768095),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text(
                      ' ${car.fuelType}',
                      style: const TextStyle(
                          fontSize: 14, color: Color(0xFF768095)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: <Widget>[
                    Tooltip(
                        message: car.transmissionType,
                        child: Text(
                          '${car.transmissionType} ',
                          style: const TextStyle(
                              fontSize: 14, color: Color(0xFF768095)),
                        )),
                    Container(
                      width: 3,
                      height: 3,
                      decoration: const BoxDecoration(
                        color: Color(0xFF768095),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Flexible(
                      child: Tooltip(
                        message: '${car.transmissionType}  km',
                        child: const Text(
                          'km',
                          overflow: TextOverflow.ellipsis,
                          style:
                              TextStyle(fontSize: 14, color: Color(0xFF768095)),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 7.0,
                ),
                const Text(
                  'R\$ ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF1E2C4C)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
