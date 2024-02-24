import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_mobile_akhir/Pages/makeup_pages/makeup_view.dart';
import 'package:tugas_mobile_akhir/Pages/makeup_pages/Makeup.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed("/favorite");
            },
            icon: Icon(
              Icons.favorite,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Products(),
    );
  }
}
