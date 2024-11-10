

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/image.dart' as wimage;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:velocity_x/velocity_x.dart';

import 'home_model.dart';

class HomeDetailsScreen extends StatelessWidget {
  const HomeDetailsScreen({super.key, required this.homeData});
  final HomeModel homeData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: homeData.show!.name!.text.bold.capitalize.center.make(),
      ),
      body: SafeArea(child:
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 24),
        child: ListView(
          children: [
            20.h.heightBox,
            wimage.Image(image: NetworkImage(homeData.show!.image!.medium!),height: 400,fit: BoxFit.fill,).cornerRadius(20),
            20.h.heightBox,
            'ABOUT'.text.bold.letterSpacing(1).xl3.make(),
            5.h.heightBox,
            HtmlWidget(homeData.show!.summary!),
            10.h.heightBox,
            'Language : ${homeData.show!.language}'.text.xl.bold.make(),
            5.h.heightBox,
            'Rating         :  ${homeData.show!.rating!.average.toString()}'.text.make(),
            5.h.heightBox,
            'Genres        :  ${homeData.show!.genres}'.text.make(),
            5.h.heightBox,
            'OfficialSite : ${homeData.show!.url}'.text.make()


            
          ],
        ),
      )),
    );
  }
}