import 'package:dart_http_client/dart_http_client.dart';
import 'package:tractian/domain/domain.dart';

class CompaniesRepository {
  const CompaniesRepository();

  Future<List<Company>> list() async {
    final result = await ApiManager.request(
      endpoint: Endpoint(
        path: 'https://fake-api.tractian.com/companies',
        method: const Get(),
      ),
    );

    return result.map(
      onError: (error) {
        throw Exception(error.message);
      },
      onSuccess: (success) {
        try {
          return switch (success.data) {
            final Iterable list => list.cast<Map<String, dynamic>>().map(Company.fromJson).toList(),
            _ => throw Exception('Unexpected response'),
          };
        } catch (e) {
          throw Exception('Error parsing response: $e');
        }
      },
    );
  }
}
