import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;
import 'package:showroom/features/car/data/datasources/car_local_datasource.dart';
import 'package:showroom/features/car/data/datasources/car_remote_datasource.dart';
import 'package:showroom/features/car/data/models/car_model.dart';
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

var myInjection = GetIt.instance;

Future<void> init() async {
  //GENERAL Dependencies

  // HIVE
  Hive.registerAdapter(CarModelAdapter());
  //BOX
  var box = await Hive.openBox("car-box");
  myInjection.registerLazySingleton(() => box);

  // CLIENT
  myInjection.registerLazySingleton(() => http.Client());
  // FEATURE - PROFILE
  // bloc
  myInjection.registerFactory(() => CarBloc(
        getAllCar: myInjection(),
        getCarByName: myInjection(),
        getcarById: myInjection(),
      ));

  // use case
  myInjection.registerLazySingleton(
    () => GetAllCar(repository: myInjection()),
  );
  myInjection.registerLazySingleton(
    () => GetCarById(repository: myInjection()),
  );
  myInjection.registerLazySingleton(
    () => GetCarByName(repository: myInjection()),
  );

  //repository
  myInjection.registerLazySingleton<CarRepository>(() => CarRepositoryImpl(
        carRemoteDatasource: myInjection(),
        carLocalDatasource: myInjection(),
        box: myInjection(),
      ));

  // datasource
  myInjection.registerLazySingleton<CarLocalDatasource>(
    () => CarLocalDatasourceImplementation(box: myInjection()),
  );
  myInjection.registerLazySingleton<CarRemoteDatasource>(
    () => CarRemoteDatasourceImplementation(client: myInjection()),
  );

  // FEATURE - PAYMENT
  // bloc
  myInjection.registerFactory(() => PaymentBloc(
      getAllPayment: myInjection(),
      getPaymentById: myInjection(),
      getPaymentByType: myInjection()));

  // use case
  myInjection.registerLazySingleton(
    () => GetAllPayment(repository: myInjection()),
  );
  myInjection.registerLazySingleton(
    () => GetPaymentById(paymentRepository: myInjection()),
  );
  myInjection.registerLazySingleton(
    () => GetPaymentByType(paymentRepository: myInjection()),
  );

  // repository
  myInjection.registerLazySingleton<PaymentRepository>(
      () => PaymentRepositoryImpl(paymentRemoteDatasource: myInjection()));

  // datasource
  myInjection.registerLazySingleton<PaymentRemoteDatasource>(
    () => PaymentRemoteDatasourceImpl(client: myInjection()),
  );
}
