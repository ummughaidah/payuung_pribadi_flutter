import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:payung_pribadi/app/modules/profile/views/profile_view.dart';
import 'package:payung_pribadi/app/theme/colors_theme.dart';
import 'package:payung_pribadi/app/widget/button_custom.dart';
import 'package:payung_pribadi/app/widget/form_field_widget.dart';
import 'package:payung_pribadi/app/widget/item_menu_widget.dart';
import 'package:payung_pribadi/app/widget/item_wellness_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorsTheme.primaryColor,
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selamat Siang',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Ummu',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          centerTitle: false,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
          actions: [
            Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications_none,
                      size: 32, color: Colors.white),
                  onPressed: () {},
                ),
                Positioned(
                  right: 7,
                  top: 7,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 13,
                      minHeight: 13,
                    ),
                    child: const Text(
                      '0',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            // Profile Picture
            InkWell(
              onTap: () {
                Get.to(() => const ProfileView());
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Text(
                    'U', // Inisial pengguna
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(30),
              child: Container(
                padding: const EdgeInsets.only(left: 30, bottom: 20),
              )),
        ),
        body: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Column(
            children: [
              // tab bar
              Container(
                margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
                height: kToolbarHeight - 8.0,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  color: ColorsTheme.unselectedTabBar,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: TabBar(
                    controller: controller.tabController,
                    indicator: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      color: ColorsTheme.primaryColor,
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: ColorsTheme.unselectedText,
                    tabs: controller.tabs,
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  controller: controller.tabController,
                  children: [
                    _contentPayuungPribadi(),
                    _contentPayuungKaryawan()
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget _contentPayuungPribadi() {
    return Stack(
      children: [
        SingleChildScrollView(
          padding:
              const EdgeInsets.only(top: 16, left: 0, right: 0, bottom: 64),
          child: Column(
            children: [
              _financialProduct(),
              const SizedBox(height: 13),
              _choiceCategory(),
              const SizedBox(height: 13),
              _exploreWellness(),
            ],
          ),
        ),
        DraggableScrollableSheet(
          initialChildSize: 0.15,
          minChildSize: 0.15,
          maxChildSize: 0.75,
          builder: (context, scrollController) {
            return _contentDraggableScrollabelSheet(context, scrollController);
          },
        )
      ],
    );
  }

  Widget _contentPayuungKaryawan() {
    return InkWell(
      onTap: () {
        Get.dialog(_alertPayuungKaryawan());
      },
    );
  }

  Widget _financialProduct() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Produk Keuangan',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          GridView.count(
            padding: const EdgeInsets.all(0),
            crossAxisCount: 4,
            shrinkWrap: true,
            crossAxisSpacing: 0,
            childAspectRatio: 0.85,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ItemMenuWidget(
                title: 'Urun',
                iconAsset: 'assets/icons/people-fill.svg',
                colorIcon: const Color.fromRGBO(121, 85, 72, 0.849),
                onTap: () {},
              ),
              ItemMenuWidget(
                title: 'Pembiayaan Porsi Haji',
                iconAsset: 'assets/icons/hajj.svg',
                colorIcon: Colors.green,
                onTap: () {},
              ),
              ItemMenuWidget(
                title: 'Financial Check Up',
                iconAsset: 'assets/icons/cash-coin.svg',
                colorIcon: Colors.yellow,
                onTap: () {},
              ),
              ItemMenuWidget(
                title: 'Asuransi Mobil',
                iconAsset: 'assets/icons/car-front-fill.svg',
                colorIcon: Colors.grey,
                onTap: () {},
              ),
              ItemMenuWidget(
                title: 'Asuransi Properti',
                iconAsset: 'assets/icons/house-gear-fill.svg',
                colorIcon: Colors.red,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _choiceCategory() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Kategori Pilihan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                width: 80,
                height: 20,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    color: ColorsTheme.unselectedText),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Wishlist'),
                    const SizedBox(width: 4),
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: ColorsTheme.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 13,
                        minHeight: 13,
                      ),
                      child: const Text(
                        '0',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          GridView.count(
            padding: const EdgeInsets.all(0),
            crossAxisCount: 4,
            shrinkWrap: true,
            crossAxisSpacing: 0,
            childAspectRatio: 0.85,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ItemMenuWidget(
                title: 'Hobi',
                iconAsset: 'assets/icons/umbrella-fill.svg',
                colorIcon: Colors.blue.shade400,
                onTap: () {},
              ),
              ItemMenuWidget(
                title: 'Merchandise',
                iconAsset: 'assets/icons/clothes.svg',
                colorIcon: Colors.blue.shade400,
                onTap: () {},
              ),
              ItemMenuWidget(
                title: 'Gaya Hidup Sehat',
                iconAsset: 'assets/icons/heart-pulse-fill.svg',
                colorIcon: Colors.red,
                onTap: () {},
              ),
              ItemMenuWidget(
                title: 'Konseling & Rohani',
                iconAsset: 'assets/icons/chat-right-fill.svg',
                colorIcon: Colors.blue.shade400,
                onTap: () {},
              ),
              ItemMenuWidget(
                title: 'Self Development',
                iconAsset: 'assets/icons/brain.svg',
                colorIcon: Colors.purple,
                onTap: () {},
              ),
              ItemMenuWidget(
                title: 'Perencanaan Keuangan',
                iconAsset: 'assets/icons/wallet-fill.svg',
                colorIcon: Colors.green.shade400,
                onTap: () {},
              ),
              ItemMenuWidget(
                title: 'Konsultasi Medis',
                iconAsset: 'assets/icons/prescription2.svg',
                colorIcon: Colors.green,
                onTap: () {},
              ),
              ItemMenuWidget(
                title: 'Lihat Semua',
                iconAsset: 'assets/icons/category.svg',
                // colorIcon: Colors.black.,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _exploreWellness() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Explore Wellness',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                width: 110,
                height: 25,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    color: ColorsTheme.unselectedText),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Terpopuler'),
                    SizedBox(width: 4),
                    Icon(Icons.expand_more)
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          // perlu API untuk terhubung ke database dan gunakan FutureBuilder untuk menampilkan data
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.8,
            ),
            itemCount: 6,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return const ItemWellnessWidget(
                title: 'Voucher Digital Indomaret Rp 25.000',
                price: 'Rp 25.000',
                image: 'assets/images/indomaret.jpeg',
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _contentDraggableScrollabelSheet(
      BuildContext context, ScrollController scrollController) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          border: Border.all(color: Colors.grey)),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -15,
            left: MediaQuery.of(context).size.width / 2 - 28, // Center the FAB
            child: Obx(() => FloatingActionButton(
                  onPressed: () {
                    controller.toggleSheet();
                  },
                  backgroundColor: Colors.white,
                  elevation: 0,
                  child: Icon(
                    controller.isExpanded.value
                        ? Icons.expand_more
                        : Icons.expand_less,
                    size: 30,
                    color: Colors.black,
                  ),
                )),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 5, left: 16, right: 16),
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34),
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                crossAxisSpacing: 0,
                childAspectRatio: 1,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ItemMenuWidget(
                    title: 'Beranda',
                    iconAsset: 'assets/icons/house-heart.svg',
                    colorIcon: ColorsTheme.primaryColor,
                    onTap: () {},
                  ),
                  ItemMenuWidget(
                    title: 'Cari',
                    iconAsset: 'assets/icons/search.svg',
                    onTap: () {},
                  ),
                  ItemMenuWidget(
                    title: 'Keranjang',
                    iconAsset: 'assets/icons/cart-plus.svg',
                    onTap: () {},
                  ),
                  ItemMenuWidget(
                    title: 'Daftar Transaksi',
                    iconAsset: 'assets/icons/wallet.svg',
                    onTap: () {},
                  ),
                  ItemMenuWidget(
                    title: 'Voucher Saya',
                    iconAsset: 'assets/icons/voucher.svg',
                    onTap: () {},
                  ),
                  ItemMenuWidget(
                    title: 'Alamat Pengiriman',
                    iconAsset: 'assets/icons/geo-alt.svg',
                    onTap: () {},
                  ),
                  ItemMenuWidget(
                    title: 'Daftar Teman',
                    iconAsset: 'assets/icons/people.svg',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _alertPayuungKaryawan() {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      actionsPadding: const EdgeInsets.only(bottom: 10),
      title: const Center(
          child: Text(
        'Masukkan email dan password Payuung Karyawan',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      )),
      content: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FormFieldWidget(
              controller: controller.emailController!,
              hintText: 'Alamat Email',
            ),
            FormFieldWidget(
              controller: controller.passwordController!,
              hintText: 'Password',
            ),
          ],
        ),
      ),
      actions: const [
        Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ButtonCustom(title: 'Sambungkan')),
                SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ButtonCustom(
                      title: 'Kembali',
                      colorText: Colors.black,
                      backgroundColor: Colors.white,
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
