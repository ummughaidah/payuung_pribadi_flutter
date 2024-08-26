// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  TabController? tabController;

  TextEditingController? emailController;
  TextEditingController? passwordController;

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
  }

  @override
  void onClose() {
    super.onClose();
    tabController?.dispose();
    emailController?.dispose();
    passwordController?.dispose();
  }
}
