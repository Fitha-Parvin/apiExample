import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import '../../controller/controller.dart';
import '../widgets/productTile.dart';
import '../widgets/whishlist/whishlistcontroller.dart';
import '../widgets/whishlist/whishlistpage.dart';

void main() {
  runApp(
    GetMaterialApp(
      home: ProductHome(),
    ),
  );
}

class ProductHome extends StatefulWidget {
  @override
  State<ProductHome> createState() => _ProductHomeState();
}

class _ProductHomeState extends State<ProductHome> {
  final ProductController productController = Get.put(ProductController());
  final WishlistController wishlistController = Get.put(WishlistController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,
        leading: Icon(Icons.arrow_back_ios),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Get.to(WishlistPage());
            },
          ),
        ],
        bottom: AppBar(
          title: Text("Learn with Pradeep"),
          actions: [
            IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                // Handle list view icon press
              },
            ),
            IconButton(
              icon: Icon(Icons.grid_view),
              onPressed: () {
                // Handle grid view icon press
              },
            ),
          ],
        ),
      ),
      body: SizedBox(
        child: Obx(() {
          if (productController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.builder(
              itemCount: productController.productList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return ProductTile(
                  product: productController.productList[index],
                );
              },
            );
          }
        }),
      ),
    );
  }
}
