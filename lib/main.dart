import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rhythm_sync/constants/route/app_routes.dart';
import 'package:rhythm_sync/constants/route/page_route.dart';
import 'features/onboarding/view/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
        ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onboarding,
      getPages: AppPages.routes,
    );
  }
}


