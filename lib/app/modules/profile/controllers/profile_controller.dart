// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ProfileController extends GetxController
    with SingleGetTickerProviderMixin {
  TabController? tabController;
  RxInt selectedTabIndex = 0.obs;
  RxList<bool> visitedTabs = [true, false, false].obs;

  TextEditingController? nameController;
  TextEditingController? birthdayController;
  TextEditingController? emailController;
  TextEditingController? phoneController;
  TextEditingController? nikController;
  TextEditingController? addressController;
  TextEditingController? kodePosController;
  TextEditingController? companyController;
  TextEditingController? addressCompanyController;
  TextEditingController? cabangBankController;
  TextEditingController? noRekBankController;
  TextEditingController? namaPemilikRekeningController;

  RxList<String>? genderController = <String>[].obs;

  final RxBool isSelected = true.obs;
  RxString? imagePicture = ''.obs;

  final tabs = [
    const Tab(text: '1'),
    const Tab(text: '2'),
    const Tab(text: '3'),
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    // mengubah tab
    tabController?.addListener(() {
      selectedTabIndex.value = tabController?.index ?? 0;
      visitedTabs[selectedTabIndex.value] = true;
    });

    nameController = TextEditingController();
    birthdayController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    nikController = TextEditingController();
    addressController = TextEditingController();
    kodePosController = TextEditingController();
    companyController = TextEditingController();
    addressCompanyController = TextEditingController();
    cabangBankController = TextEditingController();
    noRekBankController = TextEditingController();
    namaPemilikRekeningController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    tabController?.dispose();
    nameController?.dispose();
    birthdayController?.dispose();
    emailController?.dispose();
    phoneController?.dispose();
    nikController?.dispose();
    addressController?.dispose();
    kodePosController?.dispose();
    companyController?.dispose();
    addressCompanyController?.dispose();
    cabangBankController?.dispose();
    noRekBankController?.dispose();
    namaPemilikRekeningController?.dispose();
  }

  void openGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePicture!.value = image.path;
      Get.back();
    }
  }

  void openCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      imagePicture!.value = photo.path;
      Get.back();
    }
  }

  pickedDatePicker(
      BuildContext context, TextEditingController? controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
      fieldLabelText: 'Tanggal Lahir',
    );

    if (pickedDate != null) {
      String formatedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      controller?.text = formatedDate;
      update();
    }
  }
}
