import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showroom/core/constant/size.dart';
import 'package:showroom/features/car/domain/entities/car.dart';
import 'package:showroom/features/car/presentation/bloc/car_bloc.dart';
import 'package:showroom/features/car/presentation/widgets/build_grid_view.dart';
import 'package:showroom/features/car/presentation/widgets/custom_search_bar.dart';
import 'package:showroom/features/common/widgets/list_brand.dart';
import 'package:showroom/features/common/widgets/loading.dart';

class AllCarPage extends StatelessWidget {
  const AllCarPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const CustomSearchBar(),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(height: 85, child: ListBrand()),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: BlocBuilder<CarBloc, CarState>(
                  builder: (context, state) {
                    if (state is CarStateLoading) {
                      return const Loading();
                    } else if (state is CarStateLoadedAllCars) {
                      List<Car> cars = state.cars.toList();
                      return SizedBox(
                        height: SizeConfig.screenHeight / 1.32,
                        child: buildGridView(cars, cars.length),
                      );
                    } else if (state is CarStateLoadedCarByName) {
                      List<Car> cars = state.cars.toList();
                      return SizedBox(
                        height: SizeConfig.screenHeight / 4,
                        child: buildGridView(cars, cars.length),
                      );
                    } else {
                      return const Center(
                          heightFactor: 20, child: Text("Car not found"));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
