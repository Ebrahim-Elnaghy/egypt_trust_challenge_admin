import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';
import '../../data/models/notification_request_body.dart';

abstract class NotificationsDomainRepo {
  Future<Either<Failures, void>> addNotification(
      AddNotificationRequestBody addNotificationRequestBody);
}
