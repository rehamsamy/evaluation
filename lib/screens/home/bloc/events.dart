import 'package:evaluation/screens/auth/bloc/input_data.dart';
import 'package:evaluation/screens/home/bloc/input_data.dart';

class ProductEvents {}

class ProductEventStart extends ProductEvents {
   ProductInputData? inputData;
  ProductEventStart(this.inputData) ;
}

