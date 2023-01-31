import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImagesSlider extends StatefulWidget {
  const ImagesSlider({Key? key, required this.sliders, this.isFromHome = false})
      : super(key: key);
  final List<MySlider> sliders;
  final bool isFromHome;

  @override
  State<ImagesSlider> createState() => _ImagesSliderState();
}

class _ImagesSliderState extends State<ImagesSlider> {
  final sliderController = CarouselController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          carouselController: sliderController,
          items: List.generate(
              widget.sliders.length,
              (index) => Container(
                    height: 322.h,
                    decoration: BoxDecoration(
                        borderRadius: widget.isFromHome
                            ? null
                            : BorderRadius.only(
                                bottomRight: Radius.circular(40.w),
                                bottomLeft: Radius.circular(40.w)),
                        border: Border.all(
                            color: const Color(
                              0xffF3F3F3,
                            ),
                            width: .5),
                        image: DecorationImage(
                            image: NetworkImage(widget.sliders[index].media),
                            fit: BoxFit.fill)),
                  )),
          options: CarouselOptions(
            autoPlay: true,
            viewportFraction: 1,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              _currentIndex = index;
              setState(() {});
            },
            initialPage: 0,
          ),
        ),
        // widget.isFromHome
        //     ? Padding(
        //         padding: EdgeInsetsDirectional.only(top: 71.h, bottom: 73.h),
        //         child: Text(LocaleKeys.stableOffers.tr(),
        //             style: TextStyle(
        //                 fontSize: 15.sp,
        //                 fontFamily: FontFamily.bold,
        //                 height: 2,
        //                 color: Colors.white)),
        //       )
        //     : const SizedBox.shrink(),
        Padding(
          padding: EdgeInsets.only(bottom: 4.h),
          child: DotsIndicator(
            dotsCount: widget.sliders.length,
            position: _currentIndex.toDouble(),
            decorator: DotsDecorator(
                activeColor: Colors.white, color: Colors.white.withOpacity(.5)),
          ),
        ),
      ],
    );
  }
}

class MySlider {
  MySlider({
    required this.id,
    required this.media,
  });

  int id;
  String media;

  factory MySlider.fromJson(Map<String, dynamic> json) => MySlider(
        id: json["id"],
        media: json["media"],
      );
}
