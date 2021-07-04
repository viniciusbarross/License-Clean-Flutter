import 'package:dartz/dartz.dart';
import 'package:license/modules/login/domain/entities/usuario.dart';
import 'package:license/modules/login/domain/errors/errors.dart';
import 'package:license/modules/login/domain/repositories/user_repository.dart';

abstract class UsuarioByUser {
  Future<Either<ExceptionUser, List<Usuario>>> call(String userText);
}

class UsuarioByUserImpl implements UsuarioByUser {
  UserRepository repository;

  UsuarioByUserImpl(this.repository);

  @override
  Future<Either<ExceptionUser, List<Usuario>>> call(String userText) async {
    if (userText.length > 30) {
      return Left(
          ExceptionUser('Campo superior ao tamanho permitido. 30 Caracteres'));
    }
    if (userText.isEmpty) {
      return Left(ExceptionUser('Não foi informado nenhum valor'));
    }
    return this.repository.userFind(userText);
  }
}
