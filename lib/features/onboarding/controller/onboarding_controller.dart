import 'package:get/get.dart';
import 'package:rhythm_sync/constants/route/app_routes.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs;

  void updatePage(int index) {
    currentPage.value = index;
  }

  void skip() {
    Get.offAllNamed(AppRoutes.location); // Navigate to location screen
  }

  void nextOrFinish() {
    if (currentPage.value < 2) {
      currentPage.value++;
    } else {
      skip(); // Last page → go to location
    }
  }
}
