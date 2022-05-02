import 'dart:io';

import 'package:athanasia/controllers/excel_controller.dart';
import 'package:athanasia/controllers/product_controller.dart';
import 'package:athanasia/controllers/setting_controller.dart';
import 'package:athanasia/views/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:window_size/window_size.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  if (Platform.isWindows) {
    setWindowTitle('PIEC : Product information Excel file converter');
    //setWindowMaxSize(const Size(1920, 1080));
    setWindowMinSize(const Size(1024, 768));
  }

  // 폰트 라이센스 추가
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/fonts/nanum/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      home: Home(),
      initialBinding: BindingsBuilder(() {
        Get.put(SettingController());
        Get.put(ProductController());
        Get.put(ExcelController());
      }),
      theme: ThemeData(
        fontFamily: 'Nanum',
        primarySwatch: Colors.blueGrey,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.grey[200],
        /*textSelectionTheme: const TextSelectionThemeData(
          cursorColor: ConstColors.primary,
        ),*/
        appBarTheme: const AppBarTheme(
          elevation: 0,
        ),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
