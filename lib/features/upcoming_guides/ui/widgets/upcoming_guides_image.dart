import 'package:alif_test/core/utils/extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UpcomingGuidesImage extends StatelessWidget {
  const UpcomingGuidesImage({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.appWidth * 20.w),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))),
        width: context.appWidth * 90.w,
        height: context.appHeight * 90.h,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.fitHeight,
            errorWidget: (context, error, stack) {
              return SizedBox(
                width: context.appWidth * 90.w,
                height: context.appHeight * 90.h,
                child: Image.asset('assets/images/default_img.png'),
              );
            },
          ),
        ),
      ),
    );
  }
}
