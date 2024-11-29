import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
// import 'package:showroom/features/authtest/data/datasources/auth_remote_datasource.dart';
// import 'package:showroom/features/authtest/data/repositories/user_repository_impl.dart';
// import 'package:showroom/features/authtest/domain/repositories/auth_repo.dart';
// import 'package:showroom/features/authtest/domain/usecases/login.dart';
// import 'package:showroom/features/authtest/domain/usecases/register.dart';
// import 'package:showroom/features/authtest/presentation/bloc/auth_bloc.dart';

import 'package:showroom/features/car/data/datasources/car_remote_datasource.dart';

import 'package:showroom/features/car/data/repositories/car_repository_impl.dart';
import 'package:showroom/features/car/domain/repositories/car_repository.dart';
import 'package:showroom/features/car/domain/usecases/get_all_car.dart';
import 'package:showroom/features/car/domain/usecases/get_car_by_id.dart';
import 'package:showroom/features/car/domain/usecases/get_car_by_name.dart';
import 'package:showroom/features/car/presentation/bloc/car_bloc.dart';
import 'package:showroom/features/payment/data/datasources/payment_remote_datasource.dart';
import 'package:showroom/features/payment/data/repositories/payment_repository_impl.dart';
import 'package:showroom/features/payment/domain/repositories/payment_repository.dart';
import 'package:showroom/features/payment/domain/usecases/get_all_payment.dart';
import 'package:showroom/features/payment/domain/usecases/get_payment_by_id.dart';
import 'package:showroom/features/payment/domain/usecases/get_payment_by_type.dart';
import 'package:showroom/features/payment/presentation/bloc/payment_bloc.dart';

var serviceLocator = GetIt.instance;

Future<void> init() async {
  //GENERAL Dependencies
  //secure storage
  serviceLocator.registerLazySingleton(() => const FlutterSecureStorage());

  // CLIENT
  serviceLocator.registerLazySingleton(() => http.Client());
  // FEATURE - CAR
  // bloc
  serviceLocator.registerFactory(() => CarBloc(
        getAllCar: serviceLocator(),
        getCarByName: serviceLocator(),
        getcarById: serviceLocator(),
      ));

  // use case
  serviceLocator.registerLazySingleton(
    () => GetAllCar(repository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => GetCarById(repository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => GetCarByName(repository: serviceLocator()),
  );

  //repository
  serviceLocator.registerLazySingleton<CarRepository>(() => CarRepositoryImpl(
        carRemoteDatasource: serviceLocator(),
      ));

  // datasource

  serviceLocator.registerLazySingleton<CarRemoteDatasource>(
    () => CarRemoteDatasourceImplementation(client: serviceLocator()),
  );

  // FEATURE - PAYMENT
  // bloc
  serviceLocator.registerFactory(() => PaymentBloc(
      getAllPayment: serviceLocator(),
      getPaymentById: serviceLocator(),
      getPaymentByType: serviceLocator()));

  // use case
  serviceLocator.registerLazySingleton(
    () => GetAllPayment(repository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => GetPaymentById(paymentRepository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => GetPaymentByType(paymentRepository: serviceLocator()),
  );

  // repository
  serviceLocator.registerLazySingleton<PaymentRepository>(
      () => PaymentRepositoryImpl(paymentRemoteDatasource: serviceLocator()));

  // datasource
  serviceLocator.registerLazySingleton<PaymentRemoteDatasource>(
    () => PaymentRemoteDatasourceImpl(client: serviceLocator()),
  );

  // // FEATURE - AUTH
  // // bloc
  // serviceLocator.registerFactory(() => AuthBloc(
  //       login: serviceLocator(),
  //       register: serviceLocator(),
  //     ));

  // // use case
  // serviceLocator.registerLazySingleton(
  //   () => Login(repository: serviceLocator()),
  // );
  // serviceLocator.registerLazySingleton(
  //   () => Register(repository: serviceLocator()),
  // );

  // //repository
  // serviceLocator.registerLazySingleton<AuthRepo>(() => UserRepositoryImpl(
  //       authRemoteDatasource: serviceLocator(),
  //     ));

  // // datasource
  // serviceLocator.registerLazySingleton<AuthRemoteDatasource>(
  //   () => AuthRemoteDatasourceImpl(client: serviceLocator()),
  // );
}
