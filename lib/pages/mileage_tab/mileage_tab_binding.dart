import 'package:get/get.dart';
import 'package:mileage_records/pages/mileage_second/mileage_second_logic.dart';

import '../mileage_first/mileage_first_logic.dart';
import 'mileage_tab_logic.dart';

class MileageTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MileageTabLogic());
    Get.lazyPut(() => MileageFirstLogic());
    Get.lazyPut(() => MileageSecondLogic());
  }
}
