import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rhythm_sync/constants/route/app_routes.dart';
import 'package:rhythm_sync/constants/route/page_route.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'features/alarm/model/alarm_model.dart';
import 'features/alarm/service/alarm_service.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  Hive.registerAdapter(AlarmModelAdapter());
  await Hive.openBox<AlarmModel>('alarms');
  // Timezone Initialization
  tz.initializeTimeZones();

  //  Local Notification Initialization
  await AlarmService.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          fontFamily:  'Poppins'
        ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onboarding,
      getPages: AppPages.routes,
    );
  }
}


