import 'package:get/get.dart';
import 'package:time_planner/controllers/bindings/introduction_bindings.dart';
import 'package:time_planner/views/onboarding/onboarding_screen.dart';
import 'package:time_planner/views/onboarding/splash_screen.dart';

class Routes {
  static get getSplashScreenRoute => "/onboarding/splashscreen";
  static get getOnboardingRoute => "/onboarding/onboardingscreen";
  static get getLoginScreenRoute => "auth/loginscreen";
  static get getHomeScreenRoute => "/home/homescreen";

  static List<GetPage> routes = [
    GetPage(
      name: getSplashScreenRoute,
      page: () => SplashScreen(),
      binding: IntroductionModuleBinding(),
    ),
    GetPage(
      name: getOnboardingRoute,
      page: () => OnBoardingScreen(),
      binding: IntroductionModuleBinding(),
    ),
    // GetPage(
    //   name: getLoginScreenRoute,
    //   page: () => LoginScreen(),
    // )
  ];
}
