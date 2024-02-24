import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_mobile_akhir/API/Product.dart';
import 'package:tugas_mobile_akhir/Binding&Controller/controller/fav_controller.dart';
import 'package:tugas_mobile_akhir/Model/FavModel.dart';

import '../../Model/MakeupaModel.dart';
import '../Carousel.dart';
import 'Makeup_page.dart';

class MobileProduct extends StatelessWidget {
  const MobileProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FavoriteController favoriteController = Get.put(FavoriteController());
    final MakeupApi apiController = Get.put(MakeupApi());

    return Obx(() {
      if (apiController.isOffline.value) {
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.signal_wifi_connected_no_internet_4_rounded,
                size: 72,
              ),
              SizedBox(height: 20),
              Text(
                'Internetmu putus',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
              ),
            ],
          ),
        );
      }

      return apiController.belajarApi.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Carousel(),
          Expanded(
            child: ProductListView(apiController.belajarApi),
          ),
        ],
      );
    });
  }
}

