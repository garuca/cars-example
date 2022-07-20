import 'package:cars/commons/widgets/car_appbar.dart';
import 'package:cars/commons/widgets/car_card.dart';
import 'package:cars/features/car/filter/presenter/filter_page.dart';
import 'package:cars/features/car/list/domain/entities/car.dart';
import 'package:cars/features/car/list/domain/errors/errors.dart';
import 'package:cars/features/car/list/presenter/car_cubit.dart';
import 'package:cars/features/car/list/presenter/states/feed_loading_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../states/car_state.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  FeedPageState createState() => FeedPageState();
}

class FeedPageState extends State<FeedPage> {
  List<int> listBrandId = [], listColorId = [];

  _navigateAndDisplaySelection(BuildContext context, CarCubit carCubit) async {
    final result = await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => FilterPage(
        listBrandId: listBrandId,
        listColorId: listColorId,
      ),
    );

    carCubit.addFilterListCar(result[1], result[0]);
    listColorId = result[0];
    listBrandId = result[1];
  }

  Widget _gridView(List<Car> list, CarCubit carCubit) {
    double spacing = 20;
    int columns = 2;
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: carAppbar(
        onTap: () => _navigateAndDisplaySelection(context, carCubit),
      ),
      body: GridView.count(
        crossAxisCount: columns,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
        childAspectRatio: (itemWidth / itemHeight),
        padding: EdgeInsets.all(spacing),
        children: list.map((car) {
          return CarCard(car: car);
        }).toList(),
      ),
    );
  }

  Widget _buildError(Failure error) {
    if (error is EmptyList) {
      return const Center(
        child: Text('Nada encontrado'),
      );
    } else if (error is ErrorSearch) {
      return const Center(
        child: Text('Erro ao recuperar dados'),
      );
    } else {
      return const Center(
        child: Text('Erro interno'),
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: BlocBuilder<CarCubit, CarState>(builder: (context, state) {
              if (state is ErrorState) {
                return _buildError(state.error);
              }

              if (state is StartState) {
                return const Center(
                  child: FeedLoadingPage(),
                );
              } else if (state is LoadingState) {
                return const Center(
                  child: FeedLoadingPage(),
                );
              } else if (state is SuccessState) {
                return _gridView(state.listFiltered!, context.read<CarCubit>());
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
