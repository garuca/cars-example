import 'package:cars/features/car/filter/presenter/filter_page.dart';
import 'package:cars/features/car/list/domain/entities/car.dart';
import 'package:cars/features/car/list/domain/errors/errors.dart';
import 'package:cars/features/car/list/presenter/car_cubit.dart';
import 'package:cars/features/car/list/presenter/states/feed_loading_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'states/car_state.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  CarCubit cubit;
  List<int> listBrandId = [], listColorId = [];

  @override
  void initState() {
    super.initState();
    cubit = GetIt.instance.get<CarCubit>();
    cubit.addFilterListCar([], []);
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => FilterPage(
        listBrandId: listBrandId,
        listColorId: listColorId,
      ),
    );

    cubit.addFilterListCar(result[1], result[0]);
    listColorId = result[0];
    listBrandId = result[1];
  }

  Widget _gridView(List<Car> list) {
    double spacing = 20;
    int columns = 2;
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    final String assetMenu = 'images/heart.svg';
    final String assetTune = 'images/tune.svg';
    var heart = SvgPicture.asset(
      assetMenu,
      fit: BoxFit.cover,
      height: 24,
      width: 24,
    );
    var tune = SvgPicture.asset(
      assetTune,
      fit: BoxFit.contain,
      height: 30,
      width: 30,
    );


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
          GestureDetector(
            child: Padding(
              child: Container(
                  child: Center(
                      child: Wrap(
                children: [
                  Container(
                      width: 45,
                      height: 45,
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              width: 30,
                              height: 30,
                              child: tune,
                            ),
                          ),
                          Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                  width: 22,
                                  height: 20,
                                  color: Colors.white,
                                  child: Center(
                                    child: Container(
                                      width: 15,
                                      height: 15,
                                      child: Center(
                                        child: Text(
                                          '1',
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ),
                                      decoration: new BoxDecoration(
                                        color: Color(0xFF0065ff),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  )))
                        ],
                      )),
                ],
              ))),
              padding: EdgeInsets.fromLTRB(0, 0, 18, 0),
            ),
            onTap: () {
              _navigateAndDisplaySelection(context);
            },
          )
        ],
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Image.asset('images/logo.png'),
        ),
        title: Text(
          "VW Seminovos",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xFF4B5670)),
        ),
      ),
      body: GridView.count(
        crossAxisCount: columns,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
        childAspectRatio: (itemWidth / itemHeight),
        padding: EdgeInsets.all(spacing),
        children: list.map((car) {
          FlutterMoneyFormatter fmfPrice = FlutterMoneyFormatter(
              amount: car.price.toDouble(),
              settings: MoneyFormatterSettings(
                  symbol: 'IDR',
                  thousandSeparator: '.',
                  decimalSeparator: ',',
                  symbolAndNumberSeparator: ' ',
                  fractionDigits: 0,
                  compactFormatType: CompactFormatType.short));
          FlutterMoneyFormatter fmfMileage = FlutterMoneyFormatter(
              amount: car.mileage.toDouble(),
              settings: MoneyFormatterSettings(
                  symbol: 'IDR',
                  thousandSeparator: '.',
                  decimalSeparator: ',',
                  symbolAndNumberSeparator: ' ',
                  fractionDigits: 0,
                  compactFormatType: CompactFormatType.short));
          return Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: Align(
                        alignment: Alignment.topRight,
                        child:
                            Padding(padding: EdgeInsets.all(10), child: heart)),
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        image: DecorationImage(
                          image: NetworkImage(car.imageUrl),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(
                          const Radius.circular(5.0),
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10.1,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              '${car.brandName}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            Text(' '),
                            Text(
                              '${car.modelName}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Color(0xFF0065ff)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7.0,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              '${car.modelYear} ',
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF768095)),
                            ),
                            Container(
                              width: 3,
                              height: 3,
                              decoration: new BoxDecoration(
                                color: Color(0xFF768095),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Text(
                              ' ${car.fuelType}',
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF768095)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          children: <Widget>[
                            Tooltip(
                              child: Text(
                                '${car.transmissionType} ',
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xFF768095)),
                              ),
                              message:
                                  '${car.transmissionType} ${fmfMileage.output.nonSymbol}',
                            ),
                            Container(
                              width: 3,
                              height: 3,
                              decoration: new BoxDecoration(
                                color: Color(0xFF768095),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Flexible(
                              child: Tooltip(
                                child: Text(
                                  ' ${fmfMileage.output.nonSymbol} km',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xFF768095)),
                                ),
                                message:
                                    '${car.transmissionType} ${fmfMileage.output.nonSymbol} km',
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 7.0,
                        ),
                        Text(
                          'R\$ ${fmfPrice.output.nonSymbol}',
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
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildError(Failure error) {
    if (error is EmptyList) {
      return Center(
        child: Text('Nada encontrado'),
      );
    } else if (error is ErrorSearch) {
      return Center(
        child: Text('Erro ao recuperar dados'),
      );
    } else {
      return Center(
        child: Text('Erro interno'),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    cubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder<CarState>(
                stream: cubit,
                builder: (context, snapshot) {
                  var state = cubit.state;

                  if (state is ErrorState) {
                    return _buildError(state.error);
                  }

                  if (state is StartState) {
                    return Center(
                      child: Text('Dita um filme que vc gosta em ingles plis '),
                    );
                  } else if (state is LoadingState) {
                    return Center(
                      child: FeedLoadingPage(),
                    );
                  } else if (state is SuccessState) {
                    return _gridView(state.listFiltered);
                  } else {
                    return Container();
                  }
                }),
          )
        ],
      ),
    );
  }

}
