import 'package:dartz/dartz.dart';
import 'package:license/modules/login/domain/entities/usuario.dart';
import 'package:license/modules/login/domain/errors/errors.dart';

abstract class UserRepository {
  Future<Either<ExceptionUser, List<Usuario>>> userFind(String userText);
}
