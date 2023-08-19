import 'package:fast_trivia/features/home/presenter/home_bindings.dart';
import 'package:fast_trivia/features/home/presenter/home_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class HomeRoutes {
  HomeRoutes._();
  static final routers = <GetPage>[
    GetPage(
      name: '/home',
      binding: HomeBindings(),
      page: () => const HomePage(),
    ),
  ];
}
