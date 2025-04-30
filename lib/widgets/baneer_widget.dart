
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/baneers_controller.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  @override
  Widget build(BuildContext context) {
    final CarouselController carouselController=CarouselController();
    final BaneersController _bannerController=Get.put(BaneersController());
    return Container(
      child: Obx((){
        return CarouselSlider(items: _bannerController.bannerUrls.map((imageUrl)=>
        ClipRRect(borderRadius: BorderRadius.circular(10.0),
        child: CachedNetworkImage(imageUrl: imageUrl,fit: BoxFit.cover,width: Get.width-10,
        placeholder: (context,url)=>ColoredBox(color: Colors.white,child: Center(child: 
        CupertinoActivityIndicator()
        ,),
        ),
        errorWidget: (context,url,error)=>Icon(Icons.error),
        ),
        ),
        ).toList(),
         options: CarouselOptions(
            scrollDirection: Axis.horizontal,
            autoPlay: true,
            aspectRatio: 2.5,
            viewportFraction: 1,
         ),
         );
      }),
    );
  }
}