import '../models/notification_request_body.dart';

abstract class NotificationsDataSources {
  Future<void> addNotification(AddNotificationRequestBody addNotificationRequestBody);
}
