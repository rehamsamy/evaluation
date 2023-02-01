import 'package:evaluation/helpers/custom_widgets/app_cached_image.dart';
import 'package:evaluation/screens/home/bloc/bloc.dart';
import 'package:evaluation/screens/home/bloc/events.dart';
import 'package:evaluation/screens/home/bloc/input_data.dart';
import 'package:evaluation/screens/home/bloc/product_model.dart';
import 'package:evaluation/screens/home/bloc/states.dart';
import 'package:evaluation/screens/home/widget/category_items_item.dart';
import 'package:evaluation/screens/product_details/bloc/bloc.dart';
import 'package:evaluation/screens/product_details/bloc/events.dart';
import 'package:evaluation/screens/product_details/bloc/input_data.dart';
import 'package:evaluation/screens/product_details/bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({Key? key}) : super(key: key);

  @override
  State<ProductDetailView> createState() => _HomeViewState();
}

class _HomeViewState extends State<ProductDetailView> {
  final _bloc = KiwiContainer().resolve<ProductDetailBloc>();
  final _inputData = ProductDetailInputData();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _inputData.productId=9;
    _bloc.add(ProductDetailEventStart(_inputData));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bloc.close();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
      bloc: _bloc,
      builder: (context, state){
      if (state is ProductDetailStateStart) {
        print('step1');
        return Center(child: CircularProgressIndicator());
      } else if (state is ProductDetailStateSuccess) {
        print('step2'+(state.data?.data?.image).toString());
        return Column(
          children: [
         AppCashedImage(imageUrl: state.data?.data?.image??'')
          ],
        );
      } else if (state is ProductStateFailed) {
        print('step3');
        return SizedBox();
        // return ServerErrorWidget(state.msg!, state.statusCode);
      } else {
        print('step4');
        return SizedBox();
        // return CustomLoader();
      }

      },
      )
    );
  }
}
