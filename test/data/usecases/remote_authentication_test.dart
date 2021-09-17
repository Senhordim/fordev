import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({
    required this.httpClient,
    required this.url,
  });

  Future<void>? auth() async {
    await httpClient.request(url: url, method: 'post');
  }
}

abstract class HttpClient {
  Future<void>? request({
    required String url,
    required String method,
  });
}

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  late HttpClientSpy httpClient;
  late RemoteAuthentication remoteAuthentication;
  late String url;

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    remoteAuthentication = RemoteAuthentication(
      httpClient: httpClient,
      url: url,
    );
  });

  test('Should call HttpClient with correct values', () async {
    await remoteAuthentication.auth();
    // expect(actual, matcher)
    verify(httpClient.request(
      url: url,
      method: 'post',
    ));
  });
}
