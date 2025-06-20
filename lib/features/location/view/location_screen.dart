import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../networks/get_current_location.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E), // Dark background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 60),
              const Text(
                "Welcome! Your\nPersonalized Alarm",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Allow us to sync your sunset alarm\nbased on your location.",
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              const SizedBox(height: 40),
              ClipOval(
                child: Image.asset(
                  'assets/images/morning2.png',
                  height: MediaQuery.sizeOf(context).height*0.3,
                  width: MediaQuery.sizeOf(context).width*0.3,
                  fit: BoxFit.cover,
                ),
              ),
              const Spacer(),
              ElevatedButton.icon(
                onPressed: ()async {
                   determinePosition().then((address){
                     Get.toNamed("/home",arguments:address);

                   });
                },
                label: const Text("Use Current Location",style: TextStyle(fontSize: 15),),
                icon: Image.asset("assets/icons/location-05.png",width: 20,),
                iconAlignment: IconAlignment.end,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4D4D4D),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  // Get.toNamed("/home");
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFF4D4D4D),
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("Home"),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
