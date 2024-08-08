part of 'home_cubit.dart';

class HomeState extends Equatable {
  final bool loading;
  final List<Company> companies;

  const HomeState({
    this.loading = false,
    this.companies = const [],
  });

  @override
  List<Object> get props => [loading, companies];

  HomeState copyWith({
    bool? loading,
    List<Company>? companies,
  }) {
    return HomeState(
      loading: loading ?? this.loading,
      companies: companies ?? this.companies,
    );
  }
}
