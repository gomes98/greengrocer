import 'package:get/get.dart';
import 'package:greengrocer/src/pages/auth/view/sign_up_screnn.dart';
import 'package:greengrocer/src/pages/auth/view/sing_in_screen.dart';
import 'package:greengrocer/src/pages/base/base_screen.dart';
import 'package:greengrocer/src/pages/base/binding/navigation_binding.dart';
import 'package:greengrocer/src/pages/cart/binding/cart_binding.dart';
import 'package:greengrocer/src/pages/home/binding/home_binding.dart';
import 'package:greengrocer/src/pages/orders/binding/orders_binding.dart';
import 'package:greengrocer/src/pages/product/product_screen.dart';
import 'package:greengrocer/src/pages/splash/splash_screen.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoutes.splashRoute,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: PagesRoutes.signInRoute,
      page: () => SignInScreen(),
    ),
    GetPage(
      name: PagesRoutes.signUpRoute,
      page: () => SignUpScreen(),
    ),
    GetPage(
        name: PagesRoutes.baseRoute,
        page: () => const BaseScreen(),
        bindings: [
          NavigationBinding(),
          HomeBinding(),
          CartBindind(),
          OrdersBinding(),
        ]),
    GetPage(
      name: PagesRoutes.productToute,
      page: () => ProductScreen(),
    ),
  ];
}

abstract class PagesRoutes {
  static const String signInRoute = '/signin';
  static const String signUpRoute = '/signup';
  static const String splashRoute = '/splash';
  static const String baseRoute = '/';
  static const String productToute = '/product';
}
