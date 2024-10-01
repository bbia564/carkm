import 'package:get/get.dart';

import 'traffic_add_logic.dart';

class TrafficAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TrafficAddLogic());
  }
}
