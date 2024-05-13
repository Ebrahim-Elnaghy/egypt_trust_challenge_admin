import 'package:egypt_trust_challenge_admin/features/Notifications/presentation/bloc/notifications_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class NotificationForm extends StatelessWidget {
  const NotificationForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationsBloc, NotificationsState>(
      listener: (context, state) {
        if (state is NotificationsLoaded) {
          context.read<NotificationsBloc>().add(ClearFields());
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              state.message,
            ),
            backgroundColor: Colors.green,
          ));
        }
        if (state is NotificationsError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              state.message,
            ),
            backgroundColor: Colors.red,
          ));
        }
      },
      builder: (context, state) {
        return Form(
            key: context.read<NotificationsBloc>().formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 32.h),
              child: Column(
                children: [
                  TextFormField(
                    controller: context.read<NotificationsBloc>().title,
                    onTapOutside: (event) =>
                        FocusManager.instance.primaryFocus?.unfocus(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: const OutlineInputBorder().copyWith(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                              width: 1.w, color: const Color(0xFFE0E0E0)),
                        ),
                        prefixIcon: const Icon(Iconsax.direct_right),
                        labelText: 'Title'),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  TextFormField(
                    controller: context.read<NotificationsBloc>().body,
                    onTapOutside: (event) =>
                        FocusManager.instance.primaryFocus?.unfocus(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: const OutlineInputBorder().copyWith(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                              width: 1.w, color: const Color(0xFFE0E0E0)),
                        ),
                        prefixIcon: const Icon(Iconsax.subtitle),
                        labelText: 'Body'),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          foregroundColor: const Color(0xFFF6F6F6),
                          backgroundColor: const Color(0xFF004182),
                          padding: EdgeInsets.symmetric(vertical: 18.h),
                          textStyle: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r)),
                        ),
                        onPressed: () {
                          context
                              .read<NotificationsBloc>()
                              .add(AddNotification());
                        },
                        child: state is NotificationsLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text('Add Notification')),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
