import 'package:get/get.dart';

import '../../../model/model.dart';
 // Adjust the import based on your project structure

class WishlistController extends GetxController {
  var wishlist = <Product>[].obs;

  void addToWishlist(Product product) {
    if (!wishlist.contains(product)) {
      wishlist.add(product);
    }
  }

  void removeFromWishlist(Product product) {
    wishlist.remove(product);
  }
}
