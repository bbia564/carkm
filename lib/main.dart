import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mileage_records/db_mileage/db_mileage.dart';
import 'package:mileage_records/pages/mileage_add/mileage_add_binding.dart';
import 'package:mileage_records/pages/mileage_add/mileage_add_view.dart';
import 'package:mileage_records/pages/mileage_details/mileage_details_binding.dart';
import 'package:mileage_records/pages/mileage_details/mileage_details_view.dart';
import 'package:mileage_records/pages/mileage_fine/mileage_fine_binding.dart';
import 'package:mileage_records/pages/mileage_fine/mileage_fine_view.dart';
import 'package:mileage_records/pages/mileage_first/mileage_first_binding.dart';
import 'package:mileage_records/pages/mileage_first/mileage_first_view.dart';
import 'package:mileage_records/pages/mileage_second/mileage_second_binding.dart';
import 'package:mileage_records/pages/mileage_second/mileage_second_view.dart';
import 'package:mileage_records/pages/mileage_second/traffic_add/traffic_add_binding.dart';
import 'package:mileage_records/pages/mileage_second/traffic_add/traffic_add_view.dart';
import 'package:mileage_records/pages/mileage_tab/mileage_tab_binding.dart';
import 'package:mileage_records/pages/mileage_tab/mileage_tab_view.dart';
import 'package:mileage_records/router/mileage_names.dart';

import 'db_mileage/db_ns.dart';

Color primaryColor = const Color(0xff383c4b);
Color bgColor = const Color(0xffffffff);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBMileage().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Pages,
      initialRoute: MileageNames.init,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: const Color(0xfffcfcfc),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Pages = [
  GetPage(name: MileageNames.init, page: () => const MileageFineView(), binding: MileageFineBinding()),
  GetPage(name: MileageNames.mileageTabPage, page: () => MileageTabPage(), binding: MileageTabBinding()),
  GetPage(name: MileageNames.mileageFirstPage, page: () => MileageFirstPage(),binding: MileageFirstBinding()),
  GetPage(name: MileageNames.mileageSecondPage, page: () => MileageSecondPage(),binding: MileageSecondBinding()),
  GetPage(name: MileageNames.mileageAddPage, page: () => MileageAddPage(),binding: MileageAddBinding()),
  GetPage(name: MileageNames.trafficAddPage, page: () => TrafficAddPage(), binding: TrafficAddBinding()),
  GetPage(name: MileageNames.weight, page: () => const DbNs()),
  GetPage(name: MileageNames.mileageDetailsPage, page: () => MileageDetailsPage(),binding: MileageDetailsBinding())
];