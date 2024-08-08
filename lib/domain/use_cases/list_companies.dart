import 'package:tractian/domain/domain.dart';

class ListCompanies {
  final CompaniesRepository _repository;

  const ListCompanies({
    required CompaniesRepository repository,
  }) : _repository = repository;

  Future<List<Company>> call() async {
    try {
      return await _repository.list();
    } catch (e) {
      throw Exception('Error listing companies: $e');
    }
  }
}
