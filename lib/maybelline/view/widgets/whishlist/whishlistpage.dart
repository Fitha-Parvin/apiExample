import 'package:apiexam/maybelline/view/widgets/whishlist/whishlistcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 // Adjust the import based on your project structure

class WishlistPage extends StatelessWidget {
  final WishlistController wishlistController = Get.find<WishlistController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: Obx(() {
        return wishlistController.wishlist.isEmpty
            ? Center(child: Text('Your wishlist is empty'))
            : ListView.builder(
          itemCount: wishlistController.wishlist.length,
          itemBuilder: (context, index) {
            final product = wishlistController.wishlist[index];
            return ListTile(
              leading: Image.network(product.imageLink),
              title: Text(product.name),
              subtitle: Text(product.price),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  wishlistController.removeFromWishlist(product);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
