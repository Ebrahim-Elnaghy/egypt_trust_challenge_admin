// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/notifications/data/datasources/notifications_data_sources.dart'
    as _i5;
import '../../features/notifications/data/datasources/notifications_remote_data_source.dart'
    as _i6;
import '../../features/notifications/data/repositories/notifications_data_repo.dart'
    as _i8;
import '../../features/notifications/domain/repositories/notifications_domain_repo.dart'
    as _i7;
import '../../features/notifications/domain/usecases/add_notifcation_use_case.dart'
    as _i9;
import '../api/api_service.dart' as _i4;
import 'injection_container.dart' as _i10;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i4.ApiService>(() => _i4.ApiService(gh<_i3.Dio>()));
    gh.lazySingleton<_i5.NotificationsDataSources>(() =>
        _i6.NotificationRemoteDataSources(apiService: gh<_i4.ApiService>()));
    gh.lazySingleton<_i7.NotificationsDomainRepo>(
        () => _i8.NotifcationsDataRepo(gh<_i5.NotificationsDataSources>()));
    gh.lazySingleton<_i9.AddNotificationUseCase>(
        () => _i9.AddNotificationUseCase(gh<_i7.NotificationsDomainRepo>()));
    return this;
  }
}

class _$RegisterModule extends _i10.RegisterModule {}
