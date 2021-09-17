import '../http/http.dart';

import '../../domain/usecases/authentication.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({
    required this.httpClient,
    required this.url,
  });

  Future<void>? auth(AuthenticationParams params) async {
    await httpClient.request(
      url: url,
      method: 'post',
      body: params.toJson(),
    );
  }
}
