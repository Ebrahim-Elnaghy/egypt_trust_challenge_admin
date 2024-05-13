import 'package:dartz/dartz.dart';
import 'package:egypt_trust_challenge_admin/features/notifications/data/models/notification_request_body.dart';
import 'package:egypt_trust_challenge_admin/features/notifications/domain/repositories/notifications_domain_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failures/failures.dart';
import '../../../../core/usecases/param_use_case.dart';

@lazySingleton
class AddNotificationUseCase
    implements UseCase<void, AddNotificationRequestBody> {
  final NotificationsDomainRepo _notificationsDomainRepo;

  AddNotificationUseCase(this._notificationsDomainRepo);

  @override
  Future<Either<Failures, void>> call(AddNotificationRequestBody param) =>
      _notificationsDomainRepo.addNotification(param);
}
