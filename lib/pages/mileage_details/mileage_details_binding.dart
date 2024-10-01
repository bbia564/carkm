import 'package:get/get.dart';

import 'mileage_details_logic.dart';

class MileageDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MileageDetailsLogic());
  }
}
