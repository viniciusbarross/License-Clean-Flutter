import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:license/modules/login/domain/errors/errors.dart';
import 'package:license/modules/login/domain/repositories/token_jwt_repository.dart';
import 'package:license/modules/login/domain/usecases/token_by_params.dart';
import 'package:license/modules/login/external/auth_api/auth_api_jwt.dart';

const senhadia = '123'; //Implementar Util com senha do dia do softwork

class AuthJwtMock implements TokenJwtRepository {
  @override
  Future<Either<ExceptionTokenJwt, String>> getToken(
      String username, String password) async {
    if (password == '123456') {
      return Left(ExceptionTokenJwt('Senha inválida'));
    } else if (password != senhadia) {
      return Left(ExceptionTokenJwt('Senha incorreta'));
    }
    return Right('tokenblablabla');
  }
}

main() {
  final repository = AuthJwtMock();
  final usecase = TokenJwtByParamsImpl(repository);
  test('Verifica se token não será obtido com conforme parametros incorretos',
      () async {
    final result = await usecase('MSLicense', '123456');
    expect(result.isLeft(), true);
  });

  test('Verifica se token será obtido com conforme parametros de senha do dia',
      () async {
    final result = await usecase('MSLicense', senhadia);
    expect(result.isRight(), true);
  });

  test(
      'Verifica se token não será obtido com conforme parametros de senha do dia incorretos',
      () async {
    final result = await usecase('MSLicense', '12334');
    expect(result.isLeft(), true);
  });
}
