import 'package:get/get.dart';

import 'mileage_fine_logic.dart';

class MileageFineBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
