import 'package:flutter/material.dart';
import 'package:flutter_application_1/cart_shopping_page/cart_controller.dart';
import 'package:flutter_application_1/cart_shopping_page/cartpage.dart';
import 'package:flutter_application_1/cart_shopping_page/shopping_controller.dart';
import 'package:get/get.dart';

void main() => runApp(ShopPage());

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final shoppingController = Get.put(ShoppingController());

  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          Expanded(
            child: GetX<ShoppingController>(builder: (controller) {
              return ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.products[index].productName,
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                    controller
                                        .products[index].productDescription,
                                  ),
                                ],
                              ),
                              Text(
                                '${controller.products[index].price}',
                                style: TextStyle(fontSize: 24),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              cartController
                                  .addtoitem(controller.products[index]);
                            },
                            child: Text('Add to Cart'),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          SizedBox(
            height: 30,
          ),
          GetX<CartController>(builder: (controller) {
            return Text(
              'Total : ${controller.totalPrice}',
              style: TextStyle(
                fontSize: 30,
                color: Colors.amber,
              ),
            );
          })
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(() => CartPage());
        },
        label: GetX<CartController>(builder: (controller) {
          return Text(
            cartController.count.toString(),
          );
        }),
      ),
    );
  }
}
