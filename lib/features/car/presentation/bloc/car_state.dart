part of 'car_bloc.dart';

abstract class CarState extends Equatable {}

class CarStateEmpty extends CarState {
  @override
  List<Object> get props => [];
}

class CarStateLoading extends CarState {
  @override
  List<Object> get props => [];
}

class CarStaterError extends CarState {
  final String message;

  CarStaterError(this.message);

  @override
  List<Object> get props => [message];
}

class CarStateLoadedAllCars extends CarState {
  final List<Car> cars;
  CarStateLoadedAllCars(this.cars);
  @override
  List<Object> get props => [cars];
}

class CarStateLoadedCarByName extends CarState {
  final List<Car> cars;
  CarStateLoadedCarByName(this.cars);
  @override
  List<Object> get props => [cars];
}

class CarStateLoadedCar extends CarState {
  final Car car;
  CarStateLoadedCar(this.car);
  @override
  List<Object> get props => [car];
}

class CarStateNotFound extends CarState {
  final String message;

  CarStateNotFound({required this.message});
  @override
  List<Object> get props => [message];
}
