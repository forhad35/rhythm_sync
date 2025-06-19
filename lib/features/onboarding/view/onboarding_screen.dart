import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/onboarding_controller.dart';
import '../model/onboarding_model.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final controller = Get.put(OnboardingController());

  final List<OnboardingModel> pages = [
    OnboardingModel(
      title: "Sync with Nature’s Rhythm",
      description:
      "Experience a peaceful transition into the evening with an alarm that aligns with the sunset.\nYour perfect reminder, always 15 minutes before sundown.",
      imageAsset: "assets/images/onboarding1.gif",
    ),
    OnboardingModel(
      title: "Effortless & Automatic",
      description:
      "No need to set alarms manually. Wakey calculates the sunset time for your location and alerts you on time.",
      imageAsset: "assets/images/onboarding2.gif",
    ),

    OnboardingModel(
      title: "Relax & Unwind",
      description:
      "hope to take the courage to pursue your dreams.",
      imageAsset: "assets/images/onboarding3.gif",
    ),
    // Add more pages if needed
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.8,
              child: PageView.builder(
                itemCount: pages.length,
                onPageChanged: controller.updatePage,
                itemBuilder: (context, index) {
                  final model = pages[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Stack(
                        children: [
                          SafeArea(
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(32),
                                bottomRight: Radius.circular(32)
                              ),
                              child: Image.asset(
                                model.imageAsset,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: 20,
                            child: TextButton(
                              onPressed: controller.skip,
                              child: const Text(
                                "Skip",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                model.title,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                model.description,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pages.length,
                    (dotIndex) => Obx(() {
                  final isActive =
                      controller.currentPage.value == dotIndex;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      color: isActive
                          ? Colors.purple
                          : Colors.white30,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.sizeOf(context).width*0.90,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: controller.nextOrFinish,
                child: const Text("Next"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
