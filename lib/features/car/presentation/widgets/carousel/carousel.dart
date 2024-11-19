import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:showroom/features/car/presentation/bloc/car_bloc.dart';
import 'package:showroom/core/injection.dart';
import 'package:showroom/features/car/presentation/widgets/carousel/image_carousel_gradient.dart';
import 'package:showroom/features/common/widgets/loading.dart';

class CarouselHeader extends StatelessWidget {
  const CarouselHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarBloc, CarState>(
      bloc: myInjection<CarBloc>()..add(CarEventGetCars()),
      builder: (context, state) {
        if (state is CarStateLoading) {
          return const Loading();
        } else if (state is CarStaterError) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is CarStateLoadedAllCars) {
          final carShuffle = state.cars.toList()..shuffle();
          final car = carShuffle.take(5).toList();
          return FlutterCarousel(
            options: FlutterCarouselOptions(
              height: MediaQuery.of(context).size.height / 5,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 10),
              autoPlayCurve: Easing.standard,
              autoPlayAnimationDuration: const Duration(seconds: 3),
              viewportFraction: 0.85,
              enlargeCenterPage: true,
              indicatorMargin: 8.0,
              enableInfiniteScroll: true,
              initialPage: 2,
              showIndicator: false,
            ),
            items: car.map((car) {
              return Builder(
                builder: (BuildContext context) {
                  return ImageCarouselGradient(car: car);
                },
              );
            }).toList(),
          );
        } else {
          return const Center(
            child: Text("Car not found"),
          );
        }
      },
    );
  }
}
