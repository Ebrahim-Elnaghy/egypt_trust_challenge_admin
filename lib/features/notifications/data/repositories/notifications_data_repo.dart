import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failures/failures.dart';
import '../../../../core/failures/server_failures.dart';
import '../../domain/repositories/notifications_domain_repo.dart';
import '../datasources/notifications_data_sources.dart';
import '../models/notification_request_body.dart';

@LazySingleton(as: NotificationsDomainRepo)
class NotifcationsDataRepo implements NotificationsDomainRepo {
  final NotificationsDataSources _notificationsDataSources;

  NotifcationsDataRepo(this._notificationsDataSources);

  @override
  Future<Either<Failures, void>> addNotification(
      AddNotificationRequestBody addNotificationRequestBody) async {
    try {
      return Right(
          await _notificationsDataSources.addNotification(addNotificationRequestBody));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailures.fromDioException(e));
      }
      return Left(ServerFailures(e.toString()));
    }
  }
}
