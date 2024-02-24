import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Binding&Controller/controller/fav_controller.dart';
import '../../Model/FavModel.dart';
import '../../Model/MakeupaModel.dart';

class ProductListView extends StatelessWidget {
  final List<BelajarApi> products;

  const ProductListView(this.products);

  @override
  Widget build(BuildContext context) {
    final FavoriteController favoriteController = Get.find();

    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final data = products[index];
        return Container(
          height: 100,
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            leading: Image.network(
              data.imageLink,
              width: 100,
              height: 100,
            ),
            title: Text(
              data.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2, // Add this line
            ),
            subtitle: Text(
              data.price + " Dollar",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            trailing: GestureDetector(
              onTap: () {
                favoriteController.tapLike(
                  Favorite(
                    id: data.id,
                    title: data.name,
                    harga: data.price,
                    image: data.imageLink,
                  ),
                );
              },
              child: Obx(() => Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: favoriteController.checkFavorite(data.id).value ? Colors.red.withOpacity(0.1) : Colors.transparent,
                ),
                child: Icon(
                  favoriteController.checkFavorite(data.id).value
                      ? Icons.favorite_rounded
                      : Icons.favorite_outline_rounded,
                  size: 20,
                  color: Colors.red,
                ),
              )),
            ),
          ),
        );
      },
    );
  }
}
