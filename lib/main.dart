import 'package:asignment/screens/tabscreen/charge_screen.dart';
import 'package:asignment/firebase_options.dart';
import 'package:asignment/screens/landing.dart';
import 'package:asignment/screens/splash_screen.dart';
import 'package:asignment/screens/tabscreen/home.dart';
import 'package:asignment/screens/tabscreen/mycar_screen.dart';
import 'package:asignment/services/i18n.dart';
import 'package:asignment/utils/shared_pref.dart';
import 'package:asignment/utils/stripe_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = StripeConfig.publishableKey;
  Stripe.merchantIdentifier ="test";

  await Stripe.instance.applySettings();

  await PreferencesService.initializeStorage();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ));
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          translations: Translation(),
          locale: const Locale("en", "US"),
          fallbackLocale: const Locale("en", "US"),
          debugShowCheckedModeBanner: false,
          title: 'Beep',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: SplashScreen(),
        );
      },
    );
  }
}
