import 'package:dart_http_client/dart_http_client.dart';
import 'package:tractian/domain/domain.dart';

class AssetsRepository {
  const AssetsRepository();

  Future<List<Asset>> listAllByCompany(String companyId) async {
    final result = await ApiManager.request(
      endpoint: Endpoint(
        path: 'https://fake-api.tractian.com/companies/$companyId/assets',
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
            final Iterable list => list.cast<Map<String, dynamic>>().map(Asset.fromJson).toList(),
            _ => throw Exception('Unexpected response'),
          };
        } catch (e) {
          throw Exception('Error parsing response: $e');
        }
      },
    );
  }
}
