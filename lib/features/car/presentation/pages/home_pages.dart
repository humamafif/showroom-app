import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showroom/core/constant/size.dart';
import 'package:showroom/features/car/domain/entities/car.dart';
import 'package:showroom/features/car/presentation/bloc/car_bloc.dart';
import 'package:showroom/features/car/presentation/widgets/build_grid_view.dart';
import 'package:showroom/features/car/presentation/widgets/carousel/carousel.dart';
import 'package:showroom/features/common/widgets/list_brand.dart';
import 'package:showroom/core/injection.dart';
import 'package:showroom/features/common/widgets/loading.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          "Showroom App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(height: 85, child: ListBrand()),
              ),
              const CarouselHeader(),

              // Hot Deals Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Hot deals",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(
                      "View all...",
                      style: TextStyle(color: Colors.orange),
                    )
                  ],
                ),
              ),
              BlocBuilder<CarBloc, CarState>(
                bloc: myInjection<CarBloc>()..add(CarEventGetCars()),
                builder: (context, state) {
                  if (state is CarStateLoading) {
                    return const Loading();
                  } else if (state is CarStateLoadedAllCars) {
                    List<Car> cars = state.cars.toList();
                    return Container(
                      height: SizeConfig.screenHeight / 1.5,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: buildGridView(cars, 8),
                    );
                  } else {
                    return const Text("error");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}