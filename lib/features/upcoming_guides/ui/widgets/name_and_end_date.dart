import 'package:alif_test/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class NameAndEndDate extends StatelessWidget {
  const NameAndEndDate(
      {Key? key, required this.title, required this.description})
      : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            top: context.appHeight * 12.h,
            right: context.appWidth * 10.w,
            bottom: context.appWidth * 10.w),
        child: Column(
          children: [
            Text(title,
                maxLines: 1,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: context.appHeight * 10.h),
            Expanded(
                child: Text(
              description,
              maxLines: 4,
            ))
          ],
        ),
      ),
    );
  }
}
