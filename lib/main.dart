import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:payung_pribadi/app/data/database/database_helper.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hanya untuk seed data sekali
  // final dbHelper = DatabaseHelper.instance;
  // await dbHelper.insertDataWellness();

  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
