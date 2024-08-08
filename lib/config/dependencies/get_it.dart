import 'package:get_it/get_it.dart';
import 'package:tractian/domain/domain.dart';
import 'package:tractian/ui/ui.dart';

final getIt = GetIt.instance;

void registerDependencies() {
  getIt
    // REPOSITORIES
    ..registerSingleton<AssetsRepository>(const AssetsRepository())
    ..registerSingleton<CompaniesRepository>(const CompaniesRepository())
    ..registerSingleton<LocationsRepository>(const LocationsRepository())
    // USE CASES
    ..registerFactory<GetCompanyData>(
      () => GetCompanyData(
        assetsRepository: getIt<AssetsRepository>(),
        locationsRepository: getIt<LocationsRepository>(),
      ),
    )
    ..registerFactory<ListCompanies>(
      () => ListCompanies(
        repository: getIt<CompaniesRepository>(),
      ),
    )
    // CUBITS
    ..registerFactory<CompanyCubit>(
      () => CompanyCubit(
        getCompanyData: getIt<GetCompanyData>(),
      ),
    )
    ..registerFactory<HomeCubit>(
      () => HomeCubit(
        listCompanies: getIt<ListCompanies>(),
      ),
    );
}
