import 'dart:async';
import 'package:cars/features/car/filter/domain/entities/filter.dart';
import 'package:cars/features/car/filter/domain/errors/errors.dart';
import 'package:cars/features/car/filter/presenter/filter_cubit.dart';
import 'package:cars/features/car/filter/presenter/states/filter_loading_page.dart';
import 'package:cars/features/car/filter/presenter/states/filter_state.dart';
import 'package:cars/features/car/filter/presenter/widgets/brand_picker.dart';
import 'package:cars/features/car/filter/presenter/widgets/color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';

class FilterPage extends StatefulWidget {
  final List<int> listBrandId;
  final List<int> listColorId;
  FilterPage({Key key, this.listBrandId, this.listColorId}) : super(key: key);
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  FilterCubit cubit;
  var colorPickerController = ColorPickerController(colors: []);
  var brandPickerController = BrandPickerController(brands: []);
  final textEditingController = TextEditingController();

  void onPauseHandler() {
    print('on Pause');
  }

  StreamController streamController;
  var down = SvgPicture.asset(
    'images/down.svg',
    fit: BoxFit.cover,
    height: 24,
    width: 24,
  );
  _printLatestValue() {
    brandPickerController.streamController.add(textEditingController.text);
  }

  @override
  void initState() {
    super.initState();
    if (streamController == null) {
      streamController = StreamController(
        onPause: onPauseHandler,
      );
    }

    textEditingController.addListener(_printLatestValue);
    cubit = GetIt.instance.get<FilterCubit>();
    cubit.addFilterListCar();
  }

  @override
  void dispose() {
    cubit.close();
    streamController.close();
    brandPickerController.streamController.close();
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _buildSuccess(Filter filter) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              width: double.infinity,
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Container(
                          width: double.infinity,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: GestureDetector(
                                  child: down,
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    "Filtrar",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Color(0xFF4b5670)),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Marca',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color(0xFF4b5670)),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  fontSize: 16, color: Color(0xFF768095)),
                              suffixIcon: Icon(Icons.search),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFD3D5DC),
                                ),
                                borderRadius: BorderRadius.all(
                                  const Radius.circular(5.0),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFD3D5DC),
                                ),
                                borderRadius: BorderRadius.all(
                                  const Radius.circular(5.0),
                                ),
                              ),
                            ),
                            controller: textEditingController,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  BrandPicker(
                    controller: brandPickerController,
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      SizedBox(
                        height: 31,
                      ),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: Color(0xFFDDDDDD),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Cor',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xFF4b5670)),
                      ),
                      SizedBox(
                        height: 29,
                      ),
                    ]),
                  ),
                  ColorPicker(
                    controller: colorPickerController,
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      SizedBox(height: 30),
                    ]),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                                flex: 2,
                                child: Container(
                                  height: 56,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        side: BorderSide(
                                            color: Color(0xFFD3D5DC))),
                                    child: const Text(
                                      'Limpar',
                                      style:
                                          TextStyle(color: Color(0xFF0065ff)),
                                    ),
                                    color: Colors.white,
                                    onPressed: () {
                                      setState(() {
                                        colorPickerController.selects = [];
                                        colorPickerController.selects = [];
                                        widget.listBrandId.clear();
                                        widget.listColorId.clear();
                                      });
                                    },
                                  ),
                                )),
                            SizedBox(width: 20),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  height: 56,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        side: BorderSide(
                                            color: Color(0xFFD3D5DC))),
                                    child: const Text(
                                      'Aplicar',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    color: Color(0xFF0065ff),
                                    onPressed: () {
                                      print(colorPickerController.selects);
                                      print(brandPickerController.selects);
                                      Navigator.pop(context, [
                                        colorPickerController.selects,
                                        brandPickerController.selects
                                      ]);
                                    },
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      SizedBox(height: 30),
                    ]),
                  ),
                ],
              )));
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

    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: BlocBuilder<FilterCubit, FilterState>(
                  builder: (context, snapshot) {
                var state = cubit.state;

                if (state is ErrorState) {
                  return _buildError(state.error);
                }

                if (state is StartState) {
                  return Center(
                    child: Container(),
                  );
                } else if (state is LoadingState) {
                  return Center(
                    child: FilterLoadingPage(),
                  );
                } else if (state is SuccessState) {
                  brandPickerController = BrandPickerController(
                      brands: state.filter.brands,
                      selects: widget.listBrandId,
                      streamController: streamController);
                  colorPickerController = ColorPickerController(
                      colors: state.filter.colors, selects: widget.listColorId);
                  return _buildSuccess(state.filter);
                } else {
                  return Container();
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}
