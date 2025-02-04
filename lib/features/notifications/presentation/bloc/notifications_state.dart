part of 'notifications_bloc.dart';

abstract class NotificationsState extends Equatable {
  const NotificationsState();

  @override
  List<Object> get props => [];
}

class NotificationsInitial extends NotificationsState {}

class NotificationsLoading extends NotificationsState {}

class NotificationsLoaded extends NotificationsState {
  final String message;
  const NotificationsLoaded({required this.message});
}

class NotificationsError extends NotificationsState {
  final String message;
  const NotificationsError({required this.message});
}
