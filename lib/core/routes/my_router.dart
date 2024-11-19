import 'package:go_router/go_router.dart';
import 'package:showroom/features/car/presentation/pages/home_pages.dart';
import 'package:showroom/features/payment/presentation/pages/order_details_page.dart';
import 'package:showroom/splash_screen.dart';
import 'package:showroom/features/common/widgets/bottom_navbar.dart';

class MyRouter {
  get router => GoRouter(
        initialLocation: "/",
        routes: [
          GoRoute(  
            path: "/",
            name: "splashscreen",
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SplashScreen(),
            ),
          ),
          GoRoute(
            path: "/home",
            name: "home",
            pageBuilder: (context, state) => const NoTransitionPage(
              child: BottomNavbar(),
            ),
          ),
          GoRoute(
            path: "/homepage",
            name: "homepage",
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HomePage(),
            ),
          ),
          GoRoute(
            path: '/orderdetail',
            name: 'orderdetail',
            pageBuilder: (context, state) {
              final data = state.extra as Map<String, dynamic>;
              final car = data["car"]!;
              final paymentMethod = data["paymentMethod"]!;
              return NoTransitionPage(
                child: OrderDetailsPage(car: car, paymentMethod: paymentMethod),
              );
            },
          ),
        ],
      );
}
