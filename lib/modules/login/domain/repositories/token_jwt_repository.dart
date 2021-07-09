import 'package:dartz/dartz.dart';
import 'package:license/modules/login/domain/errors/errors.dart';

abstract class TokenJwtRepository {
  Future<Either<ExceptionTokenJwt, String>> getToken(
      String username, String password);
}
