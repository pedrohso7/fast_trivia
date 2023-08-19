import 'package:fast_trivia/core/bindings/app_bindings.dart';
import 'package:fast_trivia/core/routes/home_routes.dart';
import 'package:fast_trivia/core/themes/default_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  //Bindinds
  WidgetsFlutterBinding.ensureInitialized();

  //Device Orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  //Local Storage
  await GetStorage.init();

  //Execute
  runApp(const FastTrivia());
}

class FastTrivia extends StatelessWidget {
  const FastTrivia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fast Trivia',
      debugShowCheckedModeBanner: false,
      theme: DefaultTheme.theme,
      initialBinding: AppBindings(),
      initialRoute: '/home',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      getPages: [
        ...HomeRoutes.routers,
      ],
    );
  }
}
