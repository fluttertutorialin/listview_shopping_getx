import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listview_shopping_setstate/model/product_response.dart';

class ProductController extends GetxController {
  TextEditingController searchController = TextEditingController();

  var productList = <ProductResponse>[].obs;
  var productTempList = <ProductResponse>[];

  var totalAmount = RxDouble(0);

  @override
  void onInit() {
    super.onInit();
    //Get data
    var productData = _productData();

    //Store data
    productList.value = productData;
    productTempList = productData;
  }

  favourite(ProductResponse productResponse) {
    productResponse.isFavourite.value = !productResponse.isFavourite.value;
  }

  quantityAdd(ProductResponse productResponse) {
    productResponse.quantity++;
    _totalAmountGet();
  }

  quantityMinus(ProductResponse productResponse) {
    if (productResponse.quantity.value > 0) {
      productResponse.quantity--;
      _totalAmountGet();
    }
  }

  productNameSearch(String name) {
    if (name.isEmpty) {
      productList.value = productTempList;
    } else {
      productList.value = productTempList
          .where((element) =>
              element.productName.toLowerCase().contains(name.toLowerCase()))
          .toList();
    }
  }

  _totalAmountGet() {
    totalAmount.value = productList.fold(0, (previous, current) => previous + current.price * current.quantity.value);
  }
}

_productData() => [
      ProductResponse(
          id: '1',
          productName: 'Apple',
          productDescription:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
          price: 250),
      ProductResponse(
          id: '2',
          productName: 'Banana',
          productDescription:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
          price: 40),
      ProductResponse(
          id: '3',
          productName: 'Mango',
          productDescription:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
          price: 100),
    ];
