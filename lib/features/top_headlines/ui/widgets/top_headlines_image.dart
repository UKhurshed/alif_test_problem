import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TopHeadlineImage extends StatelessWidget {
  const TopHeadlineImage({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))),
        width: 90,
        height: 90,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.fitHeight,
            errorWidget: (context, error, stack) {
              return SizedBox(
                width: 90,
                height: 90,
                child: Image.asset('assets/images/default_img.png'),
              );
            },
          ),
        ),
      ),
    );
  }
}