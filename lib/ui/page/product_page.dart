import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listview_shopping_setstate/ui/widget/product.dart';
import '../../controller/product_controller.dart';
import '../widget/text_field_search.dart';

class ProductPage extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('ListView Shopping GetX')),
        bottomNavigationBar: Container(
            padding: EdgeInsets.all(10),
            color: Colors.grey.withOpacity(0.1),
            height: 40,
            child: Align(
                alignment: Alignment.bottomRight,
                child: Obx(
                    () => Text('Total Amount: ${controller.totalAmount}')))),
        body: Column(children: [
          TextFieldSearch(
              textEditingController: controller.searchController,
              isPrefixIconVisible: true,
              onChanged: controller.productNameSearch),
          Expanded(
              child: Obx(() => ListView(shrinkWrap: true, children: [
                    ...controller.productList
                        .map((e) => Product(
                            productName: e!.productName,
                            productDescription: e.productDescription,
                            price: e.price,
                            quantity: e.quantity!,
                            isFavourite: e.isFavourite!,
                            favouriteCall: () => controller.favourite(e),
                            quantityAddCall: () => controller.quantityAdd(e),
                            quantityMinusCall: () =>
                                controller.quantityMinus(e)))
                        .toList()
                  ])))
        ]));
  }
}
