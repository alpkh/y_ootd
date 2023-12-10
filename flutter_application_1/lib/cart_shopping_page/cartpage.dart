import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cart_controller.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('장바구니'),
      ),
      body: Obx(
        () {
          if (cartController.count == 0) {
            return Center(
              child: Text(
                'This Cart is Empty !',
              ),
            );
          } else {
            return ListView.builder(
              itemCount: cartController.cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(cartController.cartItems[index].productName),
                    subtitle: Text('${cartController.cartItems[index].price}'),
                    trailing: IconButton(
                      onPressed: () {
                        cartController.cartItems
                            .remove(cartController.cartItems[index]);
                      },
                      icon: Icon(Icons.delete),
                    ));
              },
            );
          }
        },
      ),
    );
  }
}
