import 'package:evaluation/helpers/core_classes/pusher.dart';
import 'package:evaluation/helpers/custom_widgets/app_cached_image.dart';
import 'package:evaluation/helpers/custom_widgets/app_text.dart';
import 'package:evaluation/screens/home/bloc/states.dart';
import 'package:evaluation/screens/home/view/home_view.dart';
import 'package:evaluation/screens/items/my_drawer.dart';
import 'package:evaluation/screens/product_details/bloc/bloc.dart';
import 'package:evaluation/screens/product_details/bloc/events.dart';
import 'package:evaluation/screens/product_details/bloc/input_data.dart';
import 'package:evaluation/screens/product_details/bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

class ProductDetailView extends StatefulWidget {
  int productId;
  String name;

  ProductDetailView({required this.productId,required this.name});

  @override
  State<ProductDetailView> createState() => _HomeViewState();
}

class _HomeViewState extends State<ProductDetailView> {
  final _bloc = KiwiContainer().resolve<ProductDetailBloc>();
  final _inputData = ProductDetailInputData();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  String? imageSelected;
  int? cirSelected;
  int? selectedIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _inputData.productId = widget.productId;
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
                    widget.name,
                    color: Colors.white,
                    fontSize: 15,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      pushAndRemoveUntil(const HomeView());
                    },
                  ),
                ]),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            BlocBuilder(
              bloc: _bloc,
              builder: (context, state) {
                if (state is ProductDetailStateStart) {
                  print('step1');
                  return Center(child: CircularProgressIndicator());
                } else if (state is ProductDetailStateSuccess) {
                  print('step2' + (state.data?.data?.image).toString());
                  return Column(
                    children: [
                      Stack(
                        // alignment:AlignmentDirectional.topStart,
                        children: [
                          Container(
                              height: 400,
                              width: width * 0.93,
                              child: AppCashedImage(
                                  imageUrl: imageSelected ??
                                      (state.data?.data?.image ?? ''))),
                          PositionedDirectional(
                            start: 5,
                            top: 80,
                            child: Container(
                              width: 75,
                              height: 350,
                              child: ListView.builder(
                                  itemCount:
                                      state.data?.data?.moreImage?.length,
                                  itemBuilder: (_, index) {
                                    return Column(
                                      children: [
                                        SizedBox(
                                            height: 100,
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    imageSelected = (state
                                                        .data
                                                        ?.data
                                                        ?.moreImage?[index]
                                                        .image)
                                                        .toString();
                                                    print('imagess ==> '+imageSelected.toString());
                                                  });
                                                },
                                                child: AppCashedImage(
                                                    imageUrl: state
                                                            .data
                                                            ?.data
                                                            ?.moreImage![index]
                                                            .image ??
                                                        ''))),
                                        SizedBox(
                                          height: 10,
                                        )
                                      ],
                                    );
                                  }),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AppText(
                            state.data?.data?.name ?? '',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          AppText('${ ((state.data?.data?.price).toString())} \$',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AppText(
                            state.data?.data?.category ?? '',
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                         SizedBox(width: 50,)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 150,
                            height: 50,
                            child: ListView.builder(scrollDirection: Axis.horizontal,
                                itemCount:state.data?.data?.color?.length ,
                                itemBuilder: (_,index){
                              String? hex=state.data?.data?.color?[index].hex;
                              int hexa=int.parse('0xff'+hex.toString());
                              return InkWell(
                                onTap: (){
                                  setState(() {
                                    cirSelected=state.data?.data?.color?[index].id;
                                    selectedIndex=index;
                                    print('cir  =>'+cirSelected.toString());
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Container(
                                    width: 20,
                                   height: 20,
                                   decoration: BoxDecoration(shape: BoxShape.circle
                                   ,color: Color(hexa)),
                                  ),
                                ),
                              );
                            }),
                          ),
                          Container(
                            width: 150,
                            height: 50,
                            child: ListView.builder(scrollDirection: Axis.horizontal,
                                itemCount:state.data?.data?.color?[selectedIndex??0].size?.length ,
                                itemBuilder: (_,index){
                                  String? hex=state.data?.data?.color?[selectedIndex??0].hex;
                                  int hexa=int.parse('0xff'+hex.toString());
                                  return Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                      width: 30,
                                      height: 20,
                                      decoration: BoxDecoration(shape: BoxShape.rectangle,
                                          border: Border.all(color: Colors.black)
                                          ,),
                                      child: Center(
                                        child:AppText(
                                          state.data?.data?.color?[selectedIndex??0].size?[index].name ?? '',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          )
                        ],
                      )
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
            ),
          ],
        ),
    drawer: MyDrawer(),);
  }

}
