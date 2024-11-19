part of 'car_bloc.dart';

abstract class CarEvent extends Equatable {}

class CarEventGetCars extends CarEvent {
  @override
  List<Object?> get props => [];
}

class CarEventGetCarById extends CarEvent {
  final int id;

  CarEventGetCarById({required this.id});

  @override
  List<Object?> get props => [id];
}

class CarEventGetCarByName extends CarEvent {
  final String name;

  CarEventGetCarByName({required this.name});

  @override
  List<Object?> get props => [name];
}

