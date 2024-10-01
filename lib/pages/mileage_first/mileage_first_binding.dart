import 'package:get/get.dart';

import 'mileage_first_logic.dart';

class MileageFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MileageFirstLogic());
  }
}
