import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tractian/domain/domain.dart';
import 'package:tractian/ui/company/company.dart';

part 'company_state.dart';

class CompanyCubit extends Cubit<CompanyState> {
  final GetCompanyData getCompanyData;

  CompanyCubit({
    required this.getCompanyData,
  }) : super(const CompanyState());

  Future<void> loadData(
    String companyId, {
    Company? company,
  }) async {
    if (company != null && (company.assets.isNotEmpty || company.locations.isNotEmpty)) {
      emit(
        state.copyWith(
          locations: company.locations,
          rootAssets: company.assets,
        ),
      );

      return;
    }

    emit(state.copyWith(loading: true));

    final data = await getCompanyData(companyId);

    emit(
      state.copyWith(
        loading: false,
        locations: data.locations,
        rootAssets: data.assets,
      ),
    );
  }

  void setTitleFilter(String title) {
    emit(state.copyWith(titleFilter: title));
  }

  void setStatusFilter(AssetStatus? status) {
    emit(state.copyWith(statusFilter: () => status));
  }

  void setTypeFilter(SensorType? type) {
    emit(state.copyWith(typeFilter: () => type));
  }
}
