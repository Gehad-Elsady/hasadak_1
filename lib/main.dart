import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hasadak_1/Auth/login-screen.dart';
import 'package:hasadak_1/Auth/signup-screen.dart';
import 'package:hasadak_1/Backend/firebase_options.dart';
import 'package:hasadak_1/OnBoarding/boarding-screen.dart';
import 'package:hasadak_1/SplashScreen/splash-screen.dart';
import 'package:hasadak_1/home-screen.dart';
import 'package:hasadak_1/provider/check-user.dart';
import 'package:hasadak_1/provider/finish-onboarding.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => FinishOnboarding()),
    ChangeNotifierProvider(create: (_) => CheckUser()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        OnboardingScreen.routeName: (context) => OnboardingScreen(),
        LoginPage.routeName: (context) => LoginPage(),
        SignUpPage.routeName: (context) => SignUpPage(),
      },
    );
  }
}
