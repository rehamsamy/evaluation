
import 'package:evaluation/helpers/custom_widgets/app_cached_image.dart';
import 'package:evaluation/screens/home/bloc/product_model.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  Product ? product;
  ProductItem(this.product, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          AppCashedImage(imageUrl:product?.image??'')
        ],
      ),
    );
  }
}
