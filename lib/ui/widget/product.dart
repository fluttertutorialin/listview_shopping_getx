import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Product extends StatelessWidget {
  final String? productName, productDescription;
  final double? price;
  final RxInt? quantity;
  final RxBool? isFavourite;
  final Function? favouriteCall, quantityAddCall, quantityMinusCall;

  Product(
      {required this.productName,
      required this.price,
      required this.productDescription,
      required this.isFavourite,
      required this.quantity,
      required this.favouriteCall,
      required this.quantityAddCall,
      required this.quantityMinusCall});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
            padding: EdgeInsets.all(5),
            child: Column(children: [
              Row(children: [
                //TODO PRODUCT IMAGE WIDGET
                CircleAvatar(radius: 25),
                SizedBox(width: 7),

                //TODO PRODUCT NAME, PRICE AND DESCRIPTION WIDGET
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(productName!,
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                      SizedBox(height: 3),
                      Text('Rs. ${price!}',
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                      SizedBox(height: 3),
                      Text('${productDescription!}',
                          style:
                              TextStyle(fontSize: 14, color: Colors.black54)),
                    ])),

                //TODO FAVOURITE WIDGET
                IconButton(
                    onPressed: () => favouriteCall!(),
                    icon: Obx(() => Icon(
                        isFavourite!.value
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.grey)))
              ]),
              SizedBox(height: 8),

              //TODO QUANTITY WIDGET
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                _quantityButtonWidget(
                    icon: '-', onTap: () => quantityMinusCall!()),
                SizedBox(width: 5),
                Obx(() => Text('${quantity!.value}')),
                SizedBox(width: 5),
                _quantityButtonWidget(
                    icon: '+', onTap: () => quantityAddCall!())
              ])
            ])));
  }
}

_quantityButtonWidget(
        {required Function? onTap, required String? icon}) =>
    InkWell(
        borderRadius: BorderRadius.circular(15.0),
        child: CircleAvatar(
            backgroundColor: Colors.blue.withOpacity(0.1),
            radius: 15,
            child: Text(icon!, style: TextStyle(color: Colors.blue))),
        onTap: () => onTap!());
