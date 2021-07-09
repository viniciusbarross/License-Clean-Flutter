import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:license/modules/clientes/domain/entities/cidade.dart';
import 'package:license/modules/clientes/domain/entities/endereco.dart';
import 'package:license/modules/clientes/domain/errors/errors.dart';
import 'package:license/modules/clientes/domain/entities/cliente.dart';
import 'package:license/modules/clientes/domain/repositories/cliente_repository.dart';
import 'package:license/modules/clientes/domain/usecases/cliente_by_text.dart';

class ClienteRepositoryMock implements ClienteRepository {
  @override
  Future<Either<ExceptionCliente, List<Cliente>>> ClienteFind(
      String textCliente) async {
    final ipora =
        Cidade(nome: "Iporá", uf: 'Go', codmunibge: "123123123", cep: "762000");
    final jaupaci =
        Cidade(nome: "Jaupaci", uf: 'Go', codmunibge: "23465", cep: "765000");
    List<Cliente> clientes = [
      Cliente(
          nome: "vinicius",
          denome: "vinicius barros",
          rg: "123123",
          cgc: "SADFASDF",
          idcidade: 134,
          idempresa: 1,
          endereco: Endereco(
              logradouro: "Rua cairo",
              bairro: "Vila Brasíilia",
              cep: "123456",
              cidade: ipora))
    ];
    /* if (textCliente.length > 50) {
      return Left(ExceptionCliente('Nome superior ao permitido'));
    }*/
    clientes.where((element) => element.nome.contains(textCliente)).toList();
    return Right(clientes);
  }
}

void main() {
  final repository = ClienteRepositoryMock();
  final usercase = ClienteByTextImpl(repository);

  test('Deve passar texto para busca de cliente', () async {
    final result = await usercase("vinicius");
    expect(result, isA<Right>());
  });

  test('Deve dar erro ao passar texto para busca de cliente superior a 50',
      () async {
    final result = await usercase(
        "vinicius o lindo da parada é lindo demais da conta da conta da conta da conta da conta da conta");
    expect(result.isLeft(), true);
  });
}
