import 'package:dartz/dartz.dart';

import 'package:license/modules/login/domain/errors/errors.dart';
import 'package:license/modules/login/domain/repositories/token_jwt_repository.dart';
import 'package:license/modules/login/infra/datasources/auth_datasource_jwt.dart';

class TokenRepositoryImpl implements TokenJwtRepository {
  AuthDataSourceJwt dataSourceJwt;

  TokenRepositoryImpl(this.dataSourceJwt);

  @override
  Future<Either<ExceptionTokenJwt, String>> getToken(
      String username, String password) async {
    try {
      final token = await dataSourceJwt.login(username, password);
      return Right(token);
    } on ExceptionTokenJwt catch (e) {
      return Left(e);
    } on Exception catch (e) {
      return Left(ExceptionTokenJwt('Falha desconhecida para obter token'));
    }
  }
}
