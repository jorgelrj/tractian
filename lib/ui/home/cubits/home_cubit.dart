import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tractian/domain/domain.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ListCompanies _listCompanies;

  HomeCubit({
    required ListCompanies listCompanies,
  })  : _listCompanies = listCompanies,
        super(const HomeState()) {
    _init();
  }

  Future<void> _init() async {
    emit(state.copyWith(loading: true));

    final companies = await _listCompanies();

    emit(
      state.copyWith(
        loading: false,
        companies: companies,
      ),
    );
  }

  Future<void> refresh() async {
    emit(state.copyWith(companies: []));

    return _init();
  }

  void setCompanyData({
    required String id,
    required CompanyData data,
  }) {
    final companies = state.companies.map((company) {
      if (company.id != id) {
        return company;
      } else {
        return company.copyWith(
          locations: data.locations,
          assets: data.assets,
        );
      }
    });

    emit(
      state.copyWith(companies: companies.toList()),
    );
  }
}
