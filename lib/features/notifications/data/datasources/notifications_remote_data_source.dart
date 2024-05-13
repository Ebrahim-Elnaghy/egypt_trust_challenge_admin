import 'package:egypt_trust_challenge_admin/core/api/api_service.dart';
import 'package:egypt_trust_challenge_admin/features/notifications/data/models/notification_request_body.dart';
import 'package:injectable/injectable.dart';

import 'notifications_data_sources.dart';

@LazySingleton(as: NotificationsDataSources)
class NotificationRemoteDataSources implements NotificationsDataSources {
  final ApiService apiService;
  NotificationRemoteDataSources({
    required this.apiService,
  });

  @override
  Future<void> addNotification(
      AddNotificationRequestBody addNotificationRequestBody) async {
    await apiService.post(data: addNotificationRequestBody.toJson(), headers: {
      'Authorization':
          'key = AAAAx53g4pI:APA91bHfX_0AhxcIYp6JbghYe04N9n-zVul0C3Y7Jmue_ZDumB35p-j-phgBeO6w1A13ceNPrgYFACde1xtF2ez6poqiQDzBZjrax_WJ9PVA4d05l6OwlsEWkNPOlIosTE5t9VIxxFwC',
      'Content-Type': 'application/json'
    });
  }
}
