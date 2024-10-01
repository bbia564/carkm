import 'package:get/get.dart';

import 'mileage_second_logic.dart';

class MileageSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MileageSecondLogic());
  }
}
