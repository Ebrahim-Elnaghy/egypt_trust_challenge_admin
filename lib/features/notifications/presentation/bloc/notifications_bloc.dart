import 'package:bloc/bloc.dart';
import 'package:egypt_trust_challenge_admin/features/notifications/data/models/notification_request_body.dart';
import 'package:egypt_trust_challenge_admin/features/notifications/domain/usecases/add_notifcation_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final AddNotificationUseCase _addNotificationUseCase;
  final formKey = GlobalKey<FormState>();
  final title = TextEditingController();
  final body = TextEditingController();

  NotificationsBloc({required AddNotificationUseCase addNotificationUseCase})
      : _addNotificationUseCase = addNotificationUseCase,
        super(NotificationsInitial()) {
    on<AddNotification>((event, emit) async {
      await _addAddNotification(emit);
    });

    on<ClearFields>((event, emit) async {
      title.clear();
      body.clear();
    });
  }

  Future<void> _addAddNotification(Emitter<NotificationsState> emit) async {
    if (formKey.currentState!.validate()) {
      emit(NotificationsLoading());
      final result = await _addNotificationUseCase
          .call(AddNotificationRequestBody(title: title.text, body: body.text));
      result.fold(
        (l) => emit(const NotificationsError(message: ' something went wrong')),
        (r) => emit(const NotificationsLoaded(message: ' added successfully')),
      );
    }
  }
}
