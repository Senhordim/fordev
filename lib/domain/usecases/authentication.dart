import '../entities/entities.dart';

abstract class Authentication {
  Future<AccountEntities> auth(AuthenticationParams params);
}

class AuthenticationParams {
  final String email;
  final String password;

  AuthenticationParams({
    required this.email,
    required this.password,
  });

  Map toJson() => {'email': email, 'password': password};
}
