import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationHeader extends StatelessWidget {
  const NotificationHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            height: 150.h,
            width: 200.w,
            image: const AssetImage(
                'assets/et.png')),
        Text(
          ' Egypt Trust Challenge',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          ' push notifications for Egypt Trust Users',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
