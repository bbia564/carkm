import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mileage_records/db_mileage/db_mileage.dart';
import 'package:mileage_records/pages/mileage_add/mileage_add_view.dart';
import 'package:mileage_records/pages/mileage_first/mileage_first_logic.dart';
import 'package:mileage_records/pages/mileage_first/mileage_first_view.dart';
import 'package:mileage_records/router/mileage_names.dart';

import '../../main.dart';
import '../mileage_second/mileage_second_view.dart';
import 'mileage_tab_logic.dart';

class MileageTabPage extends GetView<MileageTabLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          MileageFirstPage(),
          MileageAddPage(),
          MileageSecondPage(),
        ],
      ),
      bottomNavigationBar: Obx(()=>_navMileageBars()),
    );
  }

  Widget _navMileageBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled,color: Colors.grey.withOpacity(0.6)),
          activeIcon:Icon(Icons.home_filled,color: primaryColor),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon:Icon(Icons.add_circle,color: primaryColor,size: 42,),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings,color: Colors.grey.withOpacity(0.6)),
          activeIcon:Icon(Icons.settings,color: primaryColor),
          label: 'Setting',
        ),
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) async {
        if (index == 1) {
          DBMileage dbMileage = Get.find<DBMileage>();
          final list = await dbMileage.getTrafficAllData();
          if (list.isEmpty) {
            Fluttertoast.showToast(msg: 'Please add traffic first');
            return;
          }
          Get.toNamed(MileageNames.mileageAddPage,arguments: true)?.then((_) {
            MileageFirstLogic mileageFirstLogic = Get.find<MileageFirstLogic>();
            mileageFirstLogic.getData();
          });
        } else {
          controller.currentIndex.value = index;
          controller.pageController.jumpToPage(index);
        }
      },
    );
  }
}
