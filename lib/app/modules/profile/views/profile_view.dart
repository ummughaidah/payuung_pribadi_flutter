import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:payung_pribadi/app/theme/colors_theme.dart';
import 'package:payung_pribadi/app/widget/button_custom.dart';
import 'package:payung_pribadi/app/widget/drop_down_button_widget.dart';
import 'package:payung_pribadi/app/widget/form_field_widget.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              'Informasi Pribadi',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.chevron_left,
                color: Colors.black,
              ),
            )),
        body: Obx(() {
          return Column(
            children: [
              Container(
                height: kToolbarHeight,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Tab 1
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          controller.tabController?.animateTo(0);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: controller.visitedTabs[0]
                                  ? ColorsTheme.primaryColor
                                  : ColorsTheme.primaryColor.withOpacity(0.5),
                              child: const Text(
                                '1',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Expanded(
                              child: Text(
                                'Biodata Diri',
                                textAlign: TextAlign.center,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: ColorsTheme.primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Connector between Tab 1 and Tab 2
                    Expanded(
                      child: Container(
                        height: 4,
                        child: LinearProgressIndicator(
                          value: controller.selectedTabIndex.value == 0
                              ? 0.5
                              : 1.0,
                          backgroundColor:
                              ColorsTheme.primaryColor.withOpacity(0.5),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            controller.selectedTabIndex.value == 0
                                ? ColorsTheme.primaryColor
                                : ColorsTheme.primaryColor.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                    // Tab 2
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          controller.tabController?.animateTo(1);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: controller.visitedTabs[1]
                                  ? ColorsTheme.primaryColor
                                  : ColorsTheme.primaryColor.withOpacity(0.5),
                              child: const Text(
                                '2',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Expanded(
                              child: Text(
                                'Alamat Pribadi',
                                textAlign: TextAlign.center,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: ColorsTheme.primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Connector between Tab 2 and Tab 3
                    Expanded(
                      child: Container(
                        height: 4,
                        child: LinearProgressIndicator(
                          value: controller.selectedTabIndex.value == 1
                              ? 0.5
                              : 1.0,
                          backgroundColor:
                              ColorsTheme.primaryColor.withOpacity(0.5),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            controller.selectedTabIndex.value == 1
                                ? ColorsTheme.primaryColor
                                : ColorsTheme.primaryColor.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                    // Tab 3
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          controller.tabController?.animateTo(2);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: controller.visitedTabs[2]
                                  ? ColorsTheme.primaryColor
                                  : ColorsTheme.primaryColor.withOpacity(0.5),
                              child: const Text(
                                '3',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Expanded(
                              child: Text(
                                'Informasi Perusahaan',
                                textAlign: TextAlign.center,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    TextStyle(color: ColorsTheme.primaryColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  controller: controller.tabController,
                  children: [
                    _biodataDiri(context),
                    _alamatPribadi(context),
                    _informasiPribadi(context),
                  ],
                ),
              ),
            ],
          );
        }));
  }

  Widget _biodataDiri(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(
          top: 24.0, left: 16.0, right: 16.0, bottom: 24.0),
      child: Column(
        children: [
          FormFieldWidget(
            controller: controller.nameController!,
            starText: '* ',
            labelText: 'NAMA LENGKAP',
          ),
          const SizedBox(height: 10),
          FormFieldWidget(
            controller: controller.birthdayController!,
            starText: '* ',
            labelText: 'TANGGAL LAHIR',
            suffixIcon: IconButton(
                onPressed: () {
                  controller.pickedDatePicker(
                      context, controller.birthdayController);
                },
                icon: const Icon(Icons.date_range)),
          ),
          const SizedBox(height: 10),
          const DropDownButtondWidget(
            starText: '*',
            labelText: 'JENIS KELAMIN',
            hintText: 'Pilih',
            fieldHeight: 50,
          ),
          const SizedBox(height: 10),
          FormFieldWidget(
            controller: controller.emailController!,
            starText: '* ',
            labelText: 'ALAMAT EMAIL',
            readOnly: true,
          ),
          const SizedBox(height: 10),
          FormFieldWidget(
            controller: controller.nameController!,
            starText: '* ',
            labelText: 'NO. HP',
          ),
          const SizedBox(height: 10),
          const DropDownButtondWidget(
            labelText: 'PENDIDIKAN',
            hintText: 'Pilih',
            fieldHeight: 50,
          ),
          const SizedBox(height: 10),
          const DropDownButtondWidget(
            labelText: 'STATUS PERNIKAHAN',
            hintText: 'Pilih',
            fieldHeight: 50,
          ),
          const SizedBox(height: 16),
          SizedBox(
              width: double.infinity,
              height: 50,
              child: ButtonCustom(
                title: 'Selanjutnya',
                onTap: () {
                  controller.tabController?.animateTo(1);
                },
              ))
        ],
      ),
    );
  }

  Widget _alamatPribadi(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet<void>(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                context: Get.context!,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 200,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          _gambar(onTapGallery: () {
                            controller.openGallery();
                          }),
                          _kamera(onTapCamera: () {
                            controller.openCamera();
                          })
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Row(
              children: [
                Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: ColorsTheme.primaryColor.withOpacity(0.5),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5))),
                    child: SvgPicture.asset(
                      'assets/icons/person-vcard-fill.svg',
                      width: 10,
                      height: 20,
                      color: ColorsTheme.primaryColor,
                    )),
                const SizedBox(width: 8),
                const Text(
                  'Upload KTP',
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
          const SizedBox(height: 5),
          Text(
            controller.imagePicture?.value != ''
                ? '* KTP Anda sudah tersimpan'
                : '',
            style: const TextStyle(fontSize: 8, color: Colors.green),
          ),
          const SizedBox(height: 10),
          FormFieldWidget(
            controller: controller.nikController!,
            starText: '* ',
            labelText: 'NIK',
          ),
          const SizedBox(height: 10),
          FormFieldWidget(
            controller: controller.addressController!,
            starText: '* ',
            labelText: 'ALAMAT SESUAI KTP',
          ),
          const SizedBox(height: 10),
          const DropDownButtondWidget(
            starText: '* ',
            labelText: 'PROVINSI',
            hintText: 'Pilih',
            fieldHeight: 50,
          ),
          const SizedBox(height: 10),
          const DropDownButtondWidget(
            starText: '* ',
            labelText: 'KOTA/KABUPATEN',
            hintText: 'Pilih',
            fieldHeight: 50,
          ),
          const SizedBox(height: 10),
          const DropDownButtondWidget(
            starText: '* ',
            labelText: 'KECAMATAN',
            hintText: 'Pilih',
            fieldHeight: 50,
          ),
          const SizedBox(height: 10),
          const DropDownButtondWidget(
            starText: '* ',
            labelText: 'KELURAHAN',
            hintText: 'Pilih',
            fieldHeight: 50,
          ),
          const SizedBox(height: 10),
          FormFieldWidget(
            controller: controller.kodePosController!,
            starText: '* ',
            labelText: 'KODE POS',
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(
                () => Checkbox(
                  value: controller.isSelected.value,
                  onChanged: (bool? value) {
                    controller.isSelected.value = value!;
                  },
                  activeColor: ColorsTheme.primaryColor,
                  checkColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: ColorsTheme.primaryColor,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
              const Text('Alamat domisili sama dengan Alamat KTP'),
            ],
          ),
          // kondisi untuk checkbox
          Obx(() => controller.isSelected.value
              ? Container()
              : _addressNotSuitable()),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorsTheme.primaryColor),
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  child: ButtonCustom(
                    title: 'Sebelumnya',
                    colorText: ColorsTheme.primaryColor,
                    backgroundColor: Colors.white,
                    onTap: () {
                      controller.tabController?.animateTo(0);
                    },
                  )),
              const SizedBox(width: 8),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: 50,
                  child: ButtonCustom(
                    title: 'Selanjutnya',
                    onTap: () {
                      controller.tabController?.animateTo(2);
                    },
                  ))
            ],
          )
        ],
      ),
    );
  }

  Widget _addressNotSuitable() {
    return Column(
      children: [
        FormFieldWidget(
          controller: controller.addressController!,
          starText: '* ',
          labelText: 'ALAMAT DOMISILI',
        ),
        const SizedBox(height: 10),
        const DropDownButtondWidget(
          starText: '* ',
          labelText: 'PROVINSI',
          fieldHeight: 50,
        ),
        const SizedBox(height: 10),
        const DropDownButtondWidget(
          starText: '* ',
          labelText: 'KOTA/KABUPATEN',
          fieldHeight: 50,
        ),
        const SizedBox(height: 10),
        const DropDownButtondWidget(
          starText: '* ',
          labelText: 'KECAMATAN',
          fieldHeight: 50,
        ),
        const SizedBox(height: 10),
        const DropDownButtondWidget(
          starText: '* ',
          labelText: 'KELURAHAN',
          fieldHeight: 50,
        ),
        const SizedBox(height: 10),
        FormFieldWidget(
          controller: controller.kodePosController!,
          starText: '* ',
          labelText: 'KODE POS',
        ),
      ],
    );
  }

  Widget _gambar({required Null Function() onTapGallery}) {
    return InkWell(
      onTap: onTapGallery,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: const Row(
          children: [
            Icon(Icons.picture_in_picture),
            SizedBox(
              width: 10,
            ),
            Text('Gallery')
          ],
        ),
      ),
    );
  }

  Widget _kamera({required Null Function() onTapCamera}) {
    return InkWell(
      onTap: onTapCamera,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: const Row(
          children: [
            Icon(Icons.camera_alt),
            SizedBox(
              width: 10,
            ),
            Text('Kamera')
          ],
        ),
      ),
    );
  }

  Widget _informasiPribadi(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          FormFieldWidget(
            controller: controller.companyController!,
            labelText: 'NAMA USAHA / PERUSAHAAN',
          ),
          const SizedBox(height: 10),
          FormFieldWidget(
            controller: controller.addressCompanyController!,
            labelText: 'ALAMAT USAHA / PERUSAHAAN',
          ),
          const SizedBox(height: 10),
          const DropDownButtondWidget(
            labelText: 'JABATAN',
            hintText: 'Pilih',
            fieldHeight: 50,
          ),
          const SizedBox(height: 10),
          const DropDownButtondWidget(
            labelText: 'LAMA BEKERJA',
            hintText: 'Pilih',
            fieldHeight: 50,
          ),
          const SizedBox(height: 10),
          const DropDownButtondWidget(
            labelText: 'SUMBER PENDAPATAN',
            hintText: 'Pilih',
            fieldHeight: 50,
          ),
          const SizedBox(height: 10),
          const DropDownButtondWidget(
            labelText: 'PENDAPATAN KOTOR PERTAHUN',
            hintText: 'Pilih',
            fieldHeight: 50,
          ),
          const SizedBox(height: 10),
          const DropDownButtondWidget(
            labelText: 'NAMA BANK',
            hintText: 'Pilih',
            fieldHeight: 50,
          ),
          const SizedBox(height: 10),
          FormFieldWidget(
            controller: controller.cabangBankController!,
            labelText: 'CABANG BANK',
          ),
          const SizedBox(height: 10),
          FormFieldWidget(
            controller: controller.noRekBankController!,
            labelText: 'NOMOR REKENING',
          ),
          const SizedBox(height: 10),
          FormFieldWidget(
            controller: controller.namaPemilikRekeningController!,
            labelText: 'NAMA PEMILIK REKENING',
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorsTheme.primaryColor),
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  child: ButtonCustom(
                    title: 'Sebelumnya',
                    colorText: ColorsTheme.primaryColor,
                    backgroundColor: Colors.white,
                    onTap: () {
                      controller.tabController?.animateTo(1);
                    },
                  )),
              const SizedBox(width: 8),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: 50,
                  child: ButtonCustom(
                    title: 'Simpan',
                    onTap: () {}, // perlu API untuk menyimpan data
                  ))
            ],
          )
        ],
      ),
    );
  }
}
