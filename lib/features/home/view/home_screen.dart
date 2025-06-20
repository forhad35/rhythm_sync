import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import '../../alarm/controller/alarm_controller.dart';
import 'package:intl/intl.dart';
class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
  var address = Get.arguments;
   final AlarmController controller = Get.put(AlarmController());
   @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
appBar: AppBar(
  backgroundColor: Colors.transparent,
  leading: Text(""),
),
      body: Center(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width*0.93,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width*0.08),
                width: MediaQuery.sizeOf(context).width*0.9,
                child: _addressAddAlarm(context),
              ),
              const SizedBox(height: 24),
              const Text(
                "Alarms",
                style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Obx(()=>
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.alarms.length,
                    itemBuilder: (context, index) {
                      final alarm = controller.alarms[index];

                      String date = DateFormat('EEE dd MMM yyyy').format(alarm.time);

                      String time = DateFormat('hh:mm a').format(alarm.time);
                      return Container(
                        width: MediaQuery.sizeOf(context).width *0.95,
                        height: 70,
                        padding: const EdgeInsets.all(16),
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Color(0xFF3C3D3F),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              time,
                              style: const TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width*0.48,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    date,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 5,),
                                  SizedBox(width: 50,
                                    child:
                                      FlutterSwitch(
                                        value: alarm.enabled,
                                        onToggle: (val) => controller.toggleAlarm(index, val),
                                        width:35,
                                        height:20,
                                        toggleSize:12,
                                        activeColor: Color(0xFF7B4CDF),
                                        inactiveTextColor: Colors.grey.shade400,


                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
  _addressAddAlarm(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Text("Selected Location",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
      SizedBox.fromSize(size: Size(0, 15),),
      Row(
        children:  [
          Image.asset("assets/icons/location-01.png"),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              "$address",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 16),
      ElevatedButton(
      onPressed: () => controller.pickDateTime(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF3C3D3F),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Adjust the value as needed
          ),
          minimumSize: const Size(double.infinity, 48),
        ),
        child: const Text("Add Alarm"),
      ),
    ]);
  }

}
