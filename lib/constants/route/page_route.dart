import 'package:get/get.dart';
import 'package:rhythm_sync/features/home/view/home_screen.dart';


import '../../features/location/view/location_screen.dart';
import '../../features/onboarding/view/onboarding_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.onboarding,
      page: () =>  OnboardingScreen(),
    ),
    GetPage(
      name: AppRoutes.location,
      page: () => const LocationScreen(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () =>  HomeScreen(),
    ),
    // Add more GetPages here later
  ];
}
