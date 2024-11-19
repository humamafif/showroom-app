// car_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:showroom/core/error/failure.dart';
import 'package:showroom/features/car/domain/entities/car.dart';
import 'package:showroom/features/car/domain/usecases/get_all_car.dart';
import 'package:showroom/features/car/domain/usecases/get_car_by_id.dart';
import 'package:showroom/features/car/domain/usecases/get_car_by_name.dart';

part 'car_event.dart';
part 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final GetAllCar getAllCar;
  final GetCarById getcarById;
  final GetCarByName getCarByName;

  CarBloc({
    required this.getAllCar,
    required this.getCarByName,
    required this.getcarById,
  }) : super(CarStateEmpty()) {
    on<CarEventGetCars>((event, emit) async {
      emit(CarStateLoading());
      Either<Failure, List<Car>> resultGetAllCar = await getAllCar.execute();
      resultGetAllCar.fold(
        (failure) {
          emit(CarStaterError("Cannot Get All Car"));
        },
        (cars) {
          emit(CarStateLoadedAllCars(cars));
        },
      );
    });

    on<CarEventGetCarById>((event, emit) async {
      emit(CarStateLoading());
      Either<Failure, Car> resultGetCarById = await getcarById.execute(event.id);
      resultGetCarById.fold(
        (failure) {
          emit(CarStaterError("Cannot get car by id"));
        },
        (car) {
          emit(CarStateLoadedCar(car));
        },
      );
    });

    on<CarEventGetCarByName>((event, emit) async {
      emit(CarStateLoading());

      Either<Failure, List<Car>> resultGetCarByName = await getCarByName.execute(event.name);
      resultGetCarByName.fold(
        (failure) {
          emit(CarStaterError("Cannot get car by name"));
        },
        (cars) {
          emit(CarStateLoadedCarByName(cars));
        },
      );
    });
  }
}