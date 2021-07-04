import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:license/modules/login/domain/errors/errors.dart';
import 'package:license/modules/login/domain/entities/usuario.dart';
import 'package:license/modules/login/domain/repositories/user_repository.dart';
import 'package:license/modules/login/domain/usecases/usuario_by_user.dart';
import 'package:mocktail/mocktail.dart';

class UserRepositoryMock /*extends Mock*/ implements UserRepository {
  @override
  Future<Either<ExceptionUser, List<Usuario>>> userFind(String userText) async {
    List<Usuario> usuarios = [
      Usuario(nome: 'vinicius', password: '123'),
      Usuario(nome: 'joao', password: '123')
    ];
    if (userText.length > 50) {
      return Left(ExceptionUser('Nome superior ao permitido'));
    }

    usuarios.where((element) => element.nome!.contains(userText)).toList();
    return Right(usuarios);
  }
}

main() {
  final repository = UserRepositoryMock();
  final usercase = UsuarioByUserImpl(repository);

  test('Deve trazer uma lista de usuarios', () async {
    final result = await usercase("vinicius");
    expect(result, isA<Right>());
  });

  test('Deve gerar exceção com nome superior a 50', () async {
    final result = await usercase(
        "viniciusbarrossilvafeereirateste talaçlsdkjfaçsldkfjaçsdlkfjaçsdlkfjasçdlfkjasçdflkjasdfçalskdj");
    expect(result.isLeft(), true);
  });

  test('Deve gerar exceção com nome em branco', () async {
    final result = await usercase("");
    expect(result.isLeft(), true);
  });
}
