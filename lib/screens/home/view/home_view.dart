import 'package:evaluation/helpers/custom_widgets/app_text.dart';
import 'package:evaluation/screens/home/bloc/bloc.dart';
import 'package:evaluation/screens/home/bloc/events.dart';
import 'package:evaluation/screens/home/bloc/input_data.dart';
import 'package:evaluation/screens/home/bloc/product_model.dart';
import 'package:evaluation/screens/home/bloc/states.dart';
import 'package:evaluation/screens/home/widget/category_items_item.dart';
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
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _inputData.categoryId=1;
    _bloc.add(ProductEventStart(_inputData));
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
      key: _key,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150), // Set this height
          child: Container(
            height: 80,
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.dehaze_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _key.currentState!.openDrawer();
                    },
                  ),
                  AppText(
                    'Asweome Store',
                    color: Colors.white,
                    fontSize: 15,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.white,
                    ),
                    onPressed: () {
                    },
                  ),
                ]),
          ),
        ),
      body: BlocBuilder(
      bloc: _bloc,
      builder: (context, state){
      if (state is ProductStateStart) {
        print('step1');
        return Center(child: CircularProgressIndicator());
      } else if (state is ProductStateSuccess) {
        print('step2'+(state.data?.success).toString());
        return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  mainAxisExtent: 300),
              itemCount: state.data!.data?.product?.length,
              itemBuilder: (_, index) => Padding(
                padding: const EdgeInsets.all(12.0),
                child: ProductItem(state.data!.data?.product![index])
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
