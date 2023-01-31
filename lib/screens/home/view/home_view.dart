import 'package:evaluation/screens/home/bloc/bloc.dart';
import 'package:evaluation/screens/home/bloc/events.dart';
import 'package:evaluation/screens/home/bloc/input_data.dart';
import 'package:evaluation/screens/home/bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _bloc = KiwiContainer().resolve<ProductBloc>();
  final _inputData = ProductInputData();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _inputData.categoryId=1;
    _bloc.add(ProductEventStart(_inputData));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
      bloc: _bloc,
      builder: (context, state){
      if (state is ProductStateStart) {
        return CircularProgressIndicator();
      } else if (state is ProductStateSuccess) {
        return Container(
          height: 200,
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  mainAxisExtent: 250),
              itemCount: state.data!.data?.product?.length,
              itemBuilder: (_, index) => Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(color: Colors.orange,
                width: 50,height: 100,)
               ),
              ),
        );
        //   ListView.builder(
        //   shrinkWrap: true,
        //   itemCount: state.data!.data?.product?.length,
        //   physics: NeverScrollableScrollPhysics(),
        //   scrollDirection: Axis.vertical,
        //   itemBuilder: (context, int index) {
        //     return Image.network(state.data!.data?.product![index].image ?? '');
        //   },
        // );
      } else if (state is ProductStateFailed) {
        return SizedBox();
        // return ServerErrorWidget(state.msg!, state.statusCode);
      } else {
        return SizedBox();
        // return CustomLoader();
      }

      },
      )
    );
  }
}
