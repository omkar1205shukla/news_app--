// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:news_assessment/features/news/data/client/api_service.dart'
    as _i574;
import 'package:news_assessment/features/news/data/repositories/news_repository_impl.dart'
    as _i585;
import 'package:news_assessment/features/news/domain/repositories/news_repository.dart'
    as _i121;
import 'package:news_assessment/features/news/domain/usecases/get_news_uc.dart'
    as _i775;
import 'package:news_assessment/features/news/presentation/bloc/news_bloc.dart'
    as _i104;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    await gh.factoryAsync<_i574.ApiService>(
      () => networkModule.apiService,
      preResolve: true,
    );
    gh.factory<_i121.NewsRepository>(
        () => _i585.NewsRepositoryImpl(apiService: gh<_i574.ApiService>()));
    gh.lazySingleton<_i775.GetNewsUseCase>(
        () => _i775.GetNewsUseCase(newsRepository: gh<_i121.NewsRepository>()));
    gh.factory<_i104.NewsBloc>(
        () => _i104.NewsBloc(getNewsUseCase: gh<_i775.GetNewsUseCase>()));
    return this;
  }
}

class _$NetworkModule extends _i574.NetworkModule {}
