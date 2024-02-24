import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Binding&Controller/controller/makeup_controller.dart';
import '../tablet/Tablet_product.dart';
import 'Makeup.dart';

class Products extends GetView<ProductController> {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => controller.isMobileLayout.value
          ? const MobileProduct()
          : const TabletProduct(),
      ),
    );
  }
}
