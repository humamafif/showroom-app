import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:showroom/core/routes/my_router.dart';
import 'package:showroom/features/car/presentation/bloc/car_bloc.dart';
import 'package:showroom/features/payment/presentation/bloc/payment_bloc.dart';
import 'package:showroom/core/injection.dart';
import 'package:showroom/observer.dart';

void main() async {
  // WidgetsBinding widgetsFlutterBinding =
  //     WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsFlutterBinding);
  await Hive.initFlutter();
  await init();

  Bloc.observer = MyObserver();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    // initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CarBloc>(
          create: (context) => myInjection<CarBloc>()..add(CarEventGetCars()),
        ),
        BlocProvider<PaymentBloc>(
          create: (context) =>
              myInjection<PaymentBloc>()..add(PaymentEventGetPayments()),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
        debugShowCheckedModeBanner: false,
        routerConfig: MyRouter().router,
      ),
    );
  }
}
