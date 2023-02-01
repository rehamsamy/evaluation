
import 'package:evaluation/screens/auth/bloc/bloc.dart';
import 'package:evaluation/screens/home/bloc/bloc.dart';
import 'package:evaluation/screens/product_details/bloc/bloc.dart';
import 'package:kiwi/kiwi.dart';

void initKiwi() {
  KiwiContainer container = KiwiContainer();
  container.registerFactory((c) => LoginBloc());
  container.registerFactory((c) => ProductBloc());
  container.registerFactory((c) => ProductDetailBloc());
  // container.registerFactory((container) => AppInitBloc());
}
