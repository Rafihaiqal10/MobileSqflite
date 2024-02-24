import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tugas_mobile_akhir/Pages/Carousel.dart';
import 'package:tugas_mobile_akhir/Pages/Home.dart';
import 'package:tugas_mobile_akhir/Pages/makeup_pages/Makeup.dart';
import 'package:tugas_mobile_akhir/Pages/makeup_pages/makeup_view.dart';
import 'API/Product.dart';
import 'Binding&Controller/Binding/fav_binding.dart';
import 'Binding&Controller/Binding/makeup_binding.dart';
import 'DB/db_helper.dart';
import 'Pages/Favorite_pages/Fav_view.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MakeupApi());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: "/products",
      getPages: [
        GetPage(
            name: "/products",
            page: () => Home(),
            binding: ProductBinding()),
        GetPage(
            name: "/carousel",
            page: () =>  Carousel(),
            binding: ProductBinding()),
        GetPage(
            name: "/favorite",
            page: () => const FavoritePages(),
            binding: FavoriteBinding()),
      ],
    );
  }
}
