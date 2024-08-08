import 'package:dart_http_client/dart_http_client.dart';
import 'package:tractian/domain/domain.dart';

class LocationsRepository {
  const LocationsRepository();

  Future<List<Location>> listAllByCompany(String companyId) async {
    final result = await ApiManager.request(
      endpoint: Endpoint(
        path: 'https://fake-api.tractian.com/companies/$companyId/locations',
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
            final Iterable list => list.cast<Map<String, dynamic>>().map(Location.fromJson).toList(),
            _ => throw Exception('Unexpected response'),
          };
        } catch (e) {
          throw Exception('Error parsing response: $e');
        }
      },
    );
  }
}
