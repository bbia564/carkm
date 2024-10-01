import 'package:get/get.dart';

import 'mileage_add_logic.dart';

class MileageAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MileageAddLogic());
  }
}
