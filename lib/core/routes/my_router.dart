import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:showroom/features/auth/presentation/pages/login_page.dart';
import 'package:showroom/features/auth/presentation/pages/profile_page.dart';
import 'package:showroom/features/car/presentation/pages/all_car_page.dart';
import 'package:showroom/features/car/presentation/pages/home_pages.dart';
import 'package:showroom/features/payment/presentation/pages/order_details_page.dart';
import 'package:showroom/splash_screen.dart';
import 'package:showroom/features/common/widgets/bottom_navbar.dart';

class MyRouter {
  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  // Home
  static final _shellNavigatorHome = GlobalKey<NavigatorState>(
    debugLabel: 'Home',
  );

  // Search
  static final _shellNavigatorSearch = GlobalKey<NavigatorState>(
    debugLabel: 'Search',
  );

  // Profile
  static final _shellNavigatorProfile = GlobalKey<NavigatorState>(
    debugLabel: 'Profile',
  );

  get router => GoRouter(
        navigatorKey: _rootNavigatorKey,
        initialLocation: "/",
        routes: [
          GoRoute(
            parentNavigatorKey: _rootNavigatorKey,
            path: "/",
            name: "splashscreen",
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SplashScreen(),
            ),
          ),
          StatefulShellRoute.indexedStack(
              builder: (context, state, navigationShell) {
                return BottomNavbar(
                  navigationShell: navigationShell,
                  scaffoldKey: _scaffoldKey,
                );
              },
              branches: [
                StatefulShellBranch(navigatorKey: _shellNavigatorHome, routes: [
                  GoRoute(
                    parentNavigatorKey: _shellNavigatorHome,
                    path: "/homepage",
                    name: "homepage",
                    pageBuilder: (context, state) => const NoTransitionPage(
                      child: HomePage(),
                    ),
                  ),
                ]),
                StatefulShellBranch(
                    navigatorKey: _shellNavigatorSearch,
                    routes: [
                      GoRoute(
                        parentNavigatorKey: _shellNavigatorSearch,
                        path: "/search",
                        name: "search",
                        pageBuilder: (context, state) => const NoTransitionPage(
                          child: AllCarPage(),
                        ),
                      ),
                    ]),
                StatefulShellBranch(
                  navigatorKey: _shellNavigatorProfile,
                  routes: [
                    GoRoute(
                      parentNavigatorKey: _shellNavigatorProfile,
                      path: '/profile',
                      name: 'profile',
                      pageBuilder: (context, state) => const NoTransitionPage(
                        child: ProfilePage(),
                      ),
                    )
                  ],
                ),
              ]),
          GoRoute(
            parentNavigatorKey: _rootNavigatorKey,
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
          GoRoute(
            parentNavigatorKey: _rootNavigatorKey,
            path: '/login',
            name: 'login',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: LoginPage(),
            ),
          ),
        ],
      );
}
