import 'package:egypt_trust_challenge_admin/core/di/injection_container.dart';
import 'package:egypt_trust_challenge_admin/features/Notifications/presentation/bloc/notifications_bloc.dart';
import 'package:egypt_trust_challenge_admin/features/Notifications/presentation/widgets/notification_form.dart';
import 'package:egypt_trust_challenge_admin/features/Notifications/presentation/widgets/notification_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => NotificationsBloc(addNotificationUseCase: getIt()),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                top: 56.h, bottom: 24.h, right: 24.w, left: 24.w),
            child: const Column(
              children: [
                NotificationHeader(),
                NotificationForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
