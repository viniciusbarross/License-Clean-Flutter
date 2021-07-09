import 'package:dartz/dartz.dart';

import 'package:license/modules/login/domain/errors/errors.dart';
import 'package:license/modules/login/domain/repositories/token_jwt_repository.dart';

abstract class TokenJwtByParams {
  Future<Either<ExceptionTokenJwt, String>> call(
      String username, String password);
}

class TokenJwtByParamsImpl implements TokenJwtByParams {
  TokenJwtRepository repository;
  TokenJwtByParamsImpl(this.repository);

  @override
  Future<Either<ExceptionTokenJwt, String>> call(
      String username, String password) async {
    if (username.isEmpty || password.isEmpty) {
      return Left(ExceptionTokenJwt('Parametros Usuario/Senha não informdos'));
    }
    return this.repository.getToken(username, password);
  }
}
