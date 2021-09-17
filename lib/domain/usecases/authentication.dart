import 'package:meta/meta.dart';

import '../entities/entities.dart';

abstract class Authentication {
  Future<AccountEntities> auth({
    @required String email,
    @required String password,
  });
}
