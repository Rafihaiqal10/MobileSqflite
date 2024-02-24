import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import '../../Binding&Controller/controller/fav_controller.dart';
class MobileFavorite extends StatelessWidget {
  const MobileFavorite({super.key, required this.favoriteController});

  final FavoriteController favoriteController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
            () => favoriteController.isLoading.value
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : favoriteController.favorites.isEmpty
            ? const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.dangerous_outlined,
                color: Colors.red,
                size: 72,
              ),
              Text(
                'Item kosong',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
              ),
            ],
          ),
        )
            : ListView.builder(
          padding: const EdgeInsets.only(top: 45, bottom: 110),
          itemCount: favoriteController.favorites.length,
          itemBuilder: (context, index) {
            final data = favoriteController.favorites[index];
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white70,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFd5d5d5).withOpacity(1),
                    offset: const Offset(8, 8),
                    blurRadius: 50,
                    spreadRadius: -10,
                  ),
                ],
              ),
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Image.file(
                      File(data.image),
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.title,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.brown,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              data.harga,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.brown,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: IconButton(
                                  onPressed: () {
                                    AlertDialog alert = AlertDialog(
                                      backgroundColor: Colors.white,
                                      // Set background color
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16.0),
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Text(
                                              "Yakin mau di hapus?",
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                child: const Text(
                                                  "Batal",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  favoriteController.removeFavorite(data);
                                                  Get.back();
                                                },
                                                child: const Text(
                                                  "Hapus",
                                                  style: TextStyle(
                                                    color: Colors.pinkAccent,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );

                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return alert;
                                      },
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.favorite_rounded,
                                    size: 20,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
