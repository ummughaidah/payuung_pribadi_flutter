// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payung_pribadi/app/data/database/database_helper.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  TabController? tabController;

  TextEditingController? emailController;
  TextEditingController? passwordController;

  var wellnessList = <Map<String, dynamic>>[].obs;
  final dbHelper = DatabaseHelper.instance;

  final tabs = [
    const Tab(text: 'Payuung Pribadi'),
    const Tab(text: 'Payuung Karyawan')
  ];

  var isExpanded = false.obs;

  void setExpanded(bool value) {
    isExpanded.value = value;
  }

  void toggleSheet() {
    isExpanded.value = !isExpanded.value;
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabs.length, vsync: this);
    emailController = TextEditingController();
    passwordController = TextEditingController();
    fetchWellnessData();
  }

  @override
  void onClose() {
    super.onClose();
    tabController?.dispose();
    emailController?.dispose();
    passwordController?.dispose();
  }

  Future<void> fetchWellnessData() async {
    try {
      List<Map<String, dynamic>> data = await dbHelper.getDataWellness();
      wellnessList.value = data;
      debugPrint('Isi Data Wellness $data');
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
}
