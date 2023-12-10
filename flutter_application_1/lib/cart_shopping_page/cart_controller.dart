import 'package:get/get.dart';
import 'product.dart';

class CartController extends GetxController {
  List cartItems = <Product>[].obs;

  double get totalPrice => cartItems.fold(0, (e, item) => e + item.price);

  int get count => cartItems.length;

  void addtoitem(Product product) {
    cartItems.add(product);
  }
}
