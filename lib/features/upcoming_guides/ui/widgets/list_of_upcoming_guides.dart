import 'package:alif_test/core/utils/extensions.dart';
import 'package:alif_test/features/upcoming_guides/domain/entities/upcoming_guides.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class ListOfUpcomingGuides extends StatelessWidget {
  const ListOfUpcomingGuides({Key? key, required this.upcomingGuides})
      : super(key: key);
  final List<UpcomingGuides> upcomingGuides;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.appHeight * 10.h),
      child: ListView.separated(
        itemCount: upcomingGuides.length,
        itemBuilder: (context, index) {
          final item = upcomingGuides[index];
          return Container(
            height: context.appHeight * 120.h,
            decoration:
                BoxDecoration(border: Border.all(color: Colors.black26)),
            child: Row(
              children: [
                UpcomingGuidesImage(imageUrl: item.icon),
                SizedBox(width: context.appWidth * 20.w),
                NameAndEndDate(title: item.name, description: item.endDate)
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: context.appHeight * 8.h);
        },
      ),
    );
  }
}
