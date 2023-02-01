import 'package:evaluation/screens/product_details/bloc/input_data.dart';

class ProductDetailEvents {}

class ProductDetailEventStart extends ProductDetailEvents {
   ProductDetailInputData? inputData;
   ProductDetailEventStart(this.inputData) ;
}

