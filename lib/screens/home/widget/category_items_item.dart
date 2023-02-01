
import 'package:evaluation/helpers/core_classes/pusher.dart';
import 'package:evaluation/helpers/custom_widgets/app_cached_image.dart';
import 'package:evaluation/helpers/custom_widgets/app_text.dart';
import 'package:evaluation/screens/home/bloc/product_model.dart';
import 'package:evaluation/screens/product_details/view/product_detail_view.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  Product ? product;
  ProductItem(this.product, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        pushAndRemoveUntil( ProductDetailView(productId:product?.id as int,name: product?.name??'',));
      },
      child: Container(
        height: 300,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          ),
          elevation: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height:200 ,
                  child: AppCashedImage(imageUrl:product?.image??'')),
              Padding(padding: EdgeInsetsDirectional.only(start: 10),
                  child: AppText(product?.name??'',fontWeight: FontWeight.bold,fontSize: 15,)),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 10),
                child: AppText((product?.price??'').toString(),fontWeight: FontWeight.bold,fontSize: 15,),
              )
            ],
          ),
        ),
      ),
    );
  }


}
